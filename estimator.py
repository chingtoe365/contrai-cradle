# This is the estimator functions
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
	Estimator functions gallery for priors, posteriors 
	used in Naive Bayes process 
"""

from nltk.probability import ProbDistI

class ChineseRoomEstimator(ProbDistI):
	"""
	The Chinese room estimator
	"""
	def __init__(self, freqdist):
		"""
        Use the Lidstone estimate to create a probability distribution
        for the experiment used to generate ``freqdist``.
        
        :type freqdist: FreqDist
        :param freqdist: The frequency distribution that the
            probability estimates should be based on.
		"""
		self._freqdist = freqdist

	def prob(self, sample):        
		"""
        Return the probability for a given sample.  Probabilities
        are always real numbers in the range [0, 1].
        :param sample: The sample whose probability
               should be returned.
        :type sample: any
        :rtype: float
        """
		pass

    def max(self):
        """
        Return the sample with the greatest probability.  If two or
        more samples have the same probability, return one of them;
        which sample is returned is undefined.
        :rtype: any
        """
    	pass

    def samples(self):
        """
        Return a list of all samples that have nonzero probabilities.
        Use ``prob`` to find the probability of each sample.
        :rtype: list
        """
        pass

    def __repr__(self):
        """
        Return a string representation of this ``TestEstimator``.
        :rtype: str
        """
        # return "<TestEstimator based on %d samples>" % self._freqdist.N()
        pass

	def _freqdist_transformer():
		"""
		Transform observed frequency distribution that passed from sample
		to probability distribution from which probabilities of variables 
		are estimated.
		"""
		pass


class GaussianMixureEstimator(ProbDistI):
	"""
	EM with Gaussian Mixure 
	"""
	def __init__(self, freqdist):
		"""
        Use the Lidstone estimate to create a probability distribution
        for the experiment used to generate ``freqdist``.
        
        :type freqdist: FreqDist
        :param freqdist: The frequency distribution that the
            probability estimates should be based on.
		"""
		self._freqdist = freqdist

	def prob(self, sample):        
		"""
        Return the probability for a given sample.  Probabilities
        are always real numbers in the range [0, 1].
        :param sample: The sample whose probability
               should be returned.
        :type sample: any
        :rtype: float
        """
		pass

    def max(self):
        """
        Return the sample with the greatest probability.  If two or
        more samples have the same probability, return one of them;
        which sample is returned is undefined.
        :rtype: any
        """
    	pass

    def samples(self):
        """
        Return a list of all samples that have nonzero probabilities.
        Use ``prob`` to find the probability of each sample.
        :rtype: list
        """
        pass

    def __repr__(self):
        """
        Return a string representation of this ``TestEstimator``.
        :rtype: str
        """
        # return "<TestEstimator based on %d samples>" % self._freqdist.N()
        pass

	def _freqdist_transformer():
		"""
		Transform observed frequency distribution that passed from sample
		to probability distribution from which probabilities of variables 
		are estimated.
		"""
		pass
