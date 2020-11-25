from contrai_cradle.abstracts.MLAbstract import MLAbstract


ML_MODLE_MAP = {
    'linear_regression': 'LinearRegressionClassifying',
    'naive_bayes': 'SimpleNaiveBayesClassifying',
    'multinomial_nb': 'MultinomialNBClassifying',
    'gaussian_nb': 'GuassianNBClassifying',
    'bernoulli_nb': 'BernoulliNBClassifying',
    'logistic_regression': 'LogisticClassifying',
    'sgdc': 'SGDCClassifying',
    'svc': 'SVCClassifying',
    'linear_svc': 'LinearSVCClassifying',
    'nu_svc': 'NuSVCClassifying',
    'xgboost': 'XGBoostClassifying',
    'lstm': 'LSTMClassifying',
    'gaussian_mixure': 'GaussianMixureClassifying',
    'word2vec_clustering': 'GoogleWord2VecTextClusterClassifying',
    'lda_clustering': 'LDAClustering',
    'lsa_clustering': 'LSAClustering'
}


class ModelClassSelector():
    def __init__(self):
        pass

    @classmethod
    def convert_string_to_classifier(
            self, model_name: str) -> MLAbstract:
        return eval(ML_MODLE_MAP[model_name])