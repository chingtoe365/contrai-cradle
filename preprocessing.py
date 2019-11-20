# Contract preprocessing script
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	This script is used for preprocessing contracts 
	with the following stepstones
	- tokenization
	- stop words removing
	- stemming
	- speech tagging
	- trunking
	- chinking
	- named entity recognition
	- lemmatizing
"""

import nltk
import docx
import os

from typing import Callable, Dict, List, String
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer

ps = PorterStemmer()

class Preprocessing():
	"""
	Bundle of preprocessing methods
	"""
	def __init__(self, file_path, embedding_method, tag_obtaining_method):
		self._contract_doc = self._load_file(file_path)
		self._stop_words = set(stopwords.words("english"))
		self._embdedding_method = embedding_method
		self._tag_obtaining_method = tag_obtaining_method

	def _load_file(self, file_path):
		"""
		Loading file
		"""
		path = os.join(os.getcwd(), file_path)
		return docx.Document(path)

	def _tokenize(self, text):
		"""
		Tokenize the entire contract by sentences 
		"""
		return nltk.word_tokenize(text)

	def _is_stop_word(self, word):
		"""
		Remove stop words like for/in/at/... etc.
		Because they usually have no meanings

		TODO: more specific rules for legal contract stop words
		"""
		return word in self._stop_words

	def _stemming(self, word):
		"""
		Do stemming to make for example,
		doing==do, better==good
		because they have usually same meanings

		TODO: more specific stemming rules for legal contract
		"""
		return ps.stem(word)

	def _word_embedding(
			self, word_list: List[String], method: Callable) => Dict:
		"""
		word embedding that turn words into quantitative values 
		which can then be machine learned
		"""
		return method(word_list)

	def _get_tags(self, paragraph: String, method: Callable) => Dict:
		"""
		Get tags for topic classification 
		"""
		return method(paragraph)


	def bag_of_word_dict_transformer(self) => List:
		"""
		Main function to transform words in contracts 
		to machine learnable format of input. 
		"""
		derived_observations = []
		if count(self._contract_doc.paragraphs) > 0:
			for p in self._contract_doc.paragraphs:
				if len(p) == 0:
					# if the paragraph is empty skip it
					continue
				list_of_words = []
				clause_word_vec = self._tokenize(p.text)
				for word in clause_word_vec:
					if self._is_stop_word(word):
						continue
					else:
						list_of_words.append(self._stemming(word))
				quantified_word_vec = self._word_embedding(
					list_of_words, self._embdedding_method)
				quantified_word_vec = self._get_tags(
					quantified_word_vec, 
					clause_word_vec, 
					self._tag_obtaining_method
				)
				derived_observations.append(quantified_word_vec)
		return derived_observations
