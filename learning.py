# Main machine learning trunk 
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	To provide a prototype where machine learning take place 
"""

import abc
import nltk
import random
import datetime

from typing import Dict
from nltk.classify.scikitlearn import SklearnClassifier
from nltk.metrics.scores import (
	precision, recall, f_measure, accuracy
)
from preprocessing import PreprocessedObservation
from db.db_connector import DBConnector

class MLAbstract(object):
	"""
	Machine learning base class 
	"""
	def __init__(self, prev_output: PreprocessedObservation):
		"""
		@data: observation of text and words with labels, data 
		to derive training and testing dataset
		@train_sample_ratio: #{training sample}/#{all samples}
		"""
		self._remove_stop_word = prev_output.stop_word_removed
		self._do_stemming = prev_output.stemming
		self._observation = prev_output.observation
		self._k = 5 #TDOO: remove dummy setting for k
		self._train_sample_ratio = 1 - 1 / self._k
		self._traindata, self._testdata = self._sampling(
			prev_output, self._train_sample_ratio
		)
		self._preprocessing_start = prev_output.preprocessing_start
		self._preprocessing_end = prev_output.preprocessing_end
		self._training_start = datetime.datetime.strftime(
			datetime.datetime.now(), "%d-%m-%Y %H:%M:%S")
		self._train()
		self._training_end = datetime.datetime.strftime(
			datetime.datetime.now(), "%d-%m-%Y %H:%M:%S")
		self._testing_start = datetime.datetime.strftime(
			datetime.datetime.now(), "%d-%m-%Y %H:%M:%S")
		self._test()
		self._testing_end = datetime.datetime.strftime(
			datetime.datetime.now(), "%d-%m-%Y %H:%M:%S")
		# TODO: plot figures
		self.vis_path = ""
		self.save_result()

	def _sampling(self, data: PreprocessedObservation, 
			train_sample_ratio):
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

	def _test(self):
		# print("Classic Naive Bayes accuracy precent:", 
		# 		(nltk.classify.accuracy(self._model, self._testdata))*100)
		truths = [x[0] for x in self._traindata]
		predictions = [self._model.classify(x[0]) for x in self._testdata]
		self.precision = precision(truths, predictions)
		self.recall = recall(truths, predictions)
		self.f_measure = f_measure(truths, predictions)
		self.accuracy = accuracy(truths, predictions)

	def _save_result(self):
		conn = db_connector()
		conn.insert(
			self
		)

class SimpleNaiveBayesClassifying(MLAbstract):
	"""
	Simple Naive Bayes classifier trained with 
	occurence data of words, and empirical estimates of 
	prior and posterior.
	"""
	_model_type = "Simple Naive Bayes"
	_parameters = ""
	_parametric = False

	def _train(self):
		self._model = nltk.NaiveBayesClassifier.train(self._traindata)
