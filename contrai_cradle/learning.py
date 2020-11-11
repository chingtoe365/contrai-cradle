# Main machine learning trunk 
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
    To provide a prototype where machine learning take place 
"""

import abc
import nltk
import random
import datetime
import os
import json
import pickle
import gensim
import re
import functools
import time

import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.colors as mcolors
import matplotlib.pyplot as plt
import xgboost as xgb
import tensorflow as tf
# from multiprocessing import set_start_method
# set_start_method("spawn")
# from multiprocessing import get_context
import multiprocessing as mp

from itertools import product
# from queue import Queue
from xgboost import plot_tree
from xgboost import plot_importance

from multiprocessing import Pool, Queue
from typing import Dict
from wordcloud import WordCloud, STOPWORDS
from nltk.corpus import stopwords
from sklearn.naive_bayes import MultinomialNB, \
        GaussianNB, BernoulliNB
from sklearn.linear_model import LinearRegression, \
    LogisticRegression, SGDClassifier
from sklearn.svm import SVC, LinearSVC, NuSVC
from sklearn.mixture import GaussianMixture
from nltk.classify.scikitlearn import SklearnClassifier
from nltk.metrics.scores import (
    precision, recall, f_measure, accuracy
)
from nltk.metrics import ConfusionMatrix
from sklearn.model_selection import KFold
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from gensim.corpora import Dictionary
from gensim import models

from contrai_cradle.adjusted_model_lib.ldamulticore import LdaMulticore
from contrai_cradle.preprocessing import TRAINING_INGREDIENT_PATH
from contrai_cradle.db.db_connector import CONN
from contrai_cradle.db.config import EVL_TABLE
from contrai_cradle.tagging import LABEL_VALUE_MAP
from contrai_cradle.abstracts.abstractions import JLLearnModelAbstract
from contrai_cradle.impl.unsupervised_learning_impl import UnsupervisedLearningImpl
from contrai_cradle.event_logger import logger
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

class SimpleNaiveBayesClassifying(MLAbstract):
    """
    Simple Naive Bayes classifier trained with 
    occurence data of words, and empirical estimates of 
    prior and posterior.

    Must define:
    self._model
    """
    _model_type = "Simple Naive Bayes"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model = nltk.NaiveBayesClassifier.train(train_data)
        return self._model
        # filename = 'finalized_model.sav'
        # pickle.dump(self._model, open(filename, 'wb'))

class MultinomialNBClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "Multinomial NB"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(MultinomialNB())
        self._model.train(train_data)
        return self._model

class GuassianNBClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "Guassian NB"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(GaussianNB())
        self._model.train(train_data)
        return self._model

class BernoulliNBClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "Bernoulli NB"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(BernoulliNB())
        self._model.train(train_data)
        return self._model

class LogisticClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "Logistic Regression"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(LogisticRegression(
            C=self._param_c,
            max_iter=self._param_max_iter
        ))
        self._model.train(train_data)
        return self._model

class LinearRegressionClassifying(MLAbstract):
    """
    Linear regression
    """
    _model_type = "Linear Regression"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(LogisticRegression())
        self._model.train(train_data)
        return self._model

class SGDCClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "SGDC"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(SGDClassifier())
        self._model.train(train_data)
        return self._model

class SVCClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "SVC"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(SVC())
        self._model.train(train_data)
        return self._model

class LinearSVCClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "Linear SVC"
    _parameters = ""
    _parametric = False

    # def __init__(self, preprocessing_id, 
    #     topic, k, embedding_method, 
    #     note, save_model, param_c):
    #     print('param c is {}'.format(param_c))
    #     super().__init__(
    #         preprocessing_id, topic, k, embedding_method, 
    #         note, save_model, param_c
    #     )

    def _train(self, train_data):
        # print('Actual C is {}'.format(self._param_c))
        self._model = SklearnClassifier(LinearSVC(
            C=self._param_c,
            max_iter=self._param_max_iter
        ))
        self._model.train(train_data)
        return self._model

class NuSVCClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "Nu SVC"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model = SklearnClassifier(NuSVC())
        self._model.train(train_data)
        return self._model

class XGBoostClassifying(MLAbstract):
    """
    X Gradient Boosting
    """
    _model_type = "Extreme Gradient Boosting"
    _parameters = ""
    _parametric = False
    _plot_tree = True
    _feature_map_path = os.path.join(
        os.getcwd(),
        TRAINING_INGREDIENT_PATH,
        'feature_map.txt'   
    )
    _tree_figure_savepath = os.path.join(
        os.getcwd(),
        'results/summary/tree.png'
    )
    _importance_figure_savepath = os.path.join(
        os.getcwd(),
        'results/summary/importance.png'
    )

    def _data_shuffle(self, original_formatted_data):
        def space_concat(x):
            return ' '.join(x)
        features = pd.DataFrame([x[0] for x in original_formatted_data])
        target = np.array([x[1] for x in original_formatted_data])
        target = np.array([np.where(np.array(sorted(set(target)))==y)[0][0] for y in target])
        # convert output to one-hot vectors
        z = np.zeros((target.size, target.max()+1))
        z[np.arange(target.size),target] = 1
        feature_map = pd.DataFrame({
            'ind': [str(y) for y in range(0, features.shape[1])],
            'fname': features.columns.map(lambda x: '_'.join(x.split(' '))),
            'ftype': ['q'] * features.shape[1]
        })
        feature_map_file_txt = '\n'.join(feature_map.apply(space_concat, axis=1))
        f = open(self._feature_map_path, "w")
        f.write(feature_map_file_txt)
        f.close()
        features.columns = np.array(range(0, features.shape[1])).astype(str)
        features.replace(np.nan, 0, inplace=True)
        features = features.apply(lambda x:x.astype(int))
        # filter features that contain too much zeros (only appearing in one document)
        features = features.loc[:, features.apply(lambda x: sum(x > 0) > 1, axis=0)]
        # return features, z
        return features, target

    def _train(self, features, target, class_num):
        # self._model = SklearnClassifier()
        # self._model = xgb.XGBRegressor(
        self._model = xgb.XGBClassifier(
            # tree_method='gpu_hist', gpu_id=0,
            objective="multi:softmax", random_state=42, num_class=class_num)
        # xgb_param = self._model.get_xgb_params()
        # xgb_param['num_class'] = 61
        # features, target = self._data_shuffle(train_data)
        print("Training start...")
        self._model.fit(features, target)
    
    def _test(self, features, target, sample_type):
        if sample_type == 'train':
            predictions = self._model.predict(features)
            self._accuracy_train = accuracy(target, predictions)
            self._train_true_positive_num = sum(np.array(target) != -1)
            self._precision_train = 0
            self._recall_train = 0
            self._f_measure_train = 0
        elif sample_type == 'test':
            predictions = self._model.predict(features)
            self._accuracy_test = accuracy(target, predictions)
            self._test_true_positive_num = sum(np.array(target) != -1)
            self._precision_test = 0
            self._recall_test = 0
            self._f_measure_test = 0

    def cross_validation(self):
        accuracy_train_sum = 0
        accuracy_test_sum = 0
        kfold = KFold(n_splits=self._k, shuffle=True, random_state=42)
        scores = []
        X, y = self._data_shuffle(self._observation)
        # class_num = y.shape[1]
        class_num = len(set(y))
        for train_index, test_index in kfold.split(X):
            X_train, X_test = X.loc[train_index], X.loc[test_index]
            y_train, y_test = y[train_index], y[test_index]
            before = time.time()
            self._train(X_train, y_train, class_num)
            after = time.time()
            print("One XGBoost model trained with time in {} seconds".format(str(after - before)))
            self._test(X_train, y_train, 'train')
            self._test(X_test, y_test, 'test')
            print("testing accruracy: {}".format(str(self._accuracy_test)))
            accuracy_train_sum += self._accuracy_train
            accuracy_test_sum += self._accuracy_test
            
            if self._plot_tree:
                # fig = plt.gcf()
                # fig.set_size_inches(300, 200)
                # fig.set_size_inches(16, 8)
                fig_tree = plot_tree(self._model, fmap=self._feature_map_path)
                # # fig.show()
                # # f = open(self._tree_figure_savepath, 'wb')
                fig_tree.figure.savefig(self._tree_figure_savepath, dpi=300)
                # fig1 = plt.gcf()
                # fig1.set_size_inches(300, 200)
                # plot_importance(self._model, fmap=self._feature_map_path)
                fig_imp = plot_importance(
                    self._model,
                    max_num_features=50
                    # fmap=self._feature_map_path
                )
                # fig1.show()
                # f1 = open(self._importance_figure_savepath, 'wb')
                fig_imp.figure.savefig(self._importance_figure_savepath, dpi=300)
                break

        self._accuracy_train = accuracy_train_sum / self._k
        self._accuracy_test = accuracy_test_sum / self._k


class LSTMClassifying(MLAbstract):
    """
    Long short-term memory classifier
    """
    _model_type = "LSTM"
    _parametric = False
    _parameters = ""
    # _vocab_size = 11000
    _vocab_size = 8000
    # _embedding_dim = 64
    _embedding_dim = 300
    _max_length = 200
    _max_length_label = 1
    _trunc_type = 'post'
    _padding_type = 'post'
    _oov_tok = '<OOV>'
    _training_portion = .8
    _num_epochs = 50
    _last_dense_dim = 55
    _embedding_matrix = None

    def __init__(
        self, 
        preprocessing_id, 
        topic, k, embedding_method, 
        note, save_model
        ):
        """
        @data: observation of text and words with labels, data 
        to derive training and testing dataset
        @train_sample_ratio: #{training sample}/#{all samples}
        """
        self._preprocessing_id = preprocessing_id
        self._topic = topic
        train_X, test_X, train_y, test_y = self._load_data()        
        if embedding_method == 'word2vec':
            self._make_word2vec_matrix()
        self._k = int(k)
        self._save_model_bool = True
        self._train_sample_ratio = 1 - 1 / self._k
        self._note = note
        # self._preprocessing_start = prev_output.preprocessing_start
        # self._preprocessing_end = prev_output.preprocessing_end
        self._training_start = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        print("Training starts")
        history = self._train_and_test(train_X, train_y, test_X, test_y)
        print("Training finished after {} seconds".format(
            str(self._training_end - self._training_start)
        ))
        self._training_end = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        self._save_model(history)
        self._testing_start = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # self._test()
        # self._test(self._observation, 'test')
        # self._test(self._traindata)
        # self._test(self._testdata)
        self._testing_end = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # TODO: plot figures
        self.vis_path = ""
        # self._save_result()
    
    def _make_word2vec_matrix(self):
        goog_wvmodel = gensim.models.KeyedVectors.load_word2vec_format(
            os.path.join(
                os.getcwd(),
                'google_word2vec/GoogleNews-vectors-negative300.bin.gz'
            ),
            binary=True
        )
        self._embedding_matrix = np.zeros(
            (self._vocab_size, self._embedding_dim)
        )
        for word, i in self._word_index.items():
            embedding_vector = None
            try:
                embedding_vector = goog_wvmodel.get_vector(word)[:self._embedding_dim]
            except Exception as e:
                embedding_vector = np.zeros(self._embedding_dim)
            if embedding_vector is not None:
                self._embedding_matrix[i] = embedding_vector

    def _save_history(self, history):
        # save the model to disk
        filename = ''
        if self._save_model_bool:
            timestamp = datetime.datetime.strftime(
                datetime.datetime.now(), "%Y%m%d%H%M%S")
            filename = 'lstm_'+timestamp+'.sav'
            history_filename = 'lstm_history_'+timestamp+'.sav'
            self._model_filepath = os.path.join(
                os.getcwd(),
                MODEL_PATH,
                filename
            )
            history_path = os.path.join(
                os.getcwd(),
                RESULT_PATH,
                history_filename
            )
            pickle.dump(self._model, open(self._model_filepath, 'wb'))
            pickle.dump(history, open(history_path, 'wb'))
        self._evaluation_id = CONN.insert(
            EVL_TABLE,
            preprocessing_id=self._preprocessing_id,
            topic=self._topic,
            model_filepath=filename
        )

    def _train_and_test(self, train_X, train_y, test_X, test_y):
        self._model = tf.keras.Sequential([
            # Add an Embedding layer expecting input vocab of size 5000, and output embedding dimension of size 64 we set at the top
            # remove embedding if using other word vectors
            # tf.keras.layers.Embedding(self._vocab_size, self._embedding_dim),
            tf.keras.layers.Embedding(
                self._vocab_size, 
                self._embedding_dim,
                weights=[self._embedding_matrix],
                trainable=False
            ),
            tf.keras.layers.Bidirectional(tf.keras.layers.LSTM(self._embedding_dim)),
            # tf.keras.layers.Bidirectional(tf.keras.layers.LSTM(32)),
            # use ReLU in place of tanh function since they are very good alternatives of each other.
            tf.keras.layers.Dense(self._embedding_dim, activation='relu'),
            # Add a Dense layer with 6 units and softmax activation.
            # When we have multiple outputs, softmax convert outputs layers into a probability distribution.
            tf.keras.layers.Dense(self._last_dense_dim, activation='softmax')
        ])
        print(self._model.summary())
        self._model.compile(
            loss='sparse_categorical_crossentropy', optimizer='adam', metrics=['accuracy']
        )
        
        history = self._model.fit(
            train_X, 
            train_y, 
            epochs=self._num_epochs, 
            validation_data=(
                test_X, test_y
            ), 
            verbose=2
        )
        print(history)
        # pickle.dump(history, open(self._model_filepath, 'wb'))
        return history

    def _load_data(self):
        """
        Overwrite _load_data method with special vector treatment
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
        features = np.array([x[0] for x in data])
        labels = [x[1] for x in data]
        labels = np.array([np.where(np.array(sorted(set(labels)))==y)[0][0] for y in labels])
        print(len(labels))
        print(len(features))
        # sample split
        train_size = int(len(features) * self._training_portion)
        shuffle_index = random.sample(range(len(features)), train_size)
        train_X = list(features[shuffle_index])
        train_y = list(labels[shuffle_index])
        val_X = list(np.delete(features, shuffle_index))
        val_y = list(np.delete(labels, shuffle_index))
        # tokenization
        tokenizer = Tokenizer(num_words = self._vocab_size, oov_token=self._oov_tok)
        tokenizer.fit_on_texts(features)
        self._word_index = tokenizer.word_index
        dict(list(self._word_index.items())[0:10])
        train_sequences = tokenizer.texts_to_sequences(train_X)
        print(train_sequences[10])
        train_padded = pad_sequences(
            train_sequences, 
            maxlen=self._max_length, 
            padding=self._padding_type, 
            truncating=self._trunc_type
        )
        print(len(train_sequences[0]))
        print(len(train_padded[0]))

        print(len(train_sequences[1]))
        print(len(train_padded[1]))

        print(len(train_sequences[10]))
        print(len(train_padded[10]))
        validation_sequences = tokenizer.texts_to_sequences(val_X)
        validation_padded = pad_sequences(
            validation_sequences, 
            maxlen=self._max_length, 
            padding=self._padding_type, 
            truncating=self._trunc_type
        )
        print(len(validation_sequences))
        print(validation_padded.shape)
        # label_tokenizer = Tokenizer()
        # label_tokenizer.fit_on_texts(labels)
        # training_label_seq = np.array(label_tokenizer.texts_to_sequences(train_y))
        # training_label_padded = pad_sequences(
        #   training_label_seq, 
        #   maxlen=self._max_length_label, 
        #   padding=self._padding_type, 
        #   truncating=self._trunc_type
        # )
        # validation_label_seq = np.array(label_tokenizer.texts_to_sequences(val_y))
        # validation_label_padded = pad_sequences(
        #   validation_label_seq, 
        #   maxlen=self._max_length_label, 
        #   padding=self._padding_type, 
        #   truncating=self._trunc_type
        # )
        train_y = np.array([[x] for x in train_y])
        val_y = np.array([[x] for x in val_y])
        return train_padded, validation_padded, train_y, val_y


class GaussianMixureClassifying(MLAbstract):
    """
    Gaussian mixure
    """
    _model_type = "Gaussian Mixture"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(GaussianMixture())
        self._model.train(train_data)



class GoogleWord2VecTextClusterClassifying(MLAbstract):
    """
    Classify clauses with topics by proposed clustering/voting method
    Google pretrained model provide vectors embedding for each single word
    
    Train:
    - Get baseline vectors for each topic by averaging clauses

    Predict:
    - Reprepsent each text string(topic & clauses) by a combined vector,
    which is an average of all the word vector
    - Measure cosine similarity of each text vectors
    - Assign topic to clause to be predicted 
    with absolute highest cosine similarity 
    """
    _model_type = "Google W2V Clustering"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        """
        Not using SKlearnClassifier interface in this model

        model need to only have:
        - model.classify(list_of_words_of_a_clause: List[str]) -> topic_label
        
        """
        self._model = TextClusterClassifying()
        self._model.train(train_data)   
        # estimator = []
        # self._model = SklearnClassifier(estimator())
        # self._model.train(self.)


ML_MODLE_MAP = {
    'linear_regression': 'LinearRegressionClassifying',
    'naive_bayes': 'SimpleNaiveBayesClassifying',
    'multinomial_nb': 'MultinomialNBClassifying',
    'gaussian_nb': 'GuassianNBClassifying',
    'bernoulli_nb': 'BernoulliNBClassifying',
    'logistic_regression': 'LogisticClassifying',
    'sgdc': 'SGDCClassifying',
    'svc': 'SVCClassifying',
    'linear_svc': 'LinearSVCClassifying',
    'nu_svc': 'NuSVCClassifying',
    'xgboost': 'XGBoostClassifying',
    'lstm': 'LSTMClassifying',
    'gaussian_mixure': 'GaussianMixureClassifying',
    'word2vec_clustering': 'GoogleWord2VecTextClusterClassifying',
    'lda_clustering': 'LDAClustering',
    'lsa_clustering': 'LSAClustering'
}

class ModelClassSelector():
    def __init__(self):
        pass

    @classmethod
    def convert_string_to_classifier(
            self, model_name: str) -> MLAbstract:
        return eval(ML_MODLE_MAP[model_name])


class TextClusterClassifying(JLLearnModelAbstract):
    def __init__(self):
        self._word2vec_model = gensim.models.Word2Vec.load(
            os.path.join(
                os.getcwd(),
                'models/word2vec/legal_w2v.model'
            )
        ).wv
        self._vector_size = self._word2vec_model.vector_size

    def _get_clause_vector(self, bag_of_words, vector_size):
        wc = 0
        clause_vector = np.zeros(vector_size)
        for word in bag_of_words:
            try:
                occurence = bag_of_words[word]
            except Exception as e:
                continue
            try:
                word_vec = self._word2vec_model.get_vector(word)
            except KeyError as ke:
                logger.error(ke)
                continue
            clause_vector += word_vec * occurence
            wc += occurence
        if np.all(clause_vector == 0):
            # if all vocabularies in this text are out-of-book
            # then assign a extremely small number as baseline
            # to avoid error
            clause_vector += 1e-80
            wc = 1
        return clause_vector / wc


    def _get_topic_largest_cosine_similarity(self, clause_vector):
        best_sim = 0
        best_guess = 41
        for topic in self.topic_baseline_vectors:
            cos_sim = self._word2vec_model.cosine_similarities(
                clause_vector,
                np.array([self.topic_baseline_vectors[topic],])
            )
            if abs(cos_sim) > best_sim:
                best_sim = cos_sim
                best_guess = topic

        return int(best_guess)

    def train(self, traindata):
        """
        Given train data looking like this:
        
        [
        [
            {
                'I' : 1,
                'should': 2,
                'be': 1,
                'a': 1,
                'billionaire': 2
            }
            'force majeure', 
            19
        ],
        [
            {
                'we': 1,
                'are': 2,
                'happy': 1
            }, 
            'anti-bribery', 
            47
        ],
        ]

        - baseline vector should be measured for each topic
        """
        # Initializing topic vectors
        self.topic_baseline_vectors = {}
        self.train_topic_count = {}
        for clause in traindata:
            topic = str(clause[1])
            if topic not in self.topic_baseline_vectors:
                self.topic_baseline_vectors[topic] = np.zeros(
                    self._vector_size)
                self.train_topic_count[topic] = 0
            self.train_topic_count[topic] += 1
            clause_vector = self._get_clause_vector(
                clause[0], self._vector_size)
            self.topic_baseline_vectors[topic] += clause_vector
        # averaging all topic_baseline_vectors
        for top in self.topic_baseline_vectors:
            self.topic_baseline_vectors[top] = \
                self.topic_baseline_vectors[top] / self.train_topic_count[top]

    def classify(self, data):
        clause_vector = self._get_clause_vector(
            data, self._vector_size)
        return self._get_topic_largest_cosine_similarity(
                    clause_vector
                )



class LDAClustering(UnsupervisedLearningImpl):
    model = 'LDA_Clustering'
    num_topics = NUM_TOPICS
    images_folder = 'results/lda_clustering'
    def __init__(self, preprocessing_id, topic, k):
        super().__init__(preprocessing_id, topic, k)
        # self._preprocessing_id = preprocessing_id
        # self._topic = topic
        self._observation = self._load_data()
        # self._k = k
        self.train()
        self.performance()

    def train(self):
        bow_corpus, id2word, raw_corpus, \
            raw_corpus_single_gram, tfidf_corpus = self._bow_formatter()
        self.corpus = raw_corpus_single_gram
        # self.training_corpus = bow_corpus if self.
        if TRAINING_INPUT_TYPE == 'tfidf':
            self.training_corpus = tfidf_corpus 
        elif TRAINING_INPUT_TYPE == 'bow':
            self.training_corpus = bow_corpus
        else:
            self.training_corpus = bow_corpus
        self.model = LdaMulticore(
            corpus=self.training_corpus,
            num_topics=NUM_TOPICS,
            id2word=id2word,
            passes=2,
            workers=2
        )

    def performance(self):
        csv_file_name = 'dominant_topic_'+TRAINING_INPUT_TYPE+'.csv'
        csv_file_path = os.path.join(
            os.getcwd(),
            self.images_folder,
            csv_file_name
        )
        print(
            self.model.show_topics(
                num_topics=self.num_topics,
                num_words=20
            )
        )
        self.df_topic_sents_keywords = self.format_topics_sentences()
        # Format
        df_dominant_topic = self.df_topic_sents_keywords.reset_index()
        df_dominant_topic.columns = ['Document_No', 'Dominant_Topic', 'Topic_Perc_Contrib', 'Keywords', 'Text']
        df_dominant_topic.to_csv(csv_file_path)
        print(
            df_dominant_topic.head(10)
        )
        self.document_word_count()
        self.topic_word_count()
        self.word_cloud()

    def document_word_count(self):
        image_name = 'word_count_'+TRAINING_INPUT_TYPE+'.jpeg'
        image_file_path = os.path.join(
            os.getcwd(),
            self.images_folder,
            image_name
        )
        self.df_dominant_topic = self.df_topic_sents_keywords.reset_index()
        self.df_dominant_topic.columns = ['Document_No', 'Dominant_Topic', 'Topic_Perc_Contrib', 'Keywords', 'Text']
        self.df_dominant_topic.head(10)
        doc_lens = [len(d) for d in self.df_dominant_topic.Text]
        # Plot
        plt.figure(figsize=(16,7), dpi=160)
        plt.hist(doc_lens, bins = 1000, color='navy')
        plt.text(750, 100, "Mean   : " + str(round(np.mean(doc_lens))))
        plt.text(750,  90, "Median : " + str(round(np.median(doc_lens))))
        plt.text(750,  80, "Stdev   : " + str(round(np.std(doc_lens))))
        plt.text(750,  70, "1%ile    : " + str(round(np.quantile(doc_lens, q=0.01))))
        plt.text(750,  60, "99%ile  : " + str(round(np.quantile(doc_lens, q=0.99))))

        plt.gca().set(xlim=(0, 1000), ylabel='Number of Documents', xlabel='Document Word Count')
        plt.tick_params(size=16)
        plt.xticks(np.linspace(0,1000,9))
        plt.title('Distribution of Document Word Counts', fontdict=dict(size=22))
        plt.show()
        f = open(image_file_path, 'wb')
        plt.savefig(
            image_file_path
        )

    def topic_word_count(self):
        image_name = 'topic_word_count_'+TRAINING_INPUT_TYPE+'.jpeg'
        image_file_path = os.path.join(
            os.getcwd(),
            self.images_folder,
            image_name
        )
        cols = [color for name, color in mcolors.XKCD_COLORS.items()]  # more colors: 'mcolors.XKCD_COLORS'

        # fig, axes = plt.subplots(2,2,figsize=(16,14), dpi=160, sharex=True, sharey=True)
        fig, axes = plt.subplots(5, 12, figsize=(120,50), sharex=True, sharey=True)


        for i, ax in enumerate(axes.flatten()):
            try:
                df_dominant_topic_sub = self.df_dominant_topic.loc[self.df_dominant_topic.Dominant_Topic == i, :]
            except Exception as e:
                continue    
            doc_lens = [len(d) for d in df_dominant_topic_sub.Text]
            ax.hist(doc_lens, bins = BIN_NUMBER, color=cols[i])
            ax.tick_params(axis='y', labelcolor=cols[i], color=cols[i])
            sns.kdeplot(doc_lens, color="black", shade=False, ax=ax.twinx())
            ax.set(xlim=(0, BIN_NUMBER), xlabel='Document Word Count')
            ax.set_ylabel('Number of Documents', color=cols[i])
            ax.set_title('Topic: '+str(i), fontdict=dict(size=16, color=cols[i]))
        

        fig.tight_layout()
        fig.subplots_adjust(top=0.90)
        plt.xticks(np.linspace(0,BIN_NUMBER,9))
        fig.suptitle('Distribution of Document Word Counts by Dominant Topic', fontsize=22)
        plt.show()
        f = open(image_file_path, 'wb')
        plt.savefig(
            image_file_path
        )

    def word_cloud(self):
        # 1. Wordcloud of Top N words in each topic
        # from matplotlib import pyplot as plt
        # import matplotlib.colors as mcolors
        image_name = 'cloud_word_'+TRAINING_INPUT_TYPE+'.jpeg'
        image_file_path = os.path.join(
            os.getcwd(),
            self.images_folder,
            image_name
        )
        cols = [color for name, color in mcolors.XKCD_COLORS.items()]  # more colors: 'mcolors.TABLEAU_COLORS'
        stop_words = set(stopwords.words("english"))
        cloud = WordCloud(stopwords=stop_words,
                        background_color='white',
                        width=1200,
                        height=500,
                        max_words=10,
                        colormap='tab10',
                        color_func=lambda *args, **kwargs: cols[i],
                        prefer_horizontal=1.0)

        topics = self.model.show_topics(formatted=False)

        # fig, axes = plt.subplots(2, 2, figsize=(10,10), sharex=True, sharey=True)
        fig, axes = plt.subplots(5, 12, figsize=(120,50), sharex=True, sharey=True)

        for i, ax in enumerate(axes.flatten()):
            try:
                topic_words = dict(topics[i][1])
            except Exception as e:
                continue
            fig.add_subplot(ax)
            cloud.generate_from_frequencies(topic_words, max_font_size=300)
            plt.gca().imshow(cloud)
            plt.gca().set_title('Topic ' + str(i), fontdict=dict(size=16))
            plt.gca().axis('off')


        plt.subplots_adjust(wspace=0, hspace=0)
        plt.axis('off')
        plt.margins(x=0, y=0)
        plt.tight_layout()
        plt.show()
        f = open(image_file_path, 'wb')
        plt.savefig(
            image_file_path
        )


class LSAClustering(UnsupervisedLearningImpl):
    model = 'LSA_Clustering'
    num_topics = NUM_TOPICS
    result_folder = 'results/lsa_clustering'

    def __init__(self, preprocessing_id, topic, k):
        super().__init__(preprocessing_id, topic, k)
        # self._preprocessing_id = preprocessing_id
        # self._topic = topic
        self._observation = self._load_data()
        # self._k = k
        self.train()
        self.performance()


    def train(self):
        """
        Input  : clean document, number of topics and number of words associated with each topic
        Purpose: create LSA model using gensim
        Output : return LSA model
        """
        bow_corpus, id2word, raw_corpus, \
            raw_corpus_single_gram, tfidf_corpus = self._bow_formatter()
        self.corpus = raw_corpus_single_gram
        self.dictionary = id2word
        # self.training_corpus = bow_corpus if self.
        if TRAINING_INPUT_TYPE == 'tfidf':
            self.training_corpus = tfidf_corpus 
        elif TRAINING_INPUT_TYPE == 'bow':
            self.training_corpus = bow_corpus
        else:
            self.training_corpus = bow_corpus
        # generate LSA model
        self.model = gensim.models.LsiModel(
            self.training_corpus, num_topics=self.num_topics, id2word=id2word
        )  # train model
        # print(self.model.print_topics(num_topics=self.num_topics, num_words=10))
        # return lsamodel

    def performance(self):
        csv_file_name = 'topic_'+TRAINING_INPUT_TYPE+'.csv'
        csv_file_path = os.path.join(
            os.getcwd(),
            self.result_folder,
            csv_file_name
        )
        print(
            self.model.show_topics(
                num_topics=self.num_topics,
                num_words=20
            )
        )
        self.df_topic_sents_keywords = self.format_topics_sentences()
        # Format
        df_dominant_topic = self.df_topic_sents_keywords.reset_index()
        df_dominant_topic.columns = ['Document_No', 'Dominant_Topic', 'Topic_Perc_Contrib', 'Keywords', 'Text']
        df_dominant_topic.to_csv(csv_file_path)
        print(
            df_dominant_topic.head(10)
        )
        self.coherence_measure()
        # self.document_word_count()
        # self.topic_word_count()
        # self.word_cloud()


    def coherence_measure(self):
        """
            Input   : dictionary : Gensim dictionary
                corpus : Gensim corpus
                texts : List of input texts
                stop : Max num of topics
            purpose : Compute c_v coherence for various number of topics
            Output  : model_list : List of LSA topic models
                coherence_values : Coherence values corresponding to the LDA model with respective number of topics
        """
        start, stop, step = 2,61,1
        coherence_values = []
        model_list = []
        for num_topics in range(start, stop, step):
            # generate LSA model
            model = gensim.models.LsiModel(
                self.training_corpus, 
                num_topics=num_topics,
                id2word = self.dictionary
            )  # train model
            model_list.append(model)
            coherencemodel = gensim.models.CoherenceModel(
                model=model, corpus=self.training_corpus, 
                dictionary=self.dictionary, coherence='u_mass'
            )
            coherence_values.append(coherencemodel.get_coherence())

        # dictionary,doc_term_matrix=prepare_corpus(doc_clean)
        # model_list, coherence_values = compute_coherence_values(dictionary, doc_term_matrix,doc_clean,
                # stop, start, step)
        # Show graph
        x = range(start, stop, step)
        plt.plot(x, coherence_values)
        plt.xlabel("Number of Topics")
        plt.ylabel("Coherence score")
        plt.legend(("coherence_values"), loc='best')
        # plt.show()
        image_name = 'coherence_'+TRAINING_INPUT_TYPE+'.jpeg'
        image_file_path = os.path.join(
            os.getcwd(),
            self.result_folder,
            image_name
        )
        f = open(image_file_path, 'wb')
        plt.savefig(
            image_file_path
        )
        # return model_list, coherence_values
