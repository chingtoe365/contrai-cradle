# Tagging methods
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	To provide a tag obtaining methods repository 
	from which a way to get tag can be chosen 
	during the preprocessing of contracts
"""

import nltk
from typing import List, Dict, Tuple

def no_label(
		quan_raw_word_vec: Dict, 
		raw_word_vec: Dict,
		current_label: str
	) -> Tuple:
	"""
	Do nothing as in this case no label is needed
	"""
	return (quan_raw_word_vec)

def label_at_tail(
		quan_raw_word_vec: Dict, 
		raw_word_vec: Dict,
		current_label: str
	) -> Tuple:
	"""
	In this case label is tailing at the end of the paragraph
	"""
	return (
		quan_raw_word_vec, raw_word_vec[-1]
	)

def heading_as_label(
		quan_raw_word_vec: Dict, 
		raw_word_vec: Dict,
		current_label: str
	) -> Tuple:
	return (
			quan_raw_word_vec, current_label
		)