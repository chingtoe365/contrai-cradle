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

def update_dict_by_accumulate(d1, d2):
	"""
	merge dict as followings
	{a: 1, b: 2}, {a:2, c:1}
	to 
	{a:3, b:2, c:1}
	"""
	keys = set(list(d1.keys())+list(d2.keys()))
	values = []
	# [d1[k]+d2[k] for k in keys]
	for key in keys:
		if key not in d1:
			values.append(d2[key])
		elif key not in d2:
			values.append(d1[key])
		else:
			values.append(d1[key]+d2[key])
	return dict(zip(keys, values))


