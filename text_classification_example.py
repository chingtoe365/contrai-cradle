import nltk
import random
from nltk.corpus import movie_reviews
from nltk.classify.scikitlearn import SklearnClassifier
import pickle
from sklearn.naive_bayes import MultinomialNB, GaussianNB, BernoulliNB

from sklearn.linear_model import LogisticRegression, SGDClassifier
from sklearn.svm import SVC, LinearSVC, NuSVC
from sklearn.mixture import GaussianMixture

from crp_generator import crpgen

documents = [(list(movie_reviews.words(fileid)), category) 
			for category in movie_reviews.categories() 
			for fileid in movie_reviews.fileids(category)]

random.shuffle(documents)

all_words = []
for w in movie_reviews.words():
	all_words.append(w.lower())

all_words = nltk.FreqDist(all_words)
print(all_words.most_common(15))
word_features = list(all_words.keys())[:3000]

def find_features(document):
	words = set(document)
	features = {}
	for w in word_features:
		features[w] = (w in words) 

	return features

print(find_features(movie_reviews.words('neg/cv000_29416.txt')))

featuresets = [(find_features(rev), category) for (rev, category) in documents]

training_set = featuresets[:1900]
testing_set = featuresets[1900:]


"""
The `expected likelihood estimate` approximates the probability of a sample with count c from an experiment with N outcomes and B bins as (c+0.5)/(N+B/2). 

source: https://www.nltk.org/api/nltk.html#nltk.probability.ELEProbDist
"""

# NB_classifer = nltk.NaiveBayesClassifier.train(training_set)
# NB_classifer.train(training_set)
# print("Classic Naive Bayes accuracy precent:", (nltk.classify.accuracy(NB_classifer, testing_set))*100)

"""
New implementation
"""

# from nbflex import NaiveBayesFlexibileClassifier
# from estimator import label_xxx, likelihood_xxx

# classifer = nltk.NaiveBayesClassifier.train(
# 	training_set, 
# 	label_xxx, 
# 	likelihood_xxx
# )

# print("Naive Bayes Algo accuracy precent:", (nltk.classify.accuracy(classifier, testing_set))*100)
# classifier.show_most_informative_features(15)

# MNB_classifier = SklearnClassifier(MultinomialNB())
# MNB_classifier.train(training_set)
# print("Multinomial Naive Bayes accuracy precent:", (nltk.classify.accuracy(MNB_classifier, testing_set))*100)
#
# # GNB_classifier = SklearnClassifier(GaussianNB())
# # GNB_classifier.train(training_set)
# # print("Naive Bayes Algo accuracy precent:", (nltk.classify.accuracy(GNB_classifier, testing_set))*100)
#
# BNB_classifier = SklearnClassifier(BernoulliNB())
# BNB_classifier.train(training_set)
# print("Bernoulli Naive Bayes accuracy precent:", (nltk.classify.accuracy(BNB_classifier, testing_set))*100)
#
# LR_classifier = SklearnClassifier(LogisticRegression())
# LR_classifier.train(training_set)
# print("Logistic accuracy precent:", (nltk.classify.accuracy(LR_classifier, testing_set))*100)
#
# SGDClassifier = SklearnClassifier(SGDClassifier())
# SGDClassifier.train(training_set)
# print("SGDClassifier accuracy precent:", (nltk.classify.accuracy(SGDClassifier, testing_set))*100)
#
# SVC_classifier = SklearnClassifier(SVC())
# SVC_classifier.train(training_set)
# print("SVC_classifier accuracy precent:", (nltk.classify.accuracy(SVC_classifier, testing_set))*100)
#
# LinearSVC_classifier = SklearnClassifier(LinearSVC())
# LinearSVC_classifier.train(training_set)
# print("LinearSVC_classifier accuracy precent:", (nltk.classify.accuracy(LinearSVC_classifier, testing_set))*100)
#
# NuSVC_classifier = SklearnClassifier(NuSVC())
# NuSVC_classifier.train(training_set)
# print("NuSVC_classifier accuracy precent:", (nltk.classify.accuracy(NuSVC_classifier, testing_set))*100)


# Gaussian Mixure Model
GaussianMM_classifier = SklearnClassifier(GaussianMixture())
GaussianMM_classifier.train(training_set)
print("GaussianMixure_classifier accuracy percent:", (nltk.classify.accuracy(GaussianMM_classifier, testing_set))*100)

# Chinese room process 
crpgen(N=2, alpha=1.0)