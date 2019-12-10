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
import docx
import os
import abc
import re
import datetime
import json

from typing import Callable, Dict, List
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer

from utils import clean_string
from word_embedding import *
from tagging import *
from db.db_connector import DBConnector
from db.config import PGTABLE

ps = PorterStemmer()
TRAINING_INGREDIENT_PATH = 'training_ingredients/'

class PreprocessingAbstract():
	"""
	Bundle of preprocessing methods
	"""
	def __init__(self, file_path, embedding_method, tag_obtaining_method,
			remove_stop_words: bool, do_stemming: bool):
		self._file_path = file_path
		self._contract_doc = self._load_file(self._file_path)
		self._remove_stop_words = remove_stop_words
		self._do_stemming = do_stemming
		self._stop_words = set(stopwords.words("english"))
		self._embdedding_method = eval(embedding_method)
		self._tag_obtaining_method = tag_obtaining_method

	@abc.abstractmethod
	def _load_file(self, file_path):
		"""
		Load file
		"""
		pass


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
		return word.lower() in self._stop_words

	def _stemming(self, word):
		"""
		Do stemming to make for example,
		doing==do, better==good
		because they have usually same meanings

		TODO: more specific stemming rules for legal contract
		"""
		return ps.stem(word)

	def _word_embedding(
			self, word_list: List[str], method: Callable) -> Dict:
		"""
		word embedding that turn words into quantitative values 
		which can then be machine learned
		"""
		return method(word_list)


	def _get_tags(
			self, paragraph: Dict, 
			word_vec: Dict, method: Callable) -> Dict:
		"""
		Get tags for topic classification 
		"""
		return method(paragraph, word_vec)


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

	def _word_scan(self, raw_word_vec, current_label) -> List:
		list_of_words = []
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

		quantified_word_vec = self._word_embedding(
			list_of_words, self._embdedding_method
		)

		# add tag for the paragraph

		# TODO: activate this once manual tags are done
		# quantified_word_vec = self._get_tags(
		# 	quantified_word_vec, 
		# 	raw_word_vec, 
		# 	self._tag_obtaining_method
		# )
		return (
			quantified_word_vec, current_label
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
		preprocessing_start = datetime.datetime.strftime(
			datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
		derived_observations = self._numerize_texts()
		# save the list
		self._write_json_to_file(derived_observations)

		preprocessing_end = datetime.datetime.strftime(
			datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")

		new_row_id = self._create_learning_entry(
			preprocessing_start,
			preprocessing_end
		)
		
		print(
			"""New result entry ID is: \n %s \n 
			Please use it in training""" % (new_row_id)
		)

	def _write_json_to_file(self, output: List[Dict]):
		"""
		Save list of dictionaries and write to txt file
		"""
		filebase = os.path.splitext(os.path.basename(
				self._file_path))[0]
		filename = filebase
		filepath = os.path.join(
			os.getcwd(), 
			TRAINING_INGREDIENT_PATH, 
			filebase+'.txt'
		)
		f = open(filepath, 'w')
		f.write(json.dumps(output))
		f.close()

	def _create_learning_entry(self, start_time, end_time) -> int:
		"""
		Create a learning record/entry in DB for this preprocessing action
		trigged after every preprocessing and before a training take place
		
		:Return: an 'id' will be returned which can then be passed 
		into the ML tranining process
		"""
		conn = DBConnector()
		return conn.insert(
			table_name=PGTABLE,
 			stop_word_removed=self._remove_stop_words,
			stemming=self._do_stemming,
			preprocessing_start=start_time,
			preprocessing_end=end_time
		)


class DocxPreprocessing(PreprocessingAbstract):
	def _load_file(self, file_path):
		full_path = os.path.join(os.getcwd(), file_path)
		return docx.Document(full_path)

	def _numerize_texts(self) -> List:
		derived_observations = []
		current_label = ''
		if len(self._contract_doc.paragraphs) > 0:
			for p in self._contract_doc.paragraphs:
				if len(p.text) == 0:
					# if the paragraph is empty skip it
					continue

				# if a paragraph starts with Appendix then jump out 
				# and stop looping through the rest of doc as those are not needed
				# trait: page title

				if p.text.lower().startswith('appendix') or \
				p.text.lower().startswith('exhibit') or \
				p.text.lower().startswith('annex') or \
				p.text.lower().startswith('schedule'):
					break

				# remove curly brackets
				text = re.sub(r'[{,}]', '', p.text)
				raw_word_vec = self._tokenize(text)
				# make TAG_OR_NOT judgement first as we use stop words to identify
				# TODO: REMOVE this when we have mannual tags in documents
				if self._caption_as_label(text, raw_word_vec):
					current_label = clean_string(text)

				derived_observations.append(
					self._word_scan(raw_word_vec, current_label)
				)
		return derived_observations


class RtfPreprocessing(PreprocessingAbstract):
	_paragraph_separator_sub = "###############"
	def _load_file(self, file_path):
		full_path = os.path.join(os.getcwd(), file_path)
		return open(full_path).read()

	def _numerize_texts(self) -> List:
		derived_observations = []
		current_label = ''
		#--- remove format paragraph
		text = re.sub(r'\\rtf1[\s,\S]*?\\par ', '', self._contract_doc)
		#---remove cross-ref: datafields
		text = re.sub(r'{\\field[\s,\S]+?\\sectd', '', text)
		#--- split the text by \\par
		text = re.sub(
			r'\\par\s', self._paragraph_separator_sub, text)
		#--- remove comments 
		text = re.sub(r'\\atrfend[\s,\S]*?}}}', '', text)
		# remove some special text coloring
		text = re.sub(r'\\bkmk.*?}', '', text)
		#--- split the text by special string into different paragraphs
		paragraphs = text.split(self._paragraph_separator_sub)
		#--- loop through every paragraph
		current_paragraph_section = 0
		index_topic_map = {}
		for paragraph in paragraphs:
			if re.search(r'\\ul', paragraph):
				# skip sections that doesn't look like legal content
				# text with tag \ul will have underline which doesn't look right
				continue
			#--- remove all decorative tags
			paragraph = re.sub(r'\\[a-z,A-Z,0-9,\-,\*,\']*', '', paragraph)
			paragraph = re.sub(r'\\~', '', paragraph)
			#--- remove cross refs 

			#TODO: something left! a long hash string eft like this

			# 
			paragraph = re.sub(r'_Ref\d+', '', paragraph)
			#--- remove table of content bookmarks
			paragraph = re.sub(r'_Toc\d*', '', paragraph)
			#--- remove curly brackets
			paragraph = re.sub(r'[{,}]', '', paragraph)
			#--- destroy TOB - example: Cont_0014.rtf
			# Otherwise sometimes >1 DEFINITIONS in the next step will be spotted
			paragraph = re.sub(r'TOC[\S,\s]*PAGEREF[\s,\S]*PAGEREF', '', paragraph)
			# TODOs:
			# - hyphen in title
			# - space and line break in title

			# skip definition
			paragraph = paragraph.lower().strip()
			if len(paragraph) == 0:
				# if the paragraph is empty skip it
				continue

			# remove space at front just for caption detection
			paragraph = re.sub(r'^\s+', '', paragraph)

			# if a paragraph starts with Appendix then jump out 
			# and stop looping through the rest of doc as those are not needed
			# 'appendix' 'schedule' 'exhibit' 'annex'
			# trait: page title

			if paragraph.startswith('appendix') or \
				paragraph.startswith('exhibit') or \
				paragraph.startswith('annex') or \
				paragraph.startswith('schedule'):
				break
			# index_search = re.search(r'(\d[\.\d]*).*Definition', paragraph)
			# replace all white space
			no_space_string = re.sub(r'[\s, \n]', '', paragraph)
			caption_search = re.search(
				r'^(\d+)[\., \s]*((?![0-9, \.]).+)', no_space_string)
			if caption_search:
				# caption-like string is found
				# current_label = caption_search.group(2)
				current_label = re.search(
					r'\d+\.?\s*([\w, \s, \-, \,]+)', paragraph
				).group(1).lower().strip()
				current_label = re.sub(r'\s\s+', ' ', current_label)
				# concatenate broken label - this happen sometimes

				# current_paragraph_section = caption_search.group(1)
				# index_topic_map[]
				# current_label = 'definition'				
			else:
				# no caption-like string is found
				if 'definition' in current_label or \
					current_label == '' or \
					not re.search(r'\w', current_label):
					# Skip when
					# * it is definition
					# * it does not belong to any label
					continue
				else:
					# if no special skipping needed then record it
					# in bag of words
					# remove bullet numbering & letters (roman)
					paragraph = re.sub(r'^[\d, \.]*', '', paragraph)
					paragraph = re.sub(r'[\(]*\w\)', '', paragraph)
					# remove cross ref without links
					paragraph = re.sub(r'[clause, section]\s\d+[\.\d+]*', '', paragraph)
					# replace tilde with space which sometimes happen
					# eg. Cont_0001.rtf section 6.3
					paragraph = re.sub(r'~', ' ', paragraph)
					#TODO: tokenize that easy? white spaces?
					raw_word_vec = self._tokenize(paragraph)
					# remove tokens with only non-alphabetical chars
					raw_word_vec = [w for w in raw_word_vec if re.search(r'\w', w)]
					derived_observations.append(
						self._word_scan(raw_word_vec, current_label)
					)
		return derived_observations
