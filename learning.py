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

from adjusted_model_lib.ldamulticore import LdaMulticore
from preprocessing import TRAINING_INGREDIENT_PATH
from db.db_connector import CONN
from db.config import EVL_TABLE
from tagging import LABEL_VALUE_MAP
from abstracts.abstractions import JLLearnModelAbstract
from impl.unsupervised_learning_impl import UnsupervisedLearningImpl
from event_logger import logger
from gensim.corpora import Dictionary
from gensim import models

from config.constants import * 

# W2V_MODEL = gensim.models.KeyedVectors.load_word2vec_format(
# 	# '/home/vagrant/sync/testfield/google_word2vec/GoogleNews-vectors-negative300.bin.gz', 
# 	# '/home/vagrant/sync/testfield/google_word2vec/word2vec_SLIM_10000',
# 	# '/home/vagrant/sync/testfield/google_word2vec/GoogleNews-vectors-negative300-SLIM.bin.gz',
# 	# '/home/vagrant/sync/testfield/models/word2vec/legal_vs_300_wind_7.bin.gz',	
# 	# '/home/vagrant/sync/testfield/models/word2vec/legal_vs_300_wind_7.bin.gz',
# 	binary=True
# )

W2V_MODEL = gensim.models.Word2Vec.load(
	'/home/vagrant/sync/testfield/models/word2vec/legal_w2v.model'
).wv


class MLAbstract(object):
	"""
	Machine learning base class 
	"""
	_model = None
	def __init__(self, preprocessing_id, topic, k, note, save_model):
		"""
		@data: observation of text and words with labels, data 
		to derive training and testing dataset
		@train_sample_ratio: #{training sample}/#{all samples}
		"""
		self._preprocessing_id = preprocessing_id
		self._topic = topic
		self._observation = self._load_data()
		self._k = k
		self._save_model_bool = save_model
		self._train_sample_ratio = 1 - 1 / self._k
		self.cross_validation()
		self._note = note
		# self._preprocessing_start = prev_output.preprocessing_start
		# self._preprocessing_end = prev_output.preprocessing_end
		self._training_start = datetime.datetime.strftime(
			datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
		
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
		# 		(nltk.classify.accuracy(self._model, self._testdata))*100)
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
		# 	EVL_TABLE,
		# 	self._evaluation_id
		# )

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
		for i in range(data_piece_num):
			train_set = evenly_split_data_corpus[0:i]+evenly_split_data_corpus[i+1:]
			train_set = functools.reduce(lambda a,b:a+b, train_set)
			test_set = evenly_split_data_corpus[i]
			self._train(train_set)
			self._test(train_set, 'train')
			self._test(test_set, 'test')
			accuracy_train_sum += self._accuracy_train
			accuracy_test_sum += self._accuracy_test
		self._accuracy_train = accuracy_train_sum / data_piece_num
		self._accuracy_test = accuracy_test_sum / data_piece_num
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

class LogisticClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "Logistic Regression"
	_parameters = ""
	_parametric = False

	def _train(self, train_data):
		self._model  = SklearnClassifier(LogisticRegression())
		self._model.train(train_data)

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

class LinearSVCClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "Linear SVC"
	_parameters = ""
	_parametric = False

	def _train(self, train_data):
		self._model  = SklearnClassifier(LinearSVC())
		self._model.train(train_data)

class NuSVCClassifying(MLAbstract):
	"""
	Naive Bayes with multinomial estimator
	"""
	_model_type = "Nu SVC"
	_parameters = ""
	_parametric = False

	def _train(self, train_data):
		self._model  = SklearnClassifier(NuSVC())
		self._model.train(train_data)

class XGBoostClassifying(MLAbstract):
	"""
	X Gradient Boosting
	"""
	_model_type = "Extreme Gradient Boosting"
	_parameters = ""
	_parametric = False

	def _data_shuffle(self, original_formatted_data):
		features = pd.DataFrame([x[0] for x in original_formatted_data])
		target = np.array([x[1] for x in original_formatted_data])
		target = np.array([np.where(np.array(sorted(set(target)))==y)[0][0] for y in target])
		features.columns = np.array(range(0, features.shape[1])).astype(str)
		features.replace(np.nan, 0, inplace=True)
		features = features.apply(lambda x:x.astype(int))
		return features, target

	def _train(self, features, target, class_num):
		# self._model = SklearnClassifier()
		self._model = xgb.XGBRegressor(
			# tree_method='gpu_hist', gpu_id=0,
			objective="multi:softprob", random_state=42, num_class=class_num,
			max_depth=2, nthread=-1)
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
		elif sample_type == 'test':
			predictions = self._model.predict(features)
			self._accuracy_test = accuracy(target, predictions)
			self._test_true_positive_num = sum(np.array(target) != -1)

	def cross_validation(self):
		accuracy_train_sum = 0
		accuracy_test_sum = 0
		kfold = KFold(n_splits=5, shuffle=True, random_state=42)
		scores = []
		X, y = self._data_shuffle(self._observation)
		class_num = len(set(y))
		for train_index, test_index in kfold.split(X):
			X_train, X_test = X.loc[train_index], X.loc[test_index]
			y_train, y_test = y[train_index], y[test_index]
			before = time.time()
			self._train(X_train, y_train, class_num)
			after = time.time()
			import pdb; pdb.set_trace()  # breakpoint 3d6ed4d7 //
			print("One XGBoost model trained with time in {} seconds".format(str(after - before)))
			self._test(X_train, y_train, 'train')
			self._test(X_test, y_test, 'test')
			accuracy_train_sum += self._accuracy_train
			accuracy_test_sum += self._accuracy_test

		self._accuracy_train = accuracy_train_sum / self._k
		self._accuracy_test = accuracy_test_sum / self._k
		import pdb; pdb.set_trace()  # breakpoint a24ec29b //


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
	_word2vec_model = W2V_MODEL
	_vector_size = _word2vec_model.vector_size

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