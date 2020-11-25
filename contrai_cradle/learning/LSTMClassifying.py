import datetime
import gensim
import os
import numpy as np
import pickle
import tensorflow as tf
import json
import random
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences

from contrai_cradle.db.db_connector import CONN
from contrai_cradle.learning import MLAbstract


class LSTMClassifying(MLAbstract):
    """
    Long short-term memory classifier
    """
    _model_type = "LSTM"
    _parametric = False
    _parameters = ""
    # _vocab_size = 11000
    _vocab_size = 8000
    # _embedding_dim = 64
    _embedding_dim = 300
    _max_length = 200
    _max_length_label = 1
    _trunc_type = 'post'
    _padding_type = 'post'
    _oov_tok = '<OOV>'
    _training_portion = .8
    _num_epochs = 50
    _last_dense_dim = 55
    _embedding_matrix = None

    def __init__(
            self,
            preprocessing_id,
            topic, k, embedding_method,
            note, save_model
    ):
        """
        @data: observation of text and words with labels, data
        to derive training and testing dataset
        @train_sample_ratio: #{training sample}/#{all samples}
        """
        self._preprocessing_id = preprocessing_id
        self._topic = topic
        train_X, test_X, train_y, test_y = self._load_data()
        if embedding_method == 'word2vec':
            self._make_word2vec_matrix()
        self._k = int(k)
        self._save_model_bool = True
        self._train_sample_ratio = 1 - 1 / self._k
        self._note = note
        # self._preprocessing_start = prev_output.preprocessing_start
        # self._preprocessing_end = prev_output.preprocessing_end
        self._training_start = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        print("Training starts")
        history = self._train_and_test(train_X, train_y, test_X, test_y)
        print("Training finished after {} seconds".format(
            str(self._training_end - self._training_start)
        ))
        self._training_end = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        self._save_model(history)
        self._testing_start = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # self._test()
        # self._test(self._observation, 'test')
        # self._test(self._traindata)
        # self._test(self._testdata)
        self._testing_end = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # TODO: plot figures
        self.vis_path = ""
        # self._save_result()

    def _make_word2vec_matrix(self):
        goog_wvmodel = gensim.models.KeyedVectors.load_word2vec_format(
            os.path.join(
                os.getcwd(),
                'google_word2vec/GoogleNews-vectors-negative300.bin.gz'
            ),
            binary=True
        )
        self._embedding_matrix = np.zeros(
            (self._vocab_size, self._embedding_dim)
        )
        for word, i in self._word_index.items():
            embedding_vector = None
            try:
                embedding_vector = goog_wvmodel.get_vector(word)[:self._embedding_dim]
            except Exception as e:
                embedding_vector = np.zeros(self._embedding_dim)
            if embedding_vector is not None:
                self._embedding_matrix[i] = embedding_vector

    def _save_history(self, history):
        # save the model to disk
        filename = ''
        if self._save_model_bool:
            timestamp = datetime.datetime.strftime(
                datetime.datetime.now(), "%Y%m%d%H%M%S")
            filename = 'lstm_' + timestamp + '.sav'
            history_filename = 'lstm_history_' + timestamp + '.sav'
            self._model_filepath = os.path.join(
                os.getcwd(),
                MODEL_PATH,
                filename
            )
            history_path = os.path.join(
                os.getcwd(),
                RESULT_PATH,
                history_filename
            )
            pickle.dump(self._model, open(self._model_filepath, 'wb'))
            pickle.dump(history, open(history_path, 'wb'))
        self._evaluation_id = CONN.insert(
            EVL_TABLE,
            preprocessing_id=self._preprocessing_id,
            topic=self._topic,
            model_filepath=filename
        )

    def _train_and_test(self, train_X, train_y, test_X, test_y):
        self._model = tf.keras.Sequential([
            # Add an Embedding layer expecting input vocab of size 5000, and output embedding dimension of size 64 we set at the top
            # remove embedding if using other word vectors
            # tf.keras.layers.Embedding(self._vocab_size, self._embedding_dim),
            tf.keras.layers.Embedding(
                self._vocab_size,
                self._embedding_dim,
                weights=[self._embedding_matrix],
                trainable=False
            ),
            tf.keras.layers.Bidirectional(tf.keras.layers.LSTM(self._embedding_dim)),
            # tf.keras.layers.Bidirectional(tf.keras.layers.LSTM(32)),
            # use ReLU in place of tanh function since they are very good alternatives of each other.
            tf.keras.layers.Dense(self._embedding_dim, activation='relu'),
            # Add a Dense layer with 6 units and softmax activation.
            # When we have multiple outputs, softmax convert outputs layers into a probability distribution.
            tf.keras.layers.Dense(self._last_dense_dim, activation='softmax')
        ])
        print(self._model.summary())
        self._model.compile(
            loss='sparse_categorical_crossentropy', optimizer='adam', metrics=['accuracy']
        )

        history = self._model.fit(
            train_X,
            train_y,
            epochs=self._num_epochs,
            validation_data=(
                test_X, test_y
            ),
            verbose=2
        )
        print(history)
        # pickle.dump(history, open(self._model_filepath, 'wb'))
        return history

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
        features = np.array([x[0] for x in data])
        labels = [x[1] for x in data]
        labels = np.array([np.where(np.array(sorted(set(labels))) == y)[0][0] for y in labels])
        print(len(labels))
        print(len(features))
        # sample split
        train_size = int(len(features) * self._training_portion)
        shuffle_index = random.sample(range(len(features)), train_size)
        train_X = list(features[shuffle_index])
        train_y = list(labels[shuffle_index])
        val_X = list(np.delete(features, shuffle_index))
        val_y = list(np.delete(labels, shuffle_index))
        # tokenization
        tokenizer = Tokenizer(num_words=self._vocab_size, oov_token=self._oov_tok)
        tokenizer.fit_on_texts(features)
        self._word_index = tokenizer.word_index
        dict(list(self._word_index.items())[0:10])
        train_sequences = tokenizer.texts_to_sequences(train_X)
        print(train_sequences[10])
        train_padded = pad_sequences(
            train_sequences,
            maxlen=self._max_length,
            padding=self._padding_type,
            truncating=self._trunc_type
        )
        print(len(train_sequences[0]))
        print(len(train_padded[0]))

        print(len(train_sequences[1]))
        print(len(train_padded[1]))

        print(len(train_sequences[10]))
        print(len(train_padded[10]))
        validation_sequences = tokenizer.texts_to_sequences(val_X)
        validation_padded = pad_sequences(
            validation_sequences,
            maxlen=self._max_length,
            padding=self._padding_type,
            truncating=self._trunc_type
        )
        print(len(validation_sequences))
        print(validation_padded.shape)
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
        train_y = np.array([[x] for x in train_y])
        val_y = np.array([[x] for x in val_y])
        return train_padded, validation_padded, train_y, val_y

