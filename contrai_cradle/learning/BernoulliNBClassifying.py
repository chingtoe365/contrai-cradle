from nltk.classify.scikitlearn import SklearnClassifier
from contrai_cradle.learning import MLAbstract

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