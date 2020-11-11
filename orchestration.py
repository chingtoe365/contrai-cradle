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
import pickle
import multiprocessing as mp
from multiprocessing import Pool, TimeoutError


from queue import Queue
from threading import Thread, Event


from os import listdir

from contrai_cradle.preprocessing import DocxPreprocessing, RtfPreprocessing, CsvPreprocessing
from contrai_cradle.learning import ModelClassSelector
from contrai_cradle.db.db_connector import DBConnector
from contrai_cradle.db.config import PPC_TABLE
from contrai_cradle.event_logger import logger
from itertools import product

PREPROCESS_CLS_MAP = {
	'rtf': RtfPreprocessing,
	'docx': DocxPreprocessing,
	'csv': CsvPreprocessing
}
TRAINING_INGREDIENT_PATH = 'training_ingredients/'
MIDDLE_INGREDIENT_PATH = 'middleware_ingredients/'
WORD2VEC_INGREDIENT_PATH = 'word2vec_ingredients/'
CONTRACT_PATH = 'contracts/'


def merge_datasets(path_to_merge, suffix, filename=None) -> str:
	# get list of json txt files
	training_ingredient_path = os.path.join(
		os.getcwd(),
		path_to_merge
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
			if suffix == 'txt':
				json_txt = open(filepath).read()
				file_json = json.loads(json_txt)
				aggregate += file_json
			elif suffix == 'data':
				f = open(filepath, 'rb')
				l = pickle.load(f)
				aggregate += l
				f.close()
			else:
				pass
	if not filename:
		timestamp = datetime.datetime.strftime(
				datetime.datetime.now(), "%Y%m%d%H%M%S")
		filename = timestamp
	output_filepath = os.path.join(
		os.getcwd(), 
		path_to_merge,
		filename+'.'+suffix
	)
	if suffix == 'txt':
		f = open(output_filepath, 'w')
		f.write(json.dumps(aggregate))
		f.close()
	elif suffix == 'data':
		f = open(output_filepath, 'wb')
		pickle.dump(aggregate, f)
		f.close()

	return filename+'.txt', len(aggregate)

def create_learning_entry(
		start_time, 
		end_time, 
		embedding_method: str,
		tag_obtaining_method: str,
		remove_stop_words: str,
		do_stemming: str,
		strigent_topic: str,
		ngram: str,
		ngram_mixed: str,
		ngram_literated: str,
		semantic_analysis: str,
		multiple_paragraphs: str,		
		pos: str,
		sample_count: int,
		sample_file_path: str,
		exclude_file_names: list,
		input_file_format: str
	) -> int:
	"""
	Create a learning record/entry in DB for this preprocessing action
	trigged after every preprocessing and before a training take place
	
	:Return: an 'id' will be returned which can then be passed 
	into the ML tranining process
	"""
	conn = DBConnector()
	exclude_filename_string = ''
	if len(exclude_file_names) > 0:
		exclude_filename_string = ','.join(exclude_file_names)

	if pos:
		pos = ','.join(pos)
		
	return conn.insert(
		PPC_TABLE,
		stop_word_removed=remove_stop_words,
		stemming=do_stemming,
		preprocessing_start=start_time,
		preprocessing_end=end_time,
		sample_file_path=sample_file_path,
		embedding_method=embedding_method,
		strigent_topic=strigent_topic,
		# ngram=ngram,
		ngram_list=ngram,
		ngram_mixed=ngram_mixed,
		ngram_literated=ngram_literated,
		semantic_analysis=semantic_analysis,
		multiple_paragraphs=multiple_paragraphs,
		pos=pos,
		sample_count=sample_count,
		exclude_contracts=exclude_filename_string,
		input_format=input_file_format
	)

def preprocessing_worker(*args):
	# while True:
	# item = job_Q.get()
	# print(args)
	filepath, \
	pp_class, \
	embedding_method, \
	tag_obtaining_method, \
	remove_stop_words, \
	do_stemming, \
	strigent_topic, \
	ngram, \
	multiple_paragraphs, \
	ngram_mixed, \
	ngram_literated, \
	pos, \
	semantic_analysis, \
	debug = args[0]
	# print(filepath)
	print(f'Working on {filepath}')
	# only process specified file formats
	individual_file_preprocess_engine = pp_class(
		filepath, 
		embedding_method,
		tag_obtaining_method,
		remove_stop_words,
		do_stemming,
		strigent_topic,
		ngram,
		multiple_paragraphs,
		ngram_mixed,
		ngram_literated,
		pos,
		semantic_analysis,
		debug
	)
	try:
		individual_file_preprocess_engine.bag_of_word_dict_transformer()
	except Exception as e: 
		logger.error(fp+"\n "+str(e))
		# job_Q.task_done()
	# job_Q.task_done()
	print(f'Finished {filepath}')
		# if threadStopFlag:

def main(
		action: str,
		file_path: str,
		exclude_file_names: list,
		input_file_format: str,
		embedding_method: str, 
		tag_obtaining_method: str, 
		remove_stop_words: bool, 
		do_stemming: bool,
		strigent_topic: bool,
		ngram: list,
		multiple_paragraphs: bool,
		ngram_mixed: bool,
		ngram_literated: bool,
		semantic_analysis: bool,
		merge_only: bool,
		pos: list,
		training_id: int,
		topic: str,
		model: str,
		note: str,
		cv_fold_num: int,
		save_model:bool,
		param_c:float,
		param_max_iter:int,
		debug: bool
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
		filtered_file_paths = []
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
			elif file_path.endswith('.csv'):
				input_file_format = 'csv'
			else:
				raise Exception("""
					Input contract file type not supported.
					Only .rtf and .docx are supported.
				""")
		else:
			if not merge_only:
				file_paths = [os.path.join(contracts_path, p) for p in file_paths]
			else:
				file_paths = []

		preprocess_cls = PREPROCESS_CLS_MAP[input_file_format]
		preprocessing_start = datetime.datetime.strftime(
			datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")

		if not merge_only:
			job_Q = Queue()
			num_threads = os.cpu_count()
			# threadStopFlag = 0
			# def preprocessing_worker():
			# 	while True:
			# 		item = job_Q.get()
			# 		print(f'Working on {item}')
			# 		# only process specified file formats
			# 		individual_file_preprocess_engine = preprocess_cls(
			# 			item, 
			# 			embedding_method,
			# 			tag_obtaining_method,
			# 			remove_stop_words,
			# 			do_stemming,
			# 			strigent_topic,
			# 			ngram,
			# 			multiple_paragraphs,
			# 			ngram_mixed,
			# 			ngram_literated,
			# 			pos,
			# 			semantic_analysis,
			# 			debug
			# 		)
			# 		try:
			# 			individual_file_preprocess_engine.bag_of_word_dict_transformer()
			# 		except Exception as e: 
			# 			logger.error(fp+"\n "+str(e))
			# 			job_Q.task_done()
			# 		job_Q.task_done()
			# 		print(f'Finished {item}')
			# 		# if threadStopFlag:
			# 		# 	break


			for fp in file_paths:
				skip_file = False
				for efn in exclude_file_names:
					# skip selected contracts that passed through
					if efn in item:
						skip_file = True
						break
				if skip_file:
					continue
				if fp.endswith(input_file_format):
					job_Q.put(fp)
					filtered_file_paths.append(fp)
			print('All task requests sent\n', end='')
			
			#### MULTI PROCESSING #####
			threads = []
			procs = []
			# for i in range(num_threads):
			# 	worker = Thread(target=preprocessing_worker)
			# 	worker.setDaemon(True)
			# 	threads.append(worker)

			# for thread in threads:
			# 	thread.start()

			# # for thread in threads:
			# # 	thread.join()

			# job_Q.join()
			args_combi = [        
				[x for x in p] for p in product(*[
					filtered_file_paths,
					[preprocess_cls, ],
					[embedding_method,],
					[tag_obtaining_method,],
					[remove_stop_words,],
					[do_stemming,],
					[strigent_topic,],
					[ngram,],
					[multiple_paragraphs,],
					[ngram_mixed,],
					[ngram_literated,],
					[pos,],
					[semantic_analysis,],
					[debug,],
				])
			]
			# for i in range(num_threads):
			# 	proc = mp.Process(target=preprocessing_worker, args=args_combi)
			# 	procs.append(proc)
			# 	proc.start()

			# for proc in procs:
			# 	proc.join()
			with Pool(processes=num_threads) as pool:
				# multiple_results = [pool.apply_async(os.getpid, ()) for i in range(4)]
				pool.map(preprocessing_worker, args_combi)

			# threadStopFlag = 1
			# turn-on the worker thread
			# Thread(target=preprocessing_worker, daemon=True).start()
			
			print('All tasks completed')
			# for fp in filtered_file_paths:
			# 	individual_file_preprocess_engine = preprocess_cls(
			# 		fp, 
			# 		embedding_method,
			# 		tag_obtaining_method,
			# 		remove_stop_words,
			# 		do_stemming,
			# 		strigent_topic,
			# 		ngram,
			# 		multiple_paragraphs,
			# 		ngram_mixed,
			# 		ngram_literated,
			# 		pos,
			# 		semantic_analysis,
			# 		debug
			# 	)
			# 	try:
			# 		individual_file_preprocess_engine.bag_of_word_dict_transformer()
			# 	except Exception as e: 
			# 		logger.error(fp+"\n "+str(e))

		if not file_path:
			sample_file_path, sample_count = merge_datasets(TRAINING_INGREDIENT_PATH, 'txt')
			# merge datasets in middleware for referencing
			_, _ = merge_datasets(
				MIDDLE_INGREDIENT_PATH, 'txt', filename=sample_file_path)

			# merge datasets for word2vec
			_, _ = merge_datasets(
				WORD2VEC_INGREDIENT_PATH, 'data', filename=sample_file_path
			)
			preprocessing_end = datetime.datetime.strftime(
				datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")

			
			new_row_id = create_learning_entry(
				preprocessing_start,
				preprocessing_end,
				embedding_method,
				tag_obtaining_method,
				remove_stop_words,
				do_stemming,
				strigent_topic,
				','.join(ngram),
				ngram_mixed,
				ngram_literated,
				semantic_analysis,
				multiple_paragraphs,
				pos,
				sample_count,
				sample_file_path,
				exclude_file_names,
				input_file_format
			)
			# make a tmp file and store it
			tmpfile = open(
				os.path.join(
					os.getcwd(),
					'tmp.txt'
				), 
				'w'
			)
			tmpfile.write(str(new_row_id))
			tmpfile.close()
			print(
				"""New result entry ID is: \n %s \n 
				Please use it in training""" % (new_row_id)
			)

	elif action == 'train-test':
		print('param C is {}'.format(param_c))
		train_classifier = ModelClassSelector(
			).convert_string_to_classifier(model)
		train_classifier(
			training_id,
			topic,
			cv_fold_num,
			embedding_method,
			note,
			save_model,
			param_c,
			param_max_iter
		)
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
		"--exclude", 
		nargs='*',
		help="To be excluded file names", 
		dest="exclude_file_names",
		default=[]
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
		"--remove-stop-words", 
		help="Removing stop words or not", 
		dest="remove_stop_words",
		default='True',
		# type=bool
	)
	parser.add_argument(
		"--do-stemming", 
		help="Do stemming or not", 
		dest="do_stemming",
		default='True',
		# type=bool
	)
	parser.add_argument(
		"--strigent-topic", 
		help="Striggent topic search", 
		dest="strigent_topic",
		default='True',
		# type=bool
	)
	parser.add_argument(
		"--multiple-paragraphs", 
		help="Option to combine multiple paragraphs as one clause or not", 
		dest="multiple_paragraphs",
		default='False',
		# type=bool
	)
	# parser.add_argument(
	# 	"--ngram", 
	# 	help="N-gram text tokenization", 
	# 	dest="ngram",
	# 	default=1,
	# 	# type=bool
	# )
	parser.add_argument(
		"--ngram-mixed", 
		help="Allow different ngram mixued in dataset or not", 
		dest="ngram_mixed",
		default='True',
		# type=bool
	)
	parser.add_argument(
		"--ngram", 
		help="N-gram text tokenization", 
		dest="ngram",
		metavar='N', 
		nargs='+',
		default=['1']
		# type=bool
	)
	parser.add_argument(
		"--ngram-literate", 
		help="Apply filter to leave only literate ngrams", 
		dest="ngram_literated",
		default='False',
		# type=bool
	)
	parser.add_argument(
		"--pos-select",
		help="Part of speech trunk selection",
		dest="pos",
		metavar='N', 
		nargs='+',
		# default=None
	)
	parser.add_argument(
		"--semantic-analysis",
		help="To include semantic analysis or not in training input preparation",
		dest="semantic_analysis",
		default='False'
	)
	# parser.add_argument(
	# 	"--clear-batch",
	# 	help="Clear batch or not",
	# 	dest="clear_batch",
	# 	default=True,
	# 	type=bool
	# )
	parser.add_argument(
		"--merge-only",
		help="Opt to merge batch only",
		dest="merge_only",
		default='False'
	)
	parser.add_argument(
		"--training-id", 
		help="ID returned from preprocessing", 
		dest="training_id",
		type=int
	)
	parser.add_argument(
		"--topic", 
		help="Train to classify a specific topic", 
		dest="topic",
		type=str,
		default=None
	)
	parser.add_argument(
		"--model", 
		help="""Model to train classifier, available options including \n
			'naive_bayes': 'SimpleNaiveBayesClassifying',
			'multinomial_nb': 'MultinomialNBClassifying',
			'gaussian_nb': 'GuassianNBClassifying',
			'bernoulli_nb': 'BernoulliNBClassifying',
			'logistic_regression': 'LogisticClassifying',
			'sgdc': 'SGDCClassifying',
			'svc': 'SVCClassifying',
			'linear_svc': 'LinearSVCClassifying',
			'nu_svc': 'NuSVCClassifying',
			'xgboost': 'XGBoostClassifying',
			'gaussian_mixure': 'GaussianMixureClassifying',
			'word2vec_clustering': 'GoogleWord2VecTextClusterClassifying'
		""", 
		dest="model",
		default="naive_bayes"
	)
	parser.add_argument(
		"--note", 
		help="Add note for train test", 
		dest="note",
		type=str,
		default=None
	)
	parser.add_argument(
		"--cv-fold-number", 
		help="Cross validation fold number", 
		dest="cv_fold_num",
		default=5
	)
	parser.add_argument(
		"--C", 
		help="Regularization parameteres in SVM and logistic regression", 
		dest="param_c",
		default=1
	)
	parser.add_argument(
		"--max-iter", 
		help="Regularization parameteres in SVM and logistic regression", 
		dest="param_max_iter",
		default=1000
	)
	parser.add_argument(
		"--save-model", 
		help="Save model or not", 
		dest="save_model",
		default="False"
	)
	parser.add_argument(
		"--debug", 
		help="Activate debug mode", 
		dest="debug",
		default="False"
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
		"""
		Clear all past preprocess output for every single files before merging
		"""
		if args.merge_only == 'False' and args.file_path is None:
			import os
			dir_path = os.getcwd()
			os.system('rm {}/middleware_ingredients/Cont_*'.format(dir_path))
			os.system('rm {}/training_ingredients/Cont_*'.format(dir_path))
			# os.system('rm ~/sync/testfield/word2vec_ingredients/Cont_*')
	else:
		print("""
			The action is chosen to train and test classifying models \n
		""")

	if args.action == 'train-test':
		if args.training_id is None:
			raise Exception("""
				No training ID passed for learning \n
			""")
	main(
		args.action,
		args.file_path,
		args.exclude_file_names,
		args.input_file_format,
		args.embedding_method,
		args.tag_obtaining_method,
		args.remove_stop_words == 'True',
		args.do_stemming == 'True',
		args.strigent_topic == 'True',
		args.ngram,
		args.multiple_paragraphs == 'True',
		args.ngram_mixed == 'True',
		args.ngram_literated == 'True',
		args.semantic_analysis == 'True',
		args.merge_only == 'True',
		args.pos,
		args.training_id,
		args.topic,
		args.model,
		args.note,
		args.cv_fold_num,
		args.save_model == 'True',
		args.param_c,
		args.param_max_iter,
		args.debug == 'True'
	)