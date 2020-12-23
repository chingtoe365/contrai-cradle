from nltk import NaiveBayesClassifier
from contrai_cradle.abstracts.MLAbstract import MLAbstract

class SimpleNaiveBayesClassifying(MLAbstract):
    """
    Simple Naive Bayes classifier trained with
    occurence data of words, and empirical estimates of
    prior and posterior.

    Must define:
    self._model
    """
    _model_type = "Simple Naive Bayes"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model = NaiveBayesClassifier.train(train_data)
        return self._model
        # filename = 'finalized_model.sav'
        # pickle.dump(self._model, open(filename, 'wb'))