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

import numpy as np

from typing import Dict
from sklearn.naive_bayes import MultinomialNB, \
		GaussianNB, BernoulliNB
from sklearn.linear_model import LogisticRegression, SGDClassifier
from sklearn.svm import SVC, LinearSVC, NuSVC
from sklearn.mixture import GaussianMixture
from nltk.classify.scikitlearn import SklearnClassifier
from nltk.metrics.scores import (
	precision, recall, f_measure, accuracy
)
from nltk.metrics import ConfusionMatrix
from preprocessing import TRAINING_INGREDIENT_PATH
from db.db_connector import DBConnector
from db.config import EVL_TABLE
from tagging import LABEL_VALUE_MAP

MODEL_PATH = 'models/'
RESULT_PATH = 'results/'
conn = DBConnector()

class MLAbstract(object):
	"""
	Machine learning base class 
	"""
	_model = None
	def __init__(self, preprocessing_id, topic, k):
		"""
		@data: observation of text and words with labels, data 
		to derive training and testing dataset
		@train_sample_ratio: #{training sample}/#{all samples}
		"""
		self._preprocessing_id = preprocessing_id
		self._topic = topic
		self._observation = self._load_data()
		self._k = k
		self._train_sample_ratio = 1 - 1 / self._k
		self._traindata, self._testdata = self._sampling(
			self._observation, self._train_sample_ratio
		)
		# self._preprocessing_start = prev_output.preprocessing_start
		# self._preprocessing_end = prev_output.preprocessing_end
		self._training_start = datetime.datetime.strftime(
			datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
		self._train()
		self._training_end = datetime.datetime.strftime(
			datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
		self._save_model()
		self._testing_start = datetime.datetime.strftime(
			datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
		self._test(self._traindata, 'train')
		self._test(self._testdata, 'test')
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
		filenames = conn.get_sample_filename_by_id(
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
	def _train(self):
		"""
		Training function to be wrapped
		"""
		return

	def _test(self, data, sample_type):
		# print("Classic Naive Bayes accuracy precent:", 
		# 		(nltk.classify.accuracy(self._model, self._testdata))*100)
		reference = [x[1] for x in data]
		predictions = []
		for x in data:
			predictions.append(self._model.classify(x[0]))
		reference_set = set(reference)
		prediction_set = set(predictions)
		self._save_confusion_matrix(reference, predictions, sample_type)
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

	def _save_model(self):
		# save the model to disk

		timestamp = datetime.datetime.strftime(
			datetime.datetime.now(), "%Y%m%d%H%M%S")
		filename = timestamp+'.sav'
		self._model_filepath = os.path.join(
			os.getcwd(),
			MODEL_PATH,
			filename
		)
		pickle.dump(self._model, open(self._model_filepath, 'wb'))
		self._evaluation_id = conn.insert(
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
		conn.update(
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
			train_sample_size=len(self._traindata),
			test_sample_size=len(self._testdata),
			train_true_positives_num=self._train_true_positive_num,
			test_true_positives_num=self._test_true_positive_num,
			training_confusion_matrix_path=self._cm_path_train,
			testing_confusion_matrix_path=self._cm_path_test
		)

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

	def _train(self):
		self._model = nltk.NaiveBayesClassifier.train(self._traindata)
		# filename = 'finalized_model.sav'
		# pickle.dump(self._model, open(filename, 'wb'))

class MultinomialNBClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "Multinomial NB"
	_parameters = ""
	_parametric = False

	def _train(self):
		self._model  = SklearnClassifier(MultinomialNB())
		self._model.train(self._traindata)

class GuassianNBClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "Guassian NB"
	_parameters = ""
	_parametric = False

	def _train(self):
		self._model  = SklearnClassifier(GaussianNB())
		self._model.train(self._traindata)

class BernoulliNBClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "Bernoulli NB"
	_parameters = ""
	_parametric = False

	def _train(self):
		self._model  = SklearnClassifier(BernoulliNB())
		self._model.train(self._traindata)

class LogisticClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "Logistic Regression"
	_parameters = ""
	_parametric = False

	def _train(self):
		self._model  = SklearnClassifier(LogisticRegression())
		self._model.train(self._traindata)

class SGDCClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "SGDC"
	_parameters = ""
	_parametric = False

	def _train(self):
		self._model  = SklearnClassifier(SGDClassifier())
		self._model.train(self._traindata)

class SVCClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "SVC"
	_parameters = ""
	_parametric = False

	def _train(self):
		self._model  = SklearnClassifier(SVC())
		self._model.train(self._traindata)

class LinearSVCClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "Linear SVC"
	_parameters = ""
	_parametric = False

	def _train(self):
		self._model  = SklearnClassifier(LinearSVC())
		self._model.train(self._traindata)

class NuSVCClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "Nu SVC"
	_parameters = ""
	_parametric = False

	def _train(self):
		self._model  = SklearnClassifier(NuSVC())
		self._model.train(self._traindata)

class GaussianMixureClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "Gaussian Mixture"
	_parameters = ""
	_parametric = False

	def _train(self):
		self._model  = SklearnClassifier(GaussianMixture())
		self._model.train(self._traindata)

ML_MODLE_MAP = {
	'naive_bayes': 'SimpleNaiveBayesClassifying',
	'multinomial_nb': 'MultinomialNBClassifying',
	'gaussian_nb': 'GuassianNBClassifying',
	'bernoulli_nb': 'BernoulliNBClassifying',
	'logistic_regression': 'LogisticClassifying',
	'sgdc': 'SGDCClassifying',
	'svc': 'SVCClassifying',
	'linear_svc': 'LinearSVCClassifying',
	'nu_svc': 'NuSVCClassifying',
	'gaussian_mixure': 'GaussianMixureClassifying',
}

class ModelClassSelector():
	def __init__(self):
		pass

	@classmethod
	def convert_string_to_classifier(
			self, model_name: str) -> MLAbstract:
		return eval(ML_MODLE_MAP[model_name])