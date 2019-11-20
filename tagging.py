# Word embedding methods
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	To provide a tag obtaining methods repository 
	from which a way to get tag can be chosen 
	during the preprocessing of contracts
"""

import nltk
from typing import List, Dict

def no_label(quan_word_vec: Dict, word_vec: Dict) => Dict:
	"""
	Do nothing as in this case no label is needed
	"""
	return quan_word_vec

def label_at_tail(quan_word_vec: Dict, word_vec: Dict) => Dict:
	"""
	In this case label is tailing at the end of the paragraph
	"""
	return {
		quan_word_vec, word_vec[-1]
	}

def caption_as_label() => Dict:
	#TODO: search up-level caption as tag/topic
	pass