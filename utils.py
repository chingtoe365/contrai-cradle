# String cleaning/processing utils
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	String cleaning/processing utils
	- chunk white space
	- remove dots at tails
"""
from nltk.stem import PorterStemmer
ps = PorterStemmer()

def clean_string(text):
	return text.replace('.', '').replace(' ', '')

def overlapping_word_count(str_a, str_b):
	"""
	compare two string and see if there are overlapping words

	eg. "payment and charges" and "terms of payment"

	@return: intersection word count
	"""
	overlap_loc = -1
	list_a = [ps.stem(x) for x in str_a.split(" ")]
	list_b = [ps.stem(x) for x in str_b.split(" ")]
	set_a = set(list_a)
	set_b = set(list_b)
	diff = set_a.intersection(set_b)
	diff_list = list(diff)
	overlap_wc = len(diff)
	# check location of first match in current label
	if overlap_wc > 0:
		overlap_loc = list_a.index(diff_list[0])
	return overlap_wc, overlap_loc