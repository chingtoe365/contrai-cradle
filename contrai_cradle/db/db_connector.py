# DB connector
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	A DB connector to PostgreSQL 
	that store testing results and evaluations 
	of different trials of contract topic classification models
"""

import psycopg2
from contrai_cradle.db.config import *

from typing import Dict
# from ..learning import MLAbstract

class DBConnector():
	"""
	DB connector class
	"""
	def __init__(self):
		self._connection_string = """host=%s port=%s 
			dbname=%s user=%s password=%s""" % (
				PGHOST,
				PGPORT,
				PGDATABASE,
				PGUSER,
				PGPASSWORD
			)
		try:
			conn = psycopg2.connect(self._connection_string)
		except IOError as e:
			raise Exception("Failed to connect to DB"+e)
		finally:
			print("Connected to PostgreSQL!")
			self._conn = conn
			self._cursor = conn.cursor()

	# def insert(self, input: MLAbstract):
	# 	"""
	# 	insert data
	# 	"""
	# 	command = """
	# 		INSERT INTO %s
	# 		(model_type, parameters, stop_word_removed, 
	# 		stemming, k, train_sample_size, test_sample_size, 
	# 		precision, recall, f_measure, parametric, 
	# 		preprocessing_start, preprocessing_end, 
	# 		training_start, training_end, 
	# 		testing_start, testing_end, vis_path)
	# 		VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);
	# 	""" % (
	# 		PGTABLE,
	# 		input._model_type, input._parameters, input._remove_stop_word,
	# 		input._do_stemming, input.k, input._train_data_num,
	# 		input._test_data_num, input.precision, input.recall,
	# 		input.f_measure, input.accuracy, input._parametric, 
	# 		input._preprocessing_start, input._preprocessing_end, 
	# 		input._training_start, input._training_end, 
	# 		input._testing_start, input._testing_end, input.vis_path
	# 	)
	# 	try:
	# 		self._cursor.execute(command)
	# 	except Exception as e:
	# 		raise("Error writing into table %s" % (PGTABLE))

	def insert(self, table_name, **kwargs):
		"""
		each key in kwargs should be correspond to each columns
		in table 'results' in database 'evaluation'
		"""
		field_string = ','.join(kwargs.keys())
		value_string = ','.join(
			["'"+str(x)+"'" for x in kwargs.values()]
		)
		command = """
			INSERT INTO %s
			(%s)
			VALUES (%s)
			RETURNING id;
		""" % (
			table_name,
			field_string,
			value_string
		)
		try:
			self._cursor.execute(command)
			_id = self._cursor.fetchone()[0]
		except Exception as e:
			raise Exception(
				"Error writing into table `%s`" % (table_name),
				e,
				"Value string: %s" % (value_string)
			)

		self._conn.commit()

		return _id

	def update(self, table_name, ID, **kwargs):
		"""
		each key in kwargs should be correspond to each columns
		in table 'results' in database 'evaluation'
		"""
		# field_string = ','.join(kwargs.keys())
		# value_string = ','.join(
		# 	["'"+str(x)+"'" for x in kwargs.values()]
		# )s
		value_string = ','.join(
			[str(y[0])+"='"+str(y[1])+"'" for y in kwargs.items()]
		)
		command = """
			UPDATE %s SET %s WHERE id=%s
		""" % (
			table_name,
			value_string,
			ID
		)
		try:
			self._cursor.execute(command)
		except Exception as e:
			raise Exception(
				"Error writing into table `%s`" % (table_name),
				e,
				"Value string: %s" % (value_string)
			)

		self._conn.commit()

	def get_sample_filename_by_id(self, sample_id) -> str:
		"""
		get sample file name by id
		"""
		filename = ''
		command = "SELECT sample_file_path FROM %s WHERE id=%s" % (
			PPC_TABLE,
			sample_id
		)
		try:
			self._cursor.execute(command)
		except Exception as e:
			raise Exception(
				"Error reading from table `results`",
				e
			)

		return self._cursor.fetchall()
		

CONN = DBConnector()

if __name__ == '__main__':
	# kwargs = {'comment': "alright"}
	db = DBConnector()
	print(db.insert(table_name='test', comment='alright'))