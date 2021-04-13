from nltk.classify.scikitlearn import SklearnClassifier
from sklearn.naive_bayes import GaussianNB
from contrai_cradle.abstracts.MLAbstract import MLAbstract

class GuassianNBClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "Guassian NB"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        self._model  = SklearnClassifier(GaussianNB())
        self._model.train(train_data)
        return self._model