# Word embedding methods
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	To provide a word-embedding methods repository 
	from which a way to quantify words can be chosen 
	during the preprocessing of contracts
"""

import nltk
from typing import List, Dict

from contrai_cradle.event_logger import logger

def count_occurence(list_of_words: List) -> Dict:
	"""
	To return occurence of words as a way to measure frequency
	@args[0]: list of words
	"""
	# list_of_words = kwargs['list_of_words']
	return dict(nltk.FreqDist(list_of_words))

def boolean_occurence(list_of_words: List) -> Dict:
	"""
	To return dict with words that occurs
	while ignoring how many times they occurs
	@args[0]: list of words
	"""
	return {x: True for x in set(list_of_words)}

def tfidf(list_of_words: List) -> Dict:
	"""
	To return dict with tfidf values for each word
	args[0]-@tfidf_mat:: tfidf matrix calcuated for whole document
	args[1]-@word_list:: word list to map matrix columns
	args[2]-@doc_count:: doc here refer to clause actually, 
	indicating which row to look at in the clause
	"""
	# mat = tfidf_mat.toarray()
	# word_list = tfidf_mat.get_feature_names()
	# mat = kwargs['tfidf_mat']
	# word_list = kwargs['word_list']
	# doc_count = kwargs['doc_count']
	# try:
	# 	return {word_list[ind]: val for ind, val in enumerate(mat[doc_count])}
	# except Exception as e:
	# 	logger.error("Error in extracting tfidf matrix")
	# 	return {}
	return dict(nltk.FreqDist(list_of_words))

def raw_string(list_of_words: List):
	return ' '.join(list_of_words)