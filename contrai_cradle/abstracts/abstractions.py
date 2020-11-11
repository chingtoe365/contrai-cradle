__author__ = 'Jintao'
__doc__ = """
	All abstracts goes into here
"""
import abc
from contrai_cradle.abstracts.meta.LearningMeta import LearningModelMeta

class JLLearnModelAbstract():
	def __init__(self):
		pass

	@abc.abstractmethod
	def classify(self):
		pass

	@abc.abstractmethod
	def train(self):
		pass

class  JLUnsupervisedLearningAbstract(LearningModelMeta):

    @abc.abstractmethod
    def train(self):
        pass

    @abc.abstractmethod
    def performance(self):
        pass

    @abc.abstractmethod
    def _load_data(self):
        pass

    @abc.abstractmethod    
    def _save_model(self):
        pass