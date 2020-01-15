# Word embedding methods
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	To provide a word-embedding methods repository 
	from which a way to quantify words can be chosen 
	during the preprocessing of contracts
"""

import nltk
from typing import List, Dict

def count_occurence(list_of_words: List) -> Dict:
	"""
	To return occurence of words as a way to measure frequency
	"""
	return dict(nltk.FreqDist(list_of_words))

def boolean_occurence(list_of_words: List) -> Dict:
	"""
	To return dict with words that occurs
	while ignoring how many times they occurs
	"""
	return {x: True for x in set(list_of_words)}
