# Event Logging 
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	Loggers for errors
"""

import logging
LOGGING_FILE_NAME = "error.log"
FORMAT = '%(asctime)-15s %(message)s'
logger = logging.getLogger()
logging.basicConfig(
	filename=LOGGING_FILE_NAME,
	format=FORMAT
)

# class EventLogger(logging.getLoggerClass()):
# 	def __init__(self):
# 		self._logger = logging.getLogger()
# 		self._logger.basicConfig(
# 			filename=LOGGING_FILE_NAME
# 		)
