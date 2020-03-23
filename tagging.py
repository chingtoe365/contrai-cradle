# Tagging methods
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	To provide a tag obtaining methods repository 
	from which a way to get tag can be chosen 
	during the preprocessing of contracts
"""

import nltk
from typing import List, Dict, Tuple
from difflib import SequenceMatcher
from collections import OrderedDict

from utils import overlapping_word_count

def similar(a, b):
	return SequenceMatcher(None, a, b).ratio()

LABEL_VALUE_MAP = {
	# "definition": 1,
	"commencement duration": 2, # "commencement/duration"
	"tupe": 3,
	"supplier responsibilities": 4, #"supplier responsibilities (may contain warranties)"
	"customer obligations": 5, # "customer obligations (may contain warranties)"
	"non solicitation": 6,
	"change control ": 7,
	"charges payments payment": 8, #"charges, payments and payment terms"
	"prices": 9,
	"price reviews cpi rpi annual": 10, #"price reviews (cpi/rpi/annual)"
	"expenses": 11,
	"intellectual property right": 12, # ipr
	"compliance laws policies law policy": 13, #"compliance with laws and policies"
	"data protection": 14,
	"confidentiality ": 15,
	"limitation liability": 16, #"limitation of liability"
	#TODO: liability and indemnity ---> what this belongs to?
	"termination": 17,
	"consequences termination": 18, #"consequences of termination"
	"force majeure": 19,
	"costs": 20, # "costs"
	"assignment": 21,
	"variation": 22,
	"waiver": 23,
	"rights remedies": 24, #"rights and remedies"
	"further assurance": 25,
	"severance": 26,
	"entire agreement": 27, #"entire agreement"
	"conflict": 28,
	"no partnership agency": 29, #"no partnership or agency"
	"third party rights": 30,
	"several liability": 31,
	"notices notice": 32, #"notices"
	"counterparts": 33,
	"alternative dispute resolution": 34, #adr
	"expert determination": 35,
	"warranties": 36, #"warranties"
	"indemnities": 37, #"indemnities"
	"insurance": 38,
	"licence grant images": 39, #"licence grant (software, images, etc)"
	"scope": 40, #"""scope (may be in separate schedule, or could be in body of agreement)"""
	"services": 41, # "services"
	"deliverables": 42, #"deliverables"
	"testing pre delivery": 43, #"testing (pre-delivery and acceptance)"
	"acceptance": 44,
	"ownership": 45,
	"rights transfer reproduction adaptation": 46, #"""rights in the software (transfer, reproduction, use, adaptation)"""
	"escrow source code": 47, #"escrow (source code)"
	"support": 48, #"support (may be in separate schedule)"
	"training": 49,
	"personnel": 50,
	"anti bribery": 51,
	"export control": 52,
	"insurance": 53,
	"subscriptions": 54, #"subscriptions"
	"supply": 55, #"supply of products"
	"forecasts": 56, #"forecasts"
	"orders": 57, #"orders"
	"quality packing": 58, #"quality/packing"
	"delivery": 59,
	"acceptance": 60,
	"faulty": 61, #"faulty products"
	"return procedure": 62, #"returns procedure"
	"title risk": 63, #"title and risk"
	"recalls": 64, #"recalls"
	# "prices": 65,
	# "price review": 66,
}
# TRUE_LABELS = [
# 	y for y in LABEL_VALUE_MAP.keys()
# ]

def no_label(
		quan_raw_word_vec: Dict, 
		raw_word_vec: Dict,
		current_label: str,
		strigent: bool
	) -> Tuple:
	"""
	Do nothing as in this case no label is needed
	"""
	return (quan_raw_word_vec)

def label_at_tail(
		quan_raw_word_vec: Dict, 
		raw_word_vec: Dict,
		current_label: str,
		strigent: bool
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
		current_label: str,
		strigent: bool
	) -> Tuple:
	try:
		label_value = 0
		max_wc = 0
		min_lc = -1
		close_label = ''
		# Estimate the true label from current label
		for label in LABEL_VALUE_MAP.keys():
			wc, lc = overlapping_word_count(current_label, label)
			if wc > max_wc:
				max_wc = wc
				close_label = label
			if wc == max_wc and wc > 0:
				if lc < min_lc:
					min_lc = lc
					max_wc = wc
					close_label = label
		if max_wc == 0:
			if strigent:
				return ()
			else:
				simlilarity_max = 0
				max_similarity_label = ''
				for x in LABEL_VALUE_MAP.keys():
					similarity = similar(x, current_label)
					if similarity > simlilarity_max:
						simlilarity_max = similarity
						max_similarity_label = x
				label_value = LABEL_VALUE_MAP[max_similarity_label]
		else:
			label_value = LABEL_VALUE_MAP[close_label]
		return (
			quan_raw_word_vec, label_value
		)
	except Exception as e:
		raise Exception("wrong labelling")