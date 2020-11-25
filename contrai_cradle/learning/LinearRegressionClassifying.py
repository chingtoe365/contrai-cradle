from nltk.classify.scikitlearn import SklearnClassifier
from contrai_cradle.learning import MLAbstract

class LinearRegressionClassifying(MLAbstract):
    """
    Linear regression
    """
    _model_type = "Linear Regression"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(LogisticRegression())
        self._model.train(train_data)
        return self._model