__doc__ = '''
Unsupervised learning implementation class
'''
import os
import json
import pickle
import datetime
import re
import pandas as pd

from abstracts.abstractions import JLUnsupervisedLearningAbstract

from preprocessing import TRAINING_INGREDIENT_PATH
from db.db_connector import CONN
from config.constants import TRAINING_INPUT_TYPE

from gensim.corpora import Dictionary
from gensim import models

MODEL_PATH = 'models/'

class UnsupervisedLearningImpl(JLUnsupervisedLearningAbstract):
    def __init__(self, preprocessing_id, topic, k):
        super().__init__(preprocessing_id, topic, k)
        print("Unsupervised learning impl.....")

    def _load_data(self):
        """
        Load data for training and testing
        """
        # get sample filename 
        filenames = CONN.get_sample_filename_by_id(
            self._preprocessing_id
        )
        filename = filenames[0][0]

        filepath = os.path.join(
            os.getcwd(),
            TRAINING_INGREDIENT_PATH,
            filename
        )
        json_string = open(filepath, 'r').read()
        data = json.loads(json_string)
        if self._topic:
            topic_id = self._get_topic_id()
            for entry in data:
                if entry[1] != topic_id:
                    entry[1] = -1
        return data

    def _save_model(self):
        # save the model to disk

        timestamp = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y%m%d%H%M%S")
        filename = timestamp+'.sav'
        self._model_filepath = os.path.join(
            os.getcwd(),
            MODEL_PATH,
            filename
        )
        pickle.dump(self._model, open(self._model_filepath, 'wb'))

    def _bow_formatter(self):
        """
        Turn bow in the format of the following:
        {"a": 1, "B": 2, "c": 4}
        into a list of 
        ["a", "B", "B", "c", "c", "c", "c"]
        and then apply 
        gensim.corpora.Dictionary(processed_docs)
        bow_corpus = [dictionary.doc2bow(doc) for doc in processed_docs]
        """
        corpus = []
        corpus_single_gram = []
        corpus_tfidf = []
        # id2word = []
        for bow_item in self._observation:
            bow_dict = bow_item[0]
            words_in_item = []
            words_in_item_single_gram = []
            for word in bow_dict:
                # if word.startswith('')
                if len(word.split(' ')) == 1:
                    words_in_item_single_gram += [word] * occurence
                    if re.match(r'^\w\d_', word):
                        # remove marks like p1_name etc.
                        continue
                occurence = bow_dict[word]
                words_in_item += [word] * occurence
            corpus.append(words_in_item)
            corpus_single_gram.append(words_in_item_single_gram)
        dictionary = Dictionary(corpus)
        dictionary.filter_extremes(no_below=15, no_above=0.5)
        bow_corpus = [dictionary.doc2bow(doc) for doc in corpus]
        if TRAINING_INPUT_TYPE == 'tfidf':
            tfidf = models.TfidfModel(bow_corpus)
            corpus_tfidf = tfidf[bow_corpus]
        return bow_corpus, dictionary, corpus, corpus_single_gram, corpus_tfidf


    def format_topics_sentences(self):
        # Init output
        sent_topics_df = pd.DataFrame()

        # Get main topic in each document
        for i, row_list in enumerate(self.model[self.training_corpus]):
            try:
                row = row_list[0] if self.model.per_word_topics else row_list
            except Exception as e:
                row = row_list
            # print(row)
            row = sorted(row, key=lambda x: (x[1]), reverse=True)
            # Get the Dominant topic, Perc Contribution and Keywords for each document
            for j, (topic_num, prop_topic) in enumerate(row):
                if j == 0:  # => dominant topic
                    wp = self.model.show_topic(topic_num)
                    topic_keywords = ", ".join([word for word, prop in wp])
                    sent_topics_df = sent_topics_df.append(
                        pd.Series([int(topic_num), round(prop_topic,4), topic_keywords]), 
                        ignore_index=True
                    )
                else:
                    break
        sent_topics_df.columns = ['Dominant_Topic', 'Perc_Contribution', 'Topic_Keywords']

        # Add original text to the end of the output
        contents = pd.Series(self.corpus)
        sent_topics_df = pd.concat([sent_topics_df, contents], axis=1)
        return(sent_topics_df)

