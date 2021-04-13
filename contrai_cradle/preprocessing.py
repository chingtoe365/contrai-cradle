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
nltk.download('stopwords')
nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')
import docx
import os
import abc
import re, string, unicodedata
import datetime
import json
import pickle
import contractions
import inflect
import pandas as pd
import logging
from bs4 import BeautifulSoup


from typing import Callable, Dict, List
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.chunk import *
from nltk import Tree

from sklearn.feature_extraction.text import TfidfVectorizer

from contrai_cradle.nlp_tools.chunkers import ntc
from contrai_cradle.utils import clean_string, update_dict_by_accumulate
from contrai_cradle.analytics.sentence_tree_analytics import SentenceTreeFeatureScanner

from contrai_cradle.word_embedding import *
from contrai_cradle.tagging import *
from contrai_cradle.config.constants import EXAGERATE_COEF
from contrai_cradle.event_logger import logger
from contrai_cradle.config.constants import TRAINING_INGREDIENT_PATH, \
MIDDLE_INGREDIENT_PATH, WORD2VEC_INGREDIENT_PATH, POS_IMAGE_FOLDER
ps = PorterStemmer()
stop_words = set(stopwords.words("english"))


class PreprocessingAbstract():
	"""
	Bundle of preprocessing methods
	"""
	def __init__(self, file_path, embedding_method, tag_obtaining_method,
			remove_stop_words: bool, do_stemming: bool, strigent_topic: bool,
			ngram: list, multiple_paragraphs: bool, ngram_mixed:bool,
			ngram_literated: bool, pos: list, semantic_analysis: bool, 
			extract_sentence: bool, debug:bool):
		self._file_path = file_path
		self._contract_doc = self._load_file(self._file_path)
		self._remove_stop_words = remove_stop_words
		self._do_stemming = do_stemming
		# self._stop_words = set(stopwords.words("english"))
		self._embedding_method = embedding_method
		self._tag_obtaining_method = eval(tag_obtaining_method)
		self._strigent_topic = strigent_topic
		self._ngram = ngram
		self._multiple_paragraphs = multiple_paragraphs
		# self._ngram_mixed = ngram_mixed
		self._ngram_literated = ngram_literated
		self._pos = pos
		self._semantic_analysis = semantic_analysis
		# TOOD: currently only implemented in CSV preprocessor
		# implement it in all preprocessors
		self._extract_sentence = extract_sentence
		self._debug = debug

	@abc.abstractmethod
	def _load_file(self, file_path):
		"""
		Load file
		"""
		pass
	
	def _strip_html(self, text):
		soup = BeautifulSoup(text, "html.parser")
		return soup.get_text()

	def _remove_between_square_brackets(self, text):
		return re.sub(r'\[[^]]*\]', '', text)

	def denoise_text(self, text):
		text = self._strip_html(text)
		text = self._remove_between_square_brackets(text)
		return text
	
	def replace_contractions(self, text):
		"""Replace contractions in string of text"""
		return contractions.fix(text)
	
	def _remove_non_ascii(self, words):
		"""Remove non-ASCII characters from list of tokenized words"""
		new_words = []
		for word in words:
			new_word = unicodedata.normalize('NFKD', word).encode(
				'ascii', 'ignore').decode('utf-8', 'ignore')
			new_words.append(new_word)
		return new_words

	def _to_lowercase(self, words):
		"""Convert all characters to lowercase from list of tokenized words"""
		new_words = []
		for word in words:
			new_word = word.lower()
			new_words.append(new_word)
		return new_words

	def _remove_punctuation(self, words):
		"""Remove punctuation from list of tokenized words"""
		new_words = []
		for word in words:
			new_word = re.sub(r'[^\w\s]', '', word)
			if new_word != '':
				new_words.append(new_word)
		return new_words
	
	def _replace_punctuation(self, words):
		new_words = []
		for word in words:
			if word == '%':
				new_words.append('percent')
			elif word == '-':
				new_words.append('to')
			elif word == '+':
				new_words.append('plus')
			elif word == '/':
				new_words.append('or')
			else:
				new_words.append(word)
		return new_words

	def _replace_numbers(self, words):
		"""Replace all interger occurrences in list of tokenized words with textual representation"""
		p = inflect.engine()
		new_words = []
		for word in words:
			if word.isdigit():
				new_word = p.number_to_words(word)
				new_words.append(new_word)
			else:
				new_words.append(word)
		return new_words

	def normalize(self, words):
		words = self._remove_non_ascii(words)
		words = self._to_lowercase(words)
		# words = self._replace_numbers(words)
		words = self._replace_punctuation(words)
		words = self._remove_punctuation(words)
		return words

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
		return word.lower() in stop_words

	def _stemming(self, word):
		"""
		Do stemming to make for example,
		doing==do, better==good
		because they have usually same meanings

		TODO: more specific stemming rules for legal contract
		"""
		return ps.stem(word)

	def _word_embedding(
			self, method: Callable, list_of_words: List) -> Dict:
		"""
		word embedding that turn words into quantitative values 
		which can then be machine learned
		"""
		return method(list_of_words)


	def _get_tags(
			self, quant_word_vec: Dict, word_vec: Dict, 
			current_label: str, method: Callable, 
			strigent: bool) -> Dict:
		"""
		Get tags for topic classification 
		"""
		return method(quant_word_vec, word_vec, current_label, strigent)

	def _definition_check(self, text):
		return any([x in text for x in ["definition", "intepretation"]])

	def _non_legal_content_check(self, paragraph):
		"""
		To identify paragraphs with non-legal content

		Starting with words like: 
		#contents #appendix #annex #exhibit #schedule
		"""
		return 	re.search(r'^contents', paragraph) or \
			re.search(r'^appendix', paragraph) or \
			re.search(r'^annex', paragraph) or \
			re.search(r'^exhibit', paragraph) or \
			re.search(r'^schedule', paragraph) or  \
			re.search(r'^list of', paragraph) or \
			re.search(r'^signed by', paragraph) or \
			re.search(r'^service block statement of work', paragraph)


	def _pos_tag_check(self, sentense, pos):
		"""
		part-of-speech tagging checking
		"""
		output = []
		tagged = nltk.pos_tag(sentense)
		for t in tagged:
			for p in pos:
				if t[1].startswith(p):
					output.append(t[0])
					break
		return output

	def _normality_check_with_pos_tag(self, sentense):
		"""
		Normality check for sentence
		Assuming each sentence should have DT?JJ*
		"""
		# grammar = ('''
		# 	NP: {<DT>?<JJ>*<NN>} # NP
		# 	''')
		# grammar = ('''
		# 	VP: {<DT>?<JJ>*<NN>} # VP
		# 	''')
		# tagged = nltk.pos_tag(sentense)
		# chunkParser =  nltk.RegexpParser(grammar)
		# tree = chunkParser.parse(tagged)
		# if len(self._pos_tag_check(sentense, 'V')) == 0:
		# 	print(sentense)
		return len(self._pos_tag_check(sentense, 'V')) > 0
		# for subtree in tree.subtrees():
		# 	print(subtree)
		# f = open(
		# 	os.path.join(
		# 		POS_IMAGE_FOLDER,
		# 		'sample.jpeg'
		# 	),
		# 	'wb'
		# )

	def _trunk_extraction(self, sentense):
		"""
		Squeeze/compress sentense
		"""
		# print(sentense)
		# grammar = ('''
		# 	NP: {<DT>?<VBG>*<JJ.>*<NN.>+}
		# 	NP: {<NP>?<NP>?}
		# 	VP: {<VBZ>?<CC>?<VBN>*}
		# 	VP: {<VB>+<IN>*}
		# 	CLAUSE: {<NP><VP>}
		# 	''')
		# grammar = ('''
		# 	NP: {<DT|PP\$>?<JJ.>*<NN.>+}
		# 		{<NNP>+}
		# 	VP: {<VBZ>?<CC>?<VBN>*}
		# 	VP: {<VB>+<IN>*}
		# 	CLAUSE: {<NP><VP>}
		# 	''')
		grammar = r"""
			NP: {<DT|P.+>?<VB.>?<JJ>?<NN.?>+}
				{<NNP>+}
				{<NP><CC><NP>}
				{<NP><PP>}
				{<NP><PP><NP>}
			PP: {<IN|TO>+<NP|JJ>}
				{<RB><JJ>}
				{<PP><CC>?<PP>}
			VP: {<MD>?<RB.?>?<VB.?>+<NP|PP|CLAUSE>?}
				{<VP>+}
			CLAUSE: {<NP><VP>}
			"""
		# grammar = r"""
		# 	NP: {<DT>?<VB.>?<JJ>?<NN.?>+}
		# 	"""
		# grammar = r"""
		# 	S: {<NP><VP>}
		# 	NP: {<DT|JJ|NN.*>+}          # Chunk sequences of DT, JJ, NN
		# 	PP: {<IN><NP>}               # Chunk prepositions followed by NP
		# 	VP: {<VB.*><NP|PP|CLAUSE>+$} # Chunk verbs and their arguments
		# 	CLAUSE: {<NP><VP>}           # Chunk NP, VP
		# """
		# grammer = ('''
		# 	# NP: {<DT|JJ|NN.*>+}          # Chunk sequences of DT, JJ, NN
		# 	NP: {<DT>?<JJ>*<NN>+}
		# 	#PP: {<IN><NP>}               # Chunk prepositions followed by NP
		# 	#VP: {<VB.*><NP|PP|CLAUSE>+$} # Chunk verbs and their arguments
		# 	#CLAUSE: {<NP><VP>}           # Chunk NP, VP
		# ''')
		tagged = nltk.pos_tag(sentense)
		# print(tagged)
		# tree = chunkParser.parse(tagged)
		# 1. use pre-trained trunk parser from in-built training dataset
		tree = ntc.parse(tagged)
		# 2. use regex parser to give some more depth of that
		regexChunkParser =  nltk.RegexpParser(grammar, loop=10)
		tree = regexChunkParser.parse(tree)
		# tagged = ' '.join([t[0]+"/"+t[1] for t in tagged])
		# tree = tagstr2tree(tagged)
		# print(tree)

		# import pdb; pdb.set_trace()  # breakpoint 996bba15 //
		# def traversal(t):
		# 	try:
		# 		t.node
		# 	except AttributeError:
		# 		print t
		# Tree.fromstring(str(tree)).pretty_print()
		# for subtree in tree.subtrees():
		# 	print(subtree)
		return tree
		

	def _caption_as_label(
			self,
			raw_text: str, 
			word_vec: List[str], 
			label_wc_limit=7, 
			stop_word_count_limit=2, 
		) -> bool:
		# search up-level caption as tag/topic
		"""
		Rules:
		- stop words not more than 2/3, excluding AND/OF/THE/FOR
		- no colons
		- paragraph length not more than 6

		TODO: DEPRECIATE when manual tagging is ready
		"""
		is_label = False
		stop_word_count = 0
		if len(word_vec) >= label_wc_limit:
			return is_label
		for word in word_vec:
			if word == ':':
				return is_label
			if word.lower() in ('and', 'of', 'the', 'for'):
				continue
			if self._is_stop_word(word):
				stop_word_count += 1
		if stop_word_count <= stop_word_count_limit:
			is_label = True
		return is_label

	@abc.abstractmethod
	def _numerize_texts(self) -> List:
		pass

	def _n_gram_bootstrapper(self, list_of_words, semantic_tree) -> List:
		return_list_of_words = []
		if self._ngram_literated:
			# split grams from within granular trunks in semantic tree
			tagged = nltk.pos_tag(list_of_words)
			semantic_tree = ntc.parse(tagged)
			for subtree in semantic_tree:
				# select only granular trunks with child elements of type tuple
				# by applying only base parser
				list_of_words_original_copy = [x[0] for x in subtree]
				# for i in range(2,(self._ngram+1)):
				for n in self._ngram:
					n = int(n)
					list_of_words_copy = list_of_words_original_copy.copy()
					while len(list_of_words_copy) >= n:
						return_list_of_words.append(
							' '.join(list_of_words_copy[0:n])
							# list_of_words_copy[0]+' '+list_of_words_copy[1]
						)
						list_of_words_copy = list_of_words_copy[1:]
		else:
			list_of_words_original_copy = list_of_words.copy()
			# if self._ngram_mixed:
				# if self._ngram > 1:
					# if more ngram split is required
			for n in self._ngram:
				n = int(n)
				list_of_words_copy = list_of_words_original_copy.copy()
				while len(list_of_words_copy) >= n:
					return_list_of_words.append(
						' '.join(list_of_words_copy[0:n])
						# list_of_words_copy[0]+' '+list_of_words_copy[1]
					)
					list_of_words_copy = list_of_words_copy[1:]
			# else:
			# 	list_of_words_copy = list_of_words_original_copy.copy()
			# 	list_of_words = []
			# 	while len(list_of_words_copy) >= self._ngram:
			# 		list_of_words.append(
			# 			' '.join(list_of_words_copy[0:self._ngram])
			# 			# list_of_words_copy[0]+' '+list_of_words_copy[1]
			# 		)
			# 		list_of_words_copy = list_of_words_copy[1:]
		return return_list_of_words

	def _word_scan(self, raw_word_vec, current_label, strigent, 
			semantic_tree_features=None) -> List:
		list_of_words = []
		# args_embedding_input = {}
		# switches to remove stop words and do stemming
		if self._remove_stop_words and self._do_stemming:
			for word in raw_word_vec:
				if self._is_stop_word(word):
					continue
				else:
					list_of_words.append(self._stemming(word))
		elif self._remove_stop_words and not self._do_stemming:
			for word in raw_word_vec:
				if self._is_stop_word(word):
					continue
				else:
					list_of_words.append(word)
		elif not self._remove_stop_words and self._do_stemming:
			for word in raw_word_vec:
				list_of_words.append(self._stemming(word))
		else:
			for word in raw_word_vec:
				list_of_words.append(word)

		# for word in list_of_words:
		# 	if len(word) > 20:

		list_of_words = self._n_gram_bootstrapper(
			list_of_words, semantic_tree_features
		)

		method = eval(self._embedding_method)
		# print(method)
		quantified_word_vec = self._word_embedding(
			method, list_of_words
		)

		# add tag for the paragraph
		return self._get_tags(
			quantified_word_vec, 
			raw_word_vec, 
			current_label,
			self._tag_obtaining_method,
			strigent
		)

	def bag_of_word_dict_transformer(self) -> List:
		"""
		Main function to transform words in contracts 
		to machine learnable format of input. 

		derived observation looks like this:
		[{
			{
				# clause/document 1
				
				"hello" : 1,
				"world": 5,
				"you": 4,
				xxx
			},
			"Indemity"
		}, {
			{
				# clause/document 2

				"legal": 4,
				"fine": 2,
				"responsibility": 1,
				xxx	
			},
			"Termination"
		}, 
		xxxx
		]
		"""

		numeric_objects = self._numerize_texts()
		# save the list
		if 'derived_observations' in numeric_objects:
			self._write_json_to_file(
				TRAINING_INGREDIENT_PATH, 
				numeric_objects['derived_observations']
			)
		if 'topic_file_pointer' in numeric_objects:
			self._write_json_to_file(
				MIDDLE_INGREDIENT_PATH, 
				numeric_objects['topic_file_pointer']
			)
		if 'word2vec_corpus' in numeric_objects:
			self._write_list_to_file(
				WORD2VEC_INGREDIENT_PATH, 
				numeric_objects['word2vec_corpus']
			)


	def _write_json_to_file(self, path_to_write, output: List[Dict]):
		"""
		Save list of dictionaries and write to txt file
		"""
		filebase = os.path.splitext(os.path.basename(
				self._file_path))[0]
		filename = filebase
		filepath = os.path.join(
			os.getcwd(), 
			path_to_write, 
			filebase+'.txt'
		)
		f = open(filepath, 'w')
		f.write(json.dumps(output))
		f.close()

	def _write_list_to_file(self, path_to_write, output: List[List[str]]):
		"""
		Save list of dictionaries and write to txt file
		"""
		filebase = os.path.splitext(os.path.basename(
				self._file_path))[0]
		filename = filebase
		filepath = os.path.join(
			os.getcwd(), 
			path_to_write, 
			filebase+'.data'
		)
		f = open(filepath, 'wb')
		pickle.dump(output, f)
		f.close()
