# Orchestration 
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	A integrated orchestration of NLK text preprocessing
	classifier model training and testing and evaluation
"""

import argparse
import json
import datetime
import os
import logging

from os import listdir

from preprocessing import DocxPreprocessing, RtfPreprocessing
from learning import ModelClassSelector
from db.db_connector import DBConnector
from db.config import PGTABLE
from event_logger import logger

PREPROCESS_CLS_MAP = {
	'rtf': RtfPreprocessing,
	'docx': DocxPreprocessing
}
TRAINING_INGREDIENT_PATH = 'training_ingredients/'
CONTRACT_PATH = 'contracts/'

def merge_datasets() -> str:
	# get list of json txt files
	training_ingredient_path = os.path.join(
		os.getcwd(),
		TRAINING_INGREDIENT_PATH
	)
	files = listdir(training_ingredient_path)
	aggregate = []
	for file in files:
		if file.startswith('Cont'):
			# only process those names starting with Cont_
			filepath = os.path.join(
				training_ingredient_path,
				file
			)
			json_txt = open(filepath).read()
			file_json = json.loads(json_txt)
			aggregate += file_json

	timestamp = datetime.datetime.strftime(
			datetime.datetime.now(), "%Y%m%d%H%M%S")
	output_filepath = os.path.join(
		os.getcwd(), 
		TRAINING_INGREDIENT_PATH, 
		timestamp+'.txt'
	)
	f = open(output_filepath, 'w')
	f.write(json.dumps(aggregate))
	f.close()
	return timestamp+'.txt'

def create_learning_entry(
		start_time, 
		end_time, 
		embedding_method: str,
		tag_obtaining_method: str,
		remove_stop_words: str,
		do_stemming: str,
		sample_file_path: str
	) -> int:
	"""
	Create a learning record/entry in DB for this preprocessing action
	trigged after every preprocessing and before a training take place
	
	:Return: an 'id' will be returned which can then be passed 
	into the ML tranining process
	"""
	conn = DBConnector()
	return conn.insert(
		table_name=PGTABLE,
		stop_word_removed=remove_stop_words,
		stemming=do_stemming,
		preprocessing_start=start_time,
		preprocessing_end=end_time,
		sample_file_path=sample_file_path
	)

def main(
		action: str,
		file_path: str,
		input_file_format: str,
		embedding_method: str, 
		tag_obtaining_method: str, 
		remove_stop_words: bool, 
		do_stemming: bool,
		model: str
	):
	"""
	Main initializer of complete NLP study
	"""
	if action == 'preprocess':
		contracts_path = os.path.join(
			os.getcwd(),
			CONTRACT_PATH
		)
		file_paths = listdir(contracts_path)
		if file_path:
			file_paths = [
				os.path.join(
					os.getcwd(),
					file_path
				)
			]
			if file_path.endswith('.rtf'):
				input_file_format = 'rtf'
			elif file_path.endswith('.docx'):
				input_file_format = 'docx'
			else:
				raise Exception("""
					Input contract file type not supported.
					Only .rtf and .docx are supported.
				""")
		else:
			file_paths = [os.path.join(contracts_path, p) for p in file_paths]

		preprocess_cls = PREPROCESS_CLS_MAP[input_file_format]
		preprocessing_start = datetime.datetime.strftime(
			datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")

		for file_path in file_paths:
			if file_path.endswith(input_file_format):
				# only process specified file formats
				individual_file_preprocess_engine = preprocess_cls(
					file_path, 
					embedding_method,
					tag_obtaining_method,
					remove_stop_words,
					do_stemming
				)
				try:
					individual_file_preprocess_engine.bag_of_word_dict_transformer()
				except Exception as e: 
					logger.error(file_path+"\n "+str(e))

		sample_file_path = merge_datasets()

		preprocessing_end = datetime.datetime.strftime(
			datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")

		new_row_id = create_learning_entry(
			preprocessing_start,
			preprocessing_end,
			embedding_method,
			tag_obtaining_method,
			remove_stop_words,
			do_stemming,
			sample_file_path
		)

		print(
			"""New result entry ID is: \n %s \n 
			Please use it in training""" % (new_row_id)
		)

	elif action == 'train-test':
		train_classifier = ModelClassSelector(
			).convert_string_to_classifier(model)
		train_classifier()
	else:
		raise Exception("""
			Wrong action: available options 'preprocess'/'trian-test'
		""")



if __name__ == '__main__':

	"""
	file_path, embedding_method, tag_obtaining_method,
		remove_stop_words: bool, do_stemming: bool
	"""
	parser = argparse.ArgumentParser(description="""
		Preprocess, train and test NLP classifier model
	""")
	parser.add_argument(
		"--action",
		choices=['preprocess', 'train-test'], 
		help="What action to take", 
		dest="action",
		required=True
	)
	parser.add_argument(
		"--file-path",
		help="A specific file to preprocess", 
		dest="file_path"
	)
	parser.add_argument(
		"--input-file-format", 
		help="Contract file path to be processed", 
		dest="input_file_format",
		default="rtf"
	)
	parser.add_argument(
		"--embedding-method", 
		help="How to quantify words", 
		dest="embedding_method",
		default="count_occurence"
	)
	parser.add_argument(
		"--tag-obtaining-method", 
		help="How to obtain tags", 
		dest="tag_obtaining_method",
		default="heading_as_label"
	)
	parser.add_argument(
		"--remove-stop-wrods", 
		help="Removing stop words or not", 
		dest="remove_stop_words",
		default=True,
		type=bool
	)
	parser.add_argument(
		"--do-stemming", 
		help="Do stemming or not", 
		dest="do_stemming",
		default=True,
		type=bool
	)
	parser.add_argument(
		"--model", 
		help="Model to train classifier", 
		dest="model",
		default="naive_bayes"
	)
	args = parser.parse_args()

	if args.action == 'preprocess':
		print("""
			The action is chosen to preprocess contracts \n
		""")
		if args.file_path is None:
			print("""
				No single file was passed \n
				Batch processing all files under contract folder... \n
			""")
	else:
		print("""
			The action is chosen to train and test classifying models \n
		""")

	main(
		args.action,
		args.file_path,
		args.input_file_format,
		args.embedding_method,
		args.tag_obtaining_method,
		args.remove_stop_words,
		args.do_stemming,
		args.model
	)