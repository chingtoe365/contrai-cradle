import os
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
import numpy as np
import seaborn as sns
from wordcloud import WordCloud, STOPWORDS


from contrai_cradle.adjusted_model_lib.ldamulticore import LdaMulticore
from contrai_cradle.impl.unsupervised_learning_impl import UnsupervisedLearningImpl

class LDAClustering(UnsupervisedLearningImpl):
    model = 'LDA_Clustering'
    num_topics = NUM_TOPICS
    images_folder = '../results/lda_clustering'
    def __init__(self, preprocessing_id, topic, k):
        super().__init__(preprocessing_id, topic, k)
        # self._preprocessing_id = preprocessing_id
        # self._topic = topic
        self._observation = self._load_data()
        # self._k = k
        self.train()
        self.performance()

    def train(self):
        bow_corpus, id2word, raw_corpus, \
        raw_corpus_single_gram, tfidf_corpus = self._bow_formatter()
        self.corpus = raw_corpus_single_gram
        # self.training_corpus = bow_corpus if self.
        if TRAINING_INPUT_TYPE == 'tfidf':
            self.training_corpus = tfidf_corpus
        elif TRAINING_INPUT_TYPE == 'bow':
            self.training_corpus = bow_corpus
        else:
            self.training_corpus = bow_corpus
        self.model = LdaMulticore(
            corpus=self.training_corpus,
            num_topics=NUM_TOPICS,
            id2word=id2word,
            passes=2,
            workers=2
        )

    def performance(self):
        csv_file_name = 'dominant_topic_ ' +TRAINING_INPUT_TYP E +'.csv'
        csv_file_path = os.path.join(
            os.getcwd(),
            self.images_folder,
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
        self.document_word_count()
        self.topic_word_count()
        self.word_cloud()

    def document_word_count(self):
        image_name = 'word_count_ ' +TRAINING_INPUT_TYP E +'.jpeg'
        image_file_path = os.path.join(
            os.getcwd(),
            self.images_folder,
            image_name
        )
        self.df_dominant_topic = self.df_topic_sents_keywords.reset_index()
        self.df_dominant_topic.columns = ['Document_No', 'Dominant_Topic', 'Topic_Perc_Contrib', 'Keywords', 'Text']
        self.df_dominant_topic.head(10)
        doc_lens = [len(d) for d in self.df_dominant_topic.Text]
        # Plot
        plt.figure(figsize=(16 ,7), dpi=160)
        plt.hist(doc_lens, bins = 1000, color='navy')
        plt.text(750, 100, "Mean   : " + str(round(np.mean(doc_lens))))
        plt.text(750,  90, "Median : " + str(round(np.median(doc_lens))))
        plt.text(750,  80, "Stdev   : " + str(round(np.std(doc_lens))))
        plt.text(750,  70, "1%ile    : " + str(round(np.quantile(doc_lens, q=0.01))))
        plt.text(750,  60, "99%ile  : " + str(round(np.quantile(doc_lens, q=0.99))))

        plt.gca().set(xlim=(0, 1000), ylabel='Number of Documents', xlabel='Document Word Count')
        plt.tick_params(size=16)
        plt.xticks(np.linspace(0 ,1000 ,9))
        plt.title('Distribution of Document Word Counts', fontdict=dict(size=22))
        plt.show()
        f = open(image_file_path, 'wb')
        plt.savefig(
            image_file_path
        )

    def topic_word_count(self):
        image_name = 'topic_word_count_ ' +TRAINING_INPUT_TYP E +'.jpeg'
        image_file_path = os.path.join(
            os.getcwd(),
            self.images_folder,
            image_name
        )
        cols = [color for name, color in mcolors.XKCD_COLORS.items()]  # more colors: 'mcolors.XKCD_COLORS'

        # fig, axes = plt.subplots(2,2,figsize=(16,14), dpi=160, sharex=True, sharey=True)
        fig, axes = plt.subplots(5, 12, figsize=(120 ,50), sharex=True, sharey=True)


        for i, ax in enumerate(axes.flatten()):
            try:
                df_dominant_topic_sub = self.df_dominant_topic.loc[self.df_dominant_topic.Dominant_Topic == i, :]
            except Exception as e:
                continue
            doc_lens = [len(d) for d in df_dominant_topic_sub.Text]
            ax.hist(doc_lens, bins = BIN_NUMBER, color=cols[i])
            ax.tick_params(axis='y', labelcolor=cols[i], color=cols[i])
            sns.kdeplot(doc_lens, color="black", shade=False, ax=ax.twinx())
            ax.set(xlim=(0, BIN_NUMBER), xlabel='Document Word Count')
            ax.set_ylabel('Number of Documents', color=cols[i])
            ax.set_title('Topic:  ' +str(i), fontdict=dict(size=16, color=cols[i]))


        fig.tight_layout()
        fig.subplots_adjust(top=0.90)
        plt.xticks(np.linspace(0 ,BIN_NUMBER ,9))
        fig.suptitle('Distribution of Document Word Counts by Dominant Topic', fontsize=22)
        plt.show()
        f = open(image_file_path, 'wb')
        plt.savefig(
            image_file_path
        )

    def word_cloud(self):
        # 1. Wordcloud of Top N words in each topic
        # from matplotlib import pyplot as plt
        # import matplotlib.colors as mcolors
        image_name = 'cloud_word_ ' +TRAINING_INPUT_TYP E +'.jpeg'
        image_file_path = os.path.join(
            os.getcwd(),
            self.images_folder,
            image_name
        )
        cols = [color for name, color in mcolors.XKCD_COLORS.items()]  # more colors: 'mcolors.TABLEAU_COLORS'
        stop_words = set(stopwords.words("english"))
        cloud = WordCloud(stopwords=stop_words,
                          background_color='white',
                          width=1200,
                          height=500,
                          max_words=10,
                          colormap='tab10',
                          color_func=lambda *args, **kwargs: cols[i],
                          prefer_horizontal=1.0)

        topics = self.model.show_topics(formatted=False)

        # fig, axes = plt.subplots(2, 2, figsize=(10,10), sharex=True, sharey=True)
        fig, axes = plt.subplots(5, 12, figsize=(120 ,50), sharex=True, sharey=True)

        for i, ax in enumerate(axes.flatten()):
            try:
                topic_words = dict(topics[i][1])
            except Exception as e:
                continue
            fig.add_subplot(ax)
            cloud.generate_from_frequencies(topic_words, max_font_size=300)
            plt.gca().imshow(cloud)
            plt.gca().set_title('Topic ' + str(i), fontdict=dict(size=16))
            plt.gca().axis('off')


        plt.subplots_adjust(wspace=0, hspace=0)
        plt.axis('off')
        plt.margins(x=0, y=0)
        plt.tight_layout()
        plt.show()
        f = open(image_file_path, 'wb')
        plt.savefig(
            image_file_path
        )
