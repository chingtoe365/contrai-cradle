# String cleaning/processing utils
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	String cleaning/processing utils
	- chunk white space
	- remove dots at tails
"""

def clean_string(text):
	return text.replace('.', '').replace(' ', '')