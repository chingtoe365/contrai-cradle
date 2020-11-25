from nltk.classify.scikitlearn import SklearnClassifier
from contrai_cradle.learning import MLAbstract

class LinearSVCClassifying(MLAbstract):
    """
    Naive Bayes with multinomial estimator
    """
    _model_type = "Linear SVC"
    _parameters = ""
    _parametric = False

    # def __init__(self, preprocessing_id,
    #     topic, k, embedding_method,
    #     note, save_model, param_c):
    #     print('param c is {}'.format(param_c))
    #     super().__init__(
    #         preprocessing_id, topic, k, embedding_method,
    #         note, save_model, param_c
    #     )

    def _train(self, train_data):
        # print('Actual C is {}'.format(self._param_c))
        self._model = SklearnClassifier(LinearSVC(
            C=self._param_c,
            max_iter=self._param_max_iter
        ))
        self._model.train(train_data)
        return self._model