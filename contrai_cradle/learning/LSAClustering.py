import gensim
import os
import matplotlib.pyplot as plt

from contrai_cradle.impl.unsupervised_learning_impl import UnsupervisedLearningImpl

class LSAClustering(UnsupervisedLearningImpl):
    model = 'LSA_Clustering'
    num_topics = NUM_TOPICS
    result_folder = '../results/lsa_clustering'

    def __init__(self, preprocessing_id, topic, k):
        super().__init__(preprocessing_id, topic, k)
        # self._preprocessing_id = preprocessing_id
        # self._topic = topic
        self._observation = self._load_data()
        # self._k = k
        self.train()
        self.performance()


    def train(self):
        """
        Input  : clean document, number of topics and number of words associated with each topic
        Purpose: create LSA model using gensim
        Output : return LSA model
        """
        bow_corpus, id2word, raw_corpus, \
            raw_corpus_single_gram, tfidf_corpus = self._bow_formatter()
        self.corpus = raw_corpus_single_gram
        self.dictionary = id2word
        # self.training_corpus = bow_corpus if self.
        if TRAINING_INPUT_TYPE == 'tfidf':
            self.training_corpus = tfidf_corpus
        elif TRAINING_INPUT_TYPE == 'bow':
            self.training_corpus = bow_corpus
        else:
            self.training_corpus = bow_corpus
        # generate LSA model
        self.model = gensim.models.LsiModel(
            self.training_corpus, num_topics=self.num_topics, id2word=id2word
        )  # train model
        # print(self.model.print_topics(num_topics=self.num_topics, num_words=10))
        # return lsamodel

    def performance(self):
        csv_file_name = 'topic_'+TRAINING_INPUT_TYPE+'.csv'
        csv_file_path = os.path.join(
            os.getcwd(),
            self.result_folder,
            csv_file_name
        )
        print(
            self.model.show_topics(
                num_topics=self.num_topics,
                num_words=20
            )
        )
        self.df_topic_sents_keywords = self.format_topics_sentences()
        # Format
        df_dominant_topic = self.df_topic_sents_keywords.reset_index()
        df_dominant_topic.columns = ['Document_No', 'Dominant_Topic', 'Topic_Perc_Contrib', 'Keywords', 'Text']
        df_dominant_topic.to_csv(csv_file_path)
        print(
            df_dominant_topic.head(10)
        )
        self.coherence_measure()
        # self.document_word_count()
        # self.topic_word_count()
        # self.word_cloud()


    def coherence_measure(self):
        """
            Input   : dictionary : Gensim dictionary
                corpus : Gensim corpus
                texts : List of input texts
                stop : Max num of topics
            purpose : Compute c_v coherence for various number of topics
            Output  : model_list : List of LSA topic models
                coherence_values : Coherence values corresponding to the LDA model with respective number of topics
        """
        start, stop, step = 2,61,1
        coherence_values = []
        model_list = []
        for num_topics in range(start, stop, step):
            # generate LSA model
            model = gensim.models.LsiModel(
                self.training_corpus,
                num_topics=num_topics,
                id2word = self.dictionary
            )  # train model
            model_list.append(model)
            coherencemodel = gensim.models.CoherenceModel(
                model=model, corpus=self.training_corpus,
                dictionary=self.dictionary, coherence='u_mass'
            )
            coherence_values.append(coherencemodel.get_coherence())

        # dictionary,doc_term_matrix=prepare_corpus(doc_clean)
        # model_list, coherence_values = compute_coherence_values(dictionary, doc_term_matrix,doc_clean,
                # stop, start, step)
        # Show graph
        x = range(start, stop, step)
        plt.plot(x, coherence_values)
        plt.xlabel("Number of Topics")
        plt.ylabel("Coherence score")
        plt.legend(("coherence_values"), loc='best')
        # plt.show()
        image_name = 'coherence_'+TRAINING_INPUT_TYPE+'.jpeg'
        image_file_path = os.path.join(
            os.getcwd(),
            self.result_folder,
            image_name
        )
        f = open(image_file_path, 'wb')
        plt.savefig(
            image_file_path
        )
        # return model_list, coherence_values
