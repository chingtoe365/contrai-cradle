from nltk.classify.scikitlearn import SklearnClassifier
from sklearn.svm import NuSVC
from contrai_cradle.abstracts.MLAbstract import MLAbstract

class NuSVCClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "Nu SVC"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model = SklearnClassifier(NuSVC())
        self._model.train(train_data)
        return self._model