# New Naive Bayes class with more flexibility
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	A more flexible Naive Bayes classifier 
	derived from nltk.NaiveBayesClassifier 

	Additional arguments to adjust the estimator
	that isolate label estimator from likelihood estimator
	because those used to be set to be the same
"""

from nltk.probability import ELEProbDist
import nltk.NaiveBayesClassifier as NaiveBayesClassifier

class NaiveBayesFlexibileClassifier(NaiveBayesClassifier):
	@classmethod
    def train(
    		cls, 
    		labeled_featuresets, 
    		label_estimator=ELEProbDist, 
	    	likelihood_estimator=ELEProbDist
    	):
    	"""
    	Overriding NaiveBayesClassifier's `train` function 
    	and put more flexibility by separating estimators for 
    	P(label) distribution and P(fval|label, fname) distribution
    	"""
        label_freqdist = FreqDist()
        feature_freqdist = defaultdict(FreqDist)
        feature_values = defaultdict(set)
        fnames = set()

        # Count up how many times each feature value occurred, given
        # the label and featurename.
        for featureset, label in labeled_featuresets:
            label_freqdist[label] += 1
            for fname, fval in featureset.items():
                # Increment freq(fval|label, fname)
                feature_freqdist[label, fname][fval] += 1
                # Record that fname can take the value fval.
                feature_values[fname].add(fval)
                # Keep a list of all feature names.
                fnames.add(fname)

        # If a feature didn't have a value given for an instance, then
        # we assume that it gets the implicit value 'None.'  This loop
        # counts up the number of 'missing' feature values for each
        # (label,fname) pair, and increments the count of the fval
        # 'None' by that amount.
        for label in label_freqdist:
            num_samples = label_freqdist[label]
            for fname in fnames:
                count = feature_freqdist[label, fname].N()
                # Only add a None key when necessary, i.e. if there are
                # any samples with feature 'fname' missing.
                if num_samples - count > 0:
                    feature_freqdist[label, fname][None] += num_samples - count
                    feature_values[fname].add(None)

        # Create the P(label) distribution
        label_probdist = label_estimator(label_freqdist)

        # Create the P(fval|label, fname) distribution
        feature_probdist = {}
        for ((label, fname), freqdist) in feature_freqdist.items():
            probdist = likelihood_estimator(freqdist, bins=len(feature_values[fname]))
            feature_probdist[label, fname] = probdist

        return cls(label_probdist, feature_probdist)