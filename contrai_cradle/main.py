# test script
# author: Jintao

"""
The function of this script include:
1. import sub-folder packages here just so when they are 
run separately the __name__ and __package__ information
are set and known
2. 
"""

import nltk
import google_word2vec.text_similarity_measure_lab
import tagging
print('__file__={0:<35} | __name__={1:<20} | __package__={2:<20}'.format(__file__,__name__,str(__package__)))

if __name__ == '__main__':
	print("I am back Python")
	sentence = """At eight o'clock on Thursday morning
... Arthur didn't feel very good."""