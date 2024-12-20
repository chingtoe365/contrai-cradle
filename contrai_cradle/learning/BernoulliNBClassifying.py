from nltk.classify.scikitlearn import SklearnClassifier
from sklearn.naive_bayes import BernoulliNB
from contrai_cradle.abstracts.MLAbstract import MLAbstract

class BernoulliNBClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "Bernoulli NB"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(BernoulliNB())
        self._model.train(train_data)
        return self._model