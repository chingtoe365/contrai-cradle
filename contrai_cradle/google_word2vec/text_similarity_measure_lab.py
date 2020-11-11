""" 
Topic mapping lab with Google trained word2vec model

Goal: measure the similarities between different text strings
Instead of single words

Idea:
Loop through all detected topics:
	Loop through all available topics:
		1. get vectors for every single word 
			for each of the 2 text strings
		2. average/xor/integrate(somehow) vectors 
			for each of the 2 text string
		3. calculate the cosine similarity 
			between 2 processed vecs
	Pick topic with biggest cosine similarity as answer 
		for this detected topic

# Author: Jintao Long <jintaolong@brookes.ac.uk>
# 
"""

__doc__ = """
	Topic mapping lab with Google trained word2vec model
"""
print(
		'__file__={0:<35} | __name__={1:<20} | __package__={2:<20}'.format(
		__file__,__name__,str(__package__)
	)
)
import gensim
import json
import nltk
import numpy as np

from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

from tagging import LABEL_VALUE_MAP

ALL_DETECTED_TOPICS_SOURCE_FILE = "/home/vagrant/sync/testfield/middleware_ingredients/20200306124345.txt"
GOOG_WVMODEL = gensim.models.KeyedVectors.load_word2vec_format(
	'/home/vagrant/sync/testfield/google_word2vec/GoogleNews-vectors-negative300.bin.gz', 
	binary=True
)
OUTPUT_CSV = "/home/vagrant/sync/testfield/topic_map_all.csv"

def extract_all_detected_topics():
	detected_topics = []
	# TODO: objectize json file read and write
	json_string = open(
		ALL_DETECTED_TOPICS_SOURCE_FILE, 'r').read()
	data = json.loads(json_string)
	for entry in data:
		detected_topics.append(entry[2])
	return detected_topics

def average_word_vectors_for_strings(text: str) -> np.ndarray:
	sum_vec = np.zeros(300)
	words = nltk.word_tokenize(text)
	wc = 0
	for word in words:
		try:
			sum_vec += GOOG_WVMODEL.get_vector(word)
		except Exception as e:
			# if word not found in vocabulary
			pass
		wc += 1
	if np.all(sum_vec == 0):
		# if all vocabularies in this text are out-of-book
		# then assign a extremely small number as baseline
		# to avoid error
		sum_vec += 1e-80
	return sum_vec / wc

def write_to_csv(topic_map: list):
	f = open(OUTPUT_CSV, 'w')
	f.write('Detected,Matched\n')
	for topic in topic_map:
		f.write('%s,%s\n' % (topic[0], topic[1]))
	f.close()


def get_principal_components_of_vector(
		vectors: np.array, n: int):
	vectors = StandardScaler().fit_transform(vectors)
	pca = PCA(n_components=n)
	principal_components = pca.fit_transform(vectors)
	# principalDf = pd.DataFrame(
	# 	data=principal_components,
	# 	columns = [
	# 		'principal component 1', 
	# 		'principal component 2'
	# 	]
	# )


if __name__ == '__main__':
	predefined_topic_vector_matrix = np.array([[]])
	predefined_topic_vector_matrix.shape = (0, 300)
	output_list = []
	for topic in LABEL_VALUE_MAP:
		predefined_topic_vector_matrix = np.append(
			predefined_topic_vector_matrix, 
			[average_word_vectors_for_strings(topic)],
			axis=0
		)
	# detected_topics = ['the client obligations',]
	for det_tps in extract_all_detected_topics():
	# for det_tps in detected_topics:
		# Must ignore nan topics caused by out-of-book
		# vocabularies and their cosine sim will always 
		# be inf because denominator = 0
		best_guess_index = np.nanargmax(
			np.abs(
				GOOG_WVMODEL.cosine_similarities(
					average_word_vectors_for_strings(det_tps),
					predefined_topic_vector_matrix
				)
			)
		)
		best_guess = list(LABEL_VALUE_MAP.keys())[best_guess_index]
		# print("The best guess of %s is \n%s") % (
		# 	det_tps, best_guess)
		output_list.append([det_tps, best_guess])

	import pdb; pdb.set_trace()  # breakpoint f3823194 //
	write_to_csv(output_list)

