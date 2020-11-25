from nltk.classify.scikitlearn import SklearnClassifier
from contrai_cradle.abstracts.MLAbstract import MLAbstract

class GaussianMixureClassifying(MLAbstract):
    """
    Gaussian mixure
    """
    _model_type = "Gaussian Mixture"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(GaussianMixture())
        self._model.train(train_data)