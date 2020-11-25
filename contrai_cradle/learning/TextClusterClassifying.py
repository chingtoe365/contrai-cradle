import gensim
import os
import numpy as np

from contrai_cradle.abstracts.abstractions import JLLearnModelAbstract


class TextClusterClassifying(JLLearnModelAbstract):
    def __init__(self):
        self._word2vec_model = gensim.models.Word2Vec.load(
            os.path.join(
                os.getcwd(),
                'models/word2vec/legal_w2v.model'
            )
        ).wv
        self._vector_size = self._word2vec_model.vector_size

    def _get_clause_vector(self, bag_of_words, vector_size):
        wc = 0
        clause_vector = np.zeros(vector_size)
        for word in bag_of_words:
            try:
                occurence = bag_of_words[word]
            except Exception as e:
                continue
            try:
                word_vec = self._word2vec_model.get_vector(word)
            except KeyError as ke:
                logger.error(ke)
                continue
            clause_vector += word_vec * occurence
            wc += occurence
        if np.all(clause_vector == 0):
            # if all vocabularies in this text are out-of-book
            # then assign a extremely small number as baseline
            # to avoid error
            clause_vector += 1e-80
            wc = 1
        return clause_vector / wc

    def _get_topic_largest_cosine_similarity(self, clause_vector):
        best_sim = 0
        best_guess = 41
        for topic in self.topic_baseline_vectors:
            cos_sim = self._word2vec_model.cosine_similarities(
                clause_vector,
                np.array([self.topic_baseline_vectors[topic], ])
            )
            if abs(cos_sim) > best_sim:
                best_sim = cos_sim
                best_guess = topic

        return int(best_guess)

    def train(self, traindata):
        """
        Given train data looking like this:

        [
        [
            {
                'I' : 1,
                'should': 2,
                'be': 1,
                'a': 1,
                'billionaire': 2
            }
            'force majeure',
            19
        ],
        [
            {
                'we': 1,
                'are': 2,
                'happy': 1
            },
            'anti-bribery',
            47
        ],
        ]

        - baseline vector should be measured for each topic
        """
        # Initializing topic vectors
        self.topic_baseline_vectors = {}
        self.train_topic_count = {}
        for clause in traindata:
            topic = str(clause[1])
            if topic not in self.topic_baseline_vectors:
                self.topic_baseline_vectors[topic] = np.zeros(
                    self._vector_size)
                self.train_topic_count[topic] = 0
            self.train_topic_count[topic] += 1
            clause_vector = self._get_clause_vector(
                clause[0], self._vector_size)
            self.topic_baseline_vectors[topic] += clause_vector
        # averaging all topic_baseline_vectors
        for top in self.topic_baseline_vectors:
            self.topic_baseline_vectors[top] = \
                self.topic_baseline_vectors[top] / self.train_topic_count[top]

    def classify(self, data):
        clause_vector = self._get_clause_vector(
            data, self._vector_size)
        return self._get_topic_largest_cosine_similarity(
            clause_vector
        )

