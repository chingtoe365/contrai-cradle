from nltk.classify.scikitlearn import SklearnClassifier
from contrai_cradle.learning import MLAbstract

class SVCClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "SVC"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(SVC())
        self._model.train(train_data)
        return self._model