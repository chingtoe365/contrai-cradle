"""
Stats kitchen
"""

__doc__ = """
	This is a kitchen place for statistics 
	and different measurement calculation
"""

__author__ = "Jintao"


import numpy as np

def PCA(mat: np.ndarray):
	"""
	mat looks like this:
	features as rows
	samples as columns
	"""
	# mean of each column
	M = np.mean(mat, axis=0)
	# normalize by centering each column
	# matrix too large that the operation need to be split
	# mat = mat - np.repeat(M, mat.shape[0], axis=0)
	for row in range(mat.shape[0]):
		mat[row, ] = mat[row, ] - M
	# calculate cvariance matrix
	V = cov(mat.T)
	# calculate eigenvectors
	values, vectors = eig(V)
	return values, vectors



def cov(X):
    # meanX = np.mean(X, axis = 0)
    lenX = X.shape[0]
    # X = X - meanX
    covariance = X.T.dot(X)/lenX
    return covariance

def eig(V):
	eigVals, eigVecs = np.linalg.eig(V)
	sorted_index = sorted(
		range(len(eigVals)), 
		key=lambda k: eigVals[k],
		reverse=True
	)
	eigVals = eigVals[sorted_index]
	eigVecs = eigVecs[:, sorted_index]
	return eigVals, eigVecs

def project_words_to_pcs(M, EV):
	return np.dot(M, EV)

def map_words_to_pcs(words_to_check, words_in_dict, M, EV):
	indexes = []
	output_word_order = []
	for word in words_to_check:
		search_result = np.argwhere(np.array(words_in_dict) == word)
		if search_result.shape[0] > 0:
			indexes.append(search_result[0][0])
			output_word_order.append(word)
	M = M[indexes, :]
	return output_word_order, np.dot(M, EV)

if __name__ == '__main__':
	print("hello")

