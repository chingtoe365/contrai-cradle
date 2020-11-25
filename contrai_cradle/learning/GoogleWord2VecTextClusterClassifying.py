from contrai_cradle.learning import TextClusterClassifying
from contrai_cradle.learning import MLAbstract

class GoogleWord2VecTextClusterClassifying(MLAbstract):
    """
    Classify clauses with topics by proposed clustering/voting method
    Google pretrained model provide vectors embedding for each single word

    Train:
    - Get baseline vectors for each topic by averaging clauses

    Predict:
    - Reprepsent each text string(topic & clauses) by a combined vector,
    which is an average of all the word vector
    - Measure cosine similarity of each text vectors
    - Assign topic to clause to be predicted
    with absolute highest cosine similarity
    """
    _model_type = "Google W2V Clustering"
    _parameters = ""
    _parametric = False

    def _train(self, train_data):
        """
        Not using SKlearnClassifier interface in this model

        model need to only have:
        - model.classify(list_of_words_of_a_clause: List[str]) -> topic_label

        """
        self._model = TextClusterClassifying()
        self._model.train(train_data)
        # estimator = []
        # self._model = SklearnClassifier(estimator())
        # self._model.train(self.)


