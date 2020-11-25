from nltk.classify.scikitlearn import SklearnClassifier
from contrai_cradle.abstracts.MLAbstract import MLAbstract

class SGDCClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "SGDC"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(SGDClassifier())
        self._model.train(train_data)
        return self._model