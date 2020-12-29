# import datetime
# import gensim
# import os
# import numpy as np
# import pickle
# import tensorflow as tf
# import json
# import random
# from tensorflow.keras.preprocessing.text import Tokenizer
# from tensorflow.keras.preprocessing.sequence import pad_sequences
import os
import json
import numpy as np
import pandas as pd
import torch
import transformers as ppb # pytorch transformers
from tensorflow.keras.preprocessing.sequence import pad_sequences
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import train_test_split

from contrai_cradle.db.db_connector import CONN
from contrai_cradle.abstracts.MLAbstract import MLAbstract
from contrai_cradle.config.constants import TRAINING_INGREDIENT_PATH


class BertClassifying(MLAbstract):
    """
    Long short-term memory classifier
    """
    _model_type = "BERT"
    _parametric = False
    _parameters = ""
    # _vocab_size = 11000
    # _vocab_size = 8000
    # _embedding_dim = 64
    # _embedding_dim = 300
    _max_length = 300
    # _max_length_label = 1
    # _trunc_type = 'post'
    # _padding_type = 'post'
    # _oov_tok = '<OOV>'
    # _training_portion = .8
    # _num_epochs = 50
    # _last_dense_dim = 55
    # _embedding_matrix = None

    def __init__(
        self, 
        preprocessing_id, 
        topic, k, embedding_method, 
        note, save_model, param_c, param_max_iter
    ):
        """
        @data: observation of text and words with labels, data
        to derive training and testing dataset
        @train_sample_ratio: #{training sample}/#{all samples}
        """
        # pass
        self._preprocessing_id = preprocessing_id
        self._param_c = int(param_c)
        self._param_max_iter = int(param_max_iter)
        self._load_data()
        self._import_bert_model_and_tokenizer()
        token_lists = self._tokenization()
        padded = self._pad_and_trim(token_lists)
        self._process_with_distil_bert(padded)
        self._spilt_samples()
        self._train_and_test()
        # self._preprocessing_id = preprocessing_id
        # self._topic = topic
        # train_X, test_X, train_y, test_y = self._load_data()
        # if embedding_method == 'word2vec':
        #     self._make_word2vec_matrix()
        # self._k = int(k)
        # self._save_model_bool = True
        # self._train_sample_ratio = 1 - 1 / self._k
        # self._note = note
        # # self._preprocessing_start = prev_output.preprocessing_start
        # # self._preprocessing_end = prev_output.preprocessing_end
        # self._training_start = datetime.datetime.strftime(
        #     datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # print("Training starts")
        # history = self._train_and_test(train_X, train_y, test_X, test_y)
        # print("Training finished after {} seconds".format(
        #     str(self._training_end - self._training_start)
        # ))
        # self._training_end = datetime.datetime.strftime(
        #     datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # self._save_model(history)
        # self._testing_start = datetime.datetime.strftime(
        #     datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # # self._test()
        # # self._test(self._observation, 'test')
        # # self._test(self._traindata)
        # # self._test(self._testdata)
        # self._testing_end = datetime.datetime.strftime(
        #     datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # # TODO: plot figures
        # self.vis_path = ""
        # # self._save_result()

    # def _make_word2vec_matrix(self):
    #     goog_wvmodel = gensim.models.KeyedVectors.load_word2vec_format(
    #         os.path.join(
    #             os.getcwd(),
    #             'google_word2vec/GoogleNews-vectors-negative300.bin.gz'
    #         ),
    #         binary=True
    #     )
    #     self._embedding_matrix = np.zeros(
    #         (self._vocab_size, self._embedding_dim)
    #     )
    #     for word, i in self._word_index.items():
    #         embedding_vector = None
    #         try:
    #             embedding_vector = goog_wvmodel.get_vector(word)[:self._embedding_dim]
    #         except Exception as e:
    #             embedding_vector = np.zeros(self._embedding_dim)
    #         if embedding_vector is not None:
    #             self._embedding_matrix[i] = embedding_vector

    # def _save_history(self, history):
    #     # save the model to disk
    #     filename = ''
    #     if self._save_model_bool:
    #         timestamp = datetime.datetime.strftime(
    #             datetime.datetime.now(), "%Y%m%d%H%M%S")
    #         filename = 'lstm_' + timestamp + '.sav'
    #         history_filename = 'lstm_history_' + timestamp + '.sav'
    #         self._model_filepath = os.path.join(
    #             os.getcwd(),
    #             MODEL_PATH,
    #             filename
    #         )
    #         history_path = os.path.join(
    #             os.getcwd(),
    #             RESULT_PATH,
    #             history_filename
    #         )
    #         pickle.dump(self._model, open(self._model_filepath, 'wb'))
    #         pickle.dump(history, open(history_path, 'wb'))
    #     self._evaluation_id = CONN.insert(
    #         EVL_TABLE,
    #         preprocessing_id=self._preprocessing_id,
    #         topic=self._topic,
    #         model_filepath=filename
    #     )

    def _train_and_test(self):
        lr_clf = LogisticRegression(
            C=self._param_c,
            max_iter=self._param_max_iter
        )
        lr_clf.fit(self._train_features, self._train_labels)
        lr_clf.score(self._test_features, self._test_labels)

    def _load_data(self):
        """
        Overwrite _load_data method with special vector treatment
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
        self._df = pd.DataFrame(data)
        self._df.head()

    def _import_bert_model_and_tokenizer(self):
        model_class, tokenizer_class, pretrained_weights = (
            ppb.DistilBertModel, ppb.DistilBertTokenizer, 'distilbert-base-uncased'
        )

        ## Want BERT instead of distilBERT? Uncomment the following line:
        #model_class, tokenizer_class, pretrained_weights = (
        #     ppb.BertModel, ppb.BertTokenizer, 'bert-base-uncased'
        # )

        # Load pretrained model/tokenizer
        self._tokenizer = tokenizer_class.from_pretrained(pretrained_weights)
        self._model = model_class.from_pretrained(pretrained_weights)

    def _tokenization(self):
        return self._df[0].apply(
            (
                lambda x: self._tokenizer.encode(x, add_special_tokens=True)
            )
        )

    def _pad_and_trim(self, token_lists):
        token_lists = [
            seq_val for seq_key, seq_val in token_lists.to_dict().items()
        ]
        df = pd.DataFrame(token_lists)
        df = df.iloc[:,:self._max_length]
        # replace nulls with token id 0 - pad with 0 for shorter sequences
        df = df.replace(np.nan, 0)
        return np.array(df)

    def _process_with_distil_bert(self, padded):
        input_ids = torch.tensor(padded)

        with torch.no_grad():
            self._last_hidden_states = self._model(input_ids.long())


    def _spilt_samples(self):
        # padded = pad_sequences(
        #     tokenized,
        #     maxlen=self._max_length,
        #     padding=self._padding_type,
        #     truncating=self._trunc_type
        # )
         # Slice the output for the first position for all the sequences, take all hidden unit outputs
        features = self._last_hidden_states[0][:,0,:].numpy()
        # features = np.array([x[0] for x in data])
        labels = self._df[1]
        # labels = np.array([np.where(np.array(sorted(set(labels))) == y)[0][0] for y in labels])
        print(len(labels))
        print(len(features))
        # sample split
        self._train_features, \
        self._test_features, \
        self._train_labels, \
        self._test_labels = train_test_split(features, labels)
        # train_size = int(len(features) * self._training_portion)
        # shuffle_index = random.sample(range(len(features)), train_size)
        # train_X = list(features[shuffle_index])
        # train_y = list(labels[shuffle_index])
        # val_X = list(np.delete(features, shuffle_index))
        # val_y = list(np.delete(labels, shuffle_index))
        # # tokenization
        # tokenizer = Tokenizer(num_words=self._vocab_size, oov_token=self._oov_tok)
        # tokenizer.fit_on_texts(features)
        # self._word_index = tokenizer.word_index
        # dict(list(self._word_index.items())[0:10])
        # train_sequences = tokenizer.texts_to_sequences(train_X)
        # print(train_sequences[10])
        # train_padded = pad_sequences(
        #     train_sequences,
        #     maxlen=self._max_length,
        #     padding=self._padding_type,
        #     truncating=self._trunc_type
        # )
        # print(len(train_sequences[0]))
        # print(len(train_padded[0]))

        # print(len(train_sequences[1]))
        # print(len(train_padded[1]))

        # print(len(train_sequences[10]))
        # print(len(train_padded[10]))
        # validation_sequences = tokenizer.texts_to_sequences(val_X)
        # validation_padded = pad_sequences(
        #     validation_sequences,
        #     maxlen=self._max_length,
        #     padding=self._padding_type,
        #     truncating=self._trunc_type
        # )
        # print(len(validation_sequences))
        # print(validation_padded.shape)
        # label_tokenizer = Tokenizer()
        # label_tokenizer.fit_on_texts(labels)
        # training_label_seq = np.array(label_tokenizer.texts_to_sequences(train_y))
        # training_label_padded = pad_sequences(
        #   training_label_seq,
        #   maxlen=self._max_length_label,
        #   padding=self._padding_type,
        #   truncating=self._trunc_type
        # )
        # validation_label_seq = np.array(label_tokenizer.texts_to_sequences(val_y))
        # validation_label_padded = pad_sequences(
        #   validation_label_seq,
        #   maxlen=self._max_length_label,
        #   padding=self._padding_type,
        #   truncating=self._trunc_type
        # )
        # train_y = np.array([[x] for x in train_y])
        # val_y = np.array([[x] for x in val_y])
        # return train_padded, validation_padded, train_y, val_y

