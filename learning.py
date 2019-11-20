# Main machine learning trunk 
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	To provide a prototype where machine learning take place 
"""

import abc
import nltk
import random

from typing import Dict
from nltk.classify.scikitlearn import SklearnClassifier

class MLAbstract(object):
	"""
	Machine learning base class 
	"""
	def __init__(self, data: Dict, train_sample_ratio: float):
		"""
		@data: observation of text and words with labels, data 
		to derive training and testing dataset
		@train_sample_ratio: #{training sample}/#{all samples}
		"""
		self._traindata, self._testdata = self._cv_sampling(
			data, train_sample_ratio
		)
		self._train_and_test()

	def _cv_sampling(self, data, train_sample_ratio):
		"""
		To split sample to training and testing data
		with a given ratio
		"""
		train_data = []
		test_data = []

		all_data_index = range(1, len(data))
		train_data_num = round(len(data) * train_sample_ratio)
		train_data_index = random.sample(all_data_index, train_data_num)
		for i in all_data_index:
			if i in train_data_index:
				train_data.append(data[i])
			else:
				test_data.append(data[i])

		return train_data, test_data

	@abc.abstractmethod
	def _train_and_test(self):
		return 


class SimpleNaiveBayesClassifying(MLAbstract):
	"""
	Simple Naive Bayes classifier trained with 
	occurence data of words, and empirical estimates of 
	prior and posterior.
	"""
	def _train_and_test(self):
		nb_classifier = nltk.NaiveBayesClassifier.train(self._traindata)
		print("Classic Naive Bayes accuracy precent:", 
				(nltk.classify.accuracy(nb_classifier, self._testdata))*100)