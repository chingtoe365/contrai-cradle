from nltk.classify.scikitlearn import SklearnClassifier
from sklearn.linear_model import LogisticRegression
from contrai_cradle.abstracts.MLAbstract import MLAbstract

class LogisticClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "Logistic Regression"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(LogisticRegression(
            C=self._param_c,
            max_iter=self._param_max_iter
        ))
        self._model.train(train_data)
        return self._model