# Main machine learning trunk 
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
    To provide a prototype where machine learning take place 
"""

import abc
import random
import datetime
import os
import json
import pickle
import functools

import numpy as np
import multiprocessing as mp
from itertools import product
from multiprocessing import Pool
from nltk.metrics.scores import (
    precision, recall, f_measure, accuracy
)
from nltk.metrics import ConfusionMatrix

from contrai_cradle.preprocessing import TRAINING_INGREDIENT_PATH
from contrai_cradle.db.db_connector import CONN
from contrai_cradle.db.config import EVL_TABLE
from contrai_cradle.tagging import LABEL_VALUE_MAP
from contrai_cradle.config.constants import *

# W2V_MODEL = gensim.models.KeyedVectors.load_word2vec_format(
#   # '/home/vagrant/sync/testfield/google_word2vec/GoogleNews-vectors-negative300.bin.gz', 
#   # '/home/vagrant/sync/testfield/google_word2vec/word2vec_SLIM_10000',
#   # '/home/vagrant/sync/testfield/google_word2vec/GoogleNews-vectors-negative300-SLIM.bin.gz',
#   # '/home/vagrant/sync/testfield/models/word2vec/legal_vs_300_wind_7.bin.gz',    
#   # '/home/vagrant/sync/testfield/models/word2vec/legal_vs_300_wind_7.bin.gz',
#   binary=True
# )



class MLAbstract(object):
    """
    Machine learning base class 
    """
    _model = None
    # _param_c = 0.4
    def __init__(
        self, 
        preprocessing_id, 
        topic, k, embedding_method, 
        note, save_model, param_c, param_max_iter
    ):
        """
        @data: observation of text and words with labels, data 
        to derive training and testing dataset
        @train_sample_ratio: #{training sample}/#{all samples}
        """
        self._preprocessing_id = preprocessing_id
        self._topic = topic
        self._observation = self._load_data()
        self._k = int(k)
        self._param_c = float(param_c)
        self._param_max_iter = int(param_max_iter)
        # print(self._k)
        # print(self._param_c)
        self._save_model_bool = save_model
        self._embedding_method = embedding_method
        self._train_sample_ratio = 1 - 1 / self._k
        # self.training_accuracy_q = Queue()
        # self.testing_accuracy_q = Queue()
        self._note = note
        self._training_start = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        self.cross_validation()
        # self._preprocessing_start = prev_output.preprocessing_start
        # self._preprocessing_end = prev_output.preprocessing_end
        self._training_end = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        self._save_model()
        self._testing_start = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")

        # self._test(self._observation, 'test')
        # self._test(self._traindata)
        # self._test(self._testdata)
        self._testing_end = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # TODO: plot figures
        self.vis_path = ""
        self._save_result()

    def _get_topic_id(self):
        return LABEL_VALUE_MAP[self._topic]

    def _load_data(self):
        """
        Load data for training and testing
        """
        # get sample filename 
        filenames = CONN.get_sample_filename_by_id(
            self._preprocessing_id
        )
        filename = filenames[0][0]

        filepath = os.path.join(
            os.getcwd(),
            TRAINING_INGREDIENT_PATH,
            filename
        )
        json_string = open(filepath, 'r').read()
        data = json.loads(json_string)
        if self._topic:
            topic_id = self._get_topic_id()
            for entry in data:
                if entry[1] != topic_id:
                    entry[1] = -1
        return data

    def _sampling(self, data, train_sample_ratio):
        """
        To split sample to training and testing data
        with a given ratio
        """
        train_data = []
        test_data = []

        all_data_index = range(1, len(data))
        self._train_data_num = round(len(data) * train_sample_ratio)
        self._test_data_num = len(data) - self._train_data_num
        train_data_index = random.sample(all_data_index, self._train_data_num)
        for i in all_data_index:
            if i in train_data_index:
                train_data.append(data[i])
            else:
                test_data.append(data[i])

        return train_data, test_data

    @abc.abstractmethod
    def _train(self, trainset):
        """
        Training function to be wrapped
        """
        return

    def _test(self, data, sample_type):
        # print("Classic Naive Bayes accuracy precent:", 
        #       (nltk.classify.accuracy(self._model, self._testdata))*100)
        reference = [x[1] for x in data]
        predictions = []
        for x in data:
            predictions.append(self._model.classify(x[0]))
        reference_set = set(reference)
        prediction_set = set(predictions)
        # self._save_confusion_matrix(reference, predictions, sample_type)
        if sample_type == 'train':
            self._precision_train = precision(reference_set, prediction_set)
            self._recall_train = recall(reference_set, prediction_set)
            self._f_measure_train = f_measure(reference_set, prediction_set)
            self._accuracy_train = accuracy(reference, predictions)
            self._train_true_positive_num = sum(np.array(reference) != -1)
        elif sample_type == 'test':
            self._precision_test = precision(reference_set, prediction_set)
            self._recall_test = recall(reference_set, prediction_set)
            self._f_measure_test = f_measure(reference_set, prediction_set)
            self._accuracy_test = accuracy(reference, predictions)
            self._test_true_positive_num = sum(np.array(reference) != -1)

    def _get_accuracy(self, model, data):
        reference = [x[1] for x in data]
        predictions = []
        for x in data:
            predictions.append(model.classify(x[0]))
        # reference_set = set(reference)
        # prediction_set = set(predictions)
        return accuracy(reference, predictions)

    def _save_model(self):
        # save the model to disk
        filename = ''
        if self._save_model_bool:
            self._traindata, self._testdata = self._sampling(
                self._observation, self._train_sample_ratio
            )
            self._train(self._traindata)        
            self._test(self._traindata, 'train')
            self._test(self._testdata, 'test')
            timestamp = datetime.datetime.strftime(
                datetime.datetime.now(), "%Y%m%d%H%M%S")
            filename = timestamp+'.sav'
            self._model_filepath = os.path.join(
                os.getcwd(),
                MODEL_PATH,
                filename
            )
            pickle.dump(self._model, open(self._model_filepath, 'wb'))
        self._evaluation_id = CONN.insert(
            EVL_TABLE,
            preprocessing_id=self._preprocessing_id,
            topic=self._topic,
            model_filepath=filename
        )

    def _save_confusion_matrix(self, ref, pred, sample_type):
        cm = ConfusionMatrix(ref, pred)
        topic = '_topic_'+self._topic if self._topic else ''
        save_filepath = ''
        if sample_type == 'train':
            self._cm_path_train = str(self._preprocessing_id) + \
                '_'+self._model_type+'_'+sample_type+'_cm_'+topic+'.txt'
            save_filepath = os.path.join(
                os.getcwd(),
                RESULT_PATH,
                self._cm_path_train
            )
        elif sample_type == 'test':
            self._cm_path_test = str(self._preprocessing_id) + \
                '_'+self._model_type+'_'+sample_type+'_cm_'+topic+'.txt'
            save_filepath = os.path.join(
                os.getcwd(),
                RESULT_PATH,
                self._cm_path_test
            )   
        f = open(save_filepath, 'w')
        f.write(cm.pretty_format(sort_by_count=True))
        f.close()

    def _save_result(self):
        CONN.update(
            EVL_TABLE,
            self._evaluation_id,
            training_precision=self._precision_train,
            training_recall=self._recall_train,
            training_f_measure=self._f_measure_train,
            training_accuracy=self._accuracy_train,
            testing_precision=self._precision_test,
            testing_recall=self._recall_test,
            testing_f_measure=self._f_measure_test,
            testing_accuracy=self._accuracy_test,
            training_start=self._training_start,
            training_end=self._training_end,
            testing_start=self._testing_start,
            testing_end=self._testing_end,
            model_type=self._model_type,
            k=self._k,
            train_sample_size=round(len(self._observation)*self._train_sample_ratio),
            test_sample_size=round(len(self._observation)*(1-self._train_sample_ratio)),
            train_true_positives_num=self._train_true_positive_num,
            test_true_positives_num=self._test_true_positive_num,
            # training_confusion_matrix_path=self._cm_path_train,
            # testing_confusion_matrix_path=self._cm_path_test,
            note=self._note
        )
        # CONN.update(
        #   EVL_TABLE,
        #   self._evaluation_id
        # )

    @classmethod
    def paralell_cv_worker(*args):
        # print(len(args))
        # print(dir(args))
        # print(len(args[0]))
        # print(dir(args[0]))
        # obj = args[0]
        i, split_corpus, train_q, test_q, obj = args[1]
        # print(obj)
        # print(type(obj))
        # print(dir(obj))
        # print(len(split_corpus))
        train_set = split_corpus[0:i]+split_corpus[i+1:]
        train_set = functools.reduce(lambda a,b:a+b, train_set)
        test_set = split_corpus[i]
        model = obj._train(train_set)
        train_accuracy = obj._get_accuracy(model, train_set)
        testing_accuracy = obj._get_accuracy(model, test_set)
        train_q.put(train_accuracy)
        test_q.put(testing_accuracy)
        # train_q.append(train_accuracy)
        # test_q.append(testing_accuracy)
        # self._test(test_set, 'test')

    def cross_validation(self):
        data_piece_num = self._k
        rest_sample = self._observation
        evenly_split_data_corpus = []
        while data_piece_num > 1:
            train_sample_ratio = 1 - 1 / data_piece_num
            rest_sample, unit_sample = self._sampling(rest_sample, train_sample_ratio)
            evenly_split_data_corpus.append(unit_sample)
            data_piece_num -= 1
        evenly_split_data_corpus.append(rest_sample)
        accuracy_train_sum = 0
        accuracy_test_sum = 0
        manager = mp.Manager()
        train_q = manager.Queue()
        test_q = manager.Queue()
        # train_q = Queue()
        # test_q = Queue()
        train_list = []
        test_list = []
        args_combi = [        
            [x for x in p] for p in product(*[
                list(range(self._k)),
                [evenly_split_data_corpus, ],
                [train_q, ],
                [test_q, ],
                [self, ]
            ])
        ]
        # print(len(args_combi))
        # print(args_combi[0])
        # with get_context("spawn").Pool(processes=os.cpu_count()) as pool:
        with Pool(processes=os.cpu_count()) as pool:
            pool.map(self.paralell_cv_worker, args_combi)

        while not train_q.empty():
            train_list.append(train_q.get())
        while not test_q.empty():
            test_list.append(test_q.get())
        # self._accuracy_train = np.average(np.array(list(self.training_accuracy_q.queue)))
        # self._accuracy_train = np.average(np.array(list(train_q.queue)))
        # self._accuracy_test = np.average(np.array(list(test_q.queue)))
        self._accuracy_train = np.average(np.array(train_list))
        self._accuracy_test = np.average(np.array(test_list))
        top_3_test_accuracy = sorted(test_list, reverse=True)[0:3]
        self._note = '{} {}'.format(
            self._note,
            str(top_3_test_accuracy)
        )
        # self._save_confusion_matrix(reference, predictions, sample_type)
        reference = [x[1] for x in self._observation]
        self._precision_train = 0
        self._recall_train = 0
        self._f_measure_train = 0
        self._train_true_positive_num = sum(np.array(reference) != -1)
        self._precision_test = 0
        self._recall_test = 0
        self._f_measure_test = 0
        self._test_true_positive_num = sum(np.array(reference) != -1)
        # for i in range(self._k):
        #     train_set = evenly_split_data_corpus[0:i]+evenly_split_data_corpus[i+1:]
        #     train_set = functools.reduce(lambda a,b:a+b, train_set)
        #     test_set = evenly_split_data_corpus[i]
        #     self._train(train_set)
        #     self._test(train_set, 'train')
        #     self._test(test_set, 'test')
        #     accuracy_train_sum += self._accuracy_train
        #     accuracy_test_sum += self._accuracy_test
        #     # print(data_piece_num)
        #     # print(i)
        #     print(self._accuracy_test)
        # self._accuracy_train = accuracy_train_sum / self._k
        # self._accuracy_test = accuracy_test_sum / self._k
        # return evenly_split_data_corpus





