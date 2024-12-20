from contrai_cradle.abstracts.MLAbstract import MLAbstract

from .BernoulliNBClassifying import BernoulliNBClassifying
from .GaussianMixureClassifying import GaussianMixureClassifying
from .GoogleWord2VecTextClusterClassifying import GoogleWord2VecTextClusterClassifying
from .GuassianNBClassifying import GuassianNBClassifying
from .LDAClustering import LDAClustering
from .LinearRegressionClassifying import LinearRegressionClassifying
from .LinearSVCClassifying import LinearSVCClassifying
from .LogisticClassifying import LogisticClassifying
from .LSAClustering import LSAClustering
from .LSTMClassifying import LSTMClassifying
from .MultinomialNBClassifying import MultinomialNBClassifying
from .NuSVCClassifying import NuSVCClassifying
from .SGDCClassifying import SGDCClassifying
from .SimpleNaiveBayesClassifying import SimpleNaiveBayesClassifying
from .SVCClassifying import SVCClassifying
from .TextClusterClassifying import TextClusterClassifying
from .XGBoostClassifying import XGBoostClassifying
from .BertClassifying import BertClassifying

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
    'distilbert_seq_classify': 'DistilBertClassifying',
    'bert_seq_classify': 'BertClassifying',
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