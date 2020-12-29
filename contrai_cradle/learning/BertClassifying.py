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
from contrai_cradle.learning.LogisticClassifying import LogisticClassifying
# from contrai_cradle.abstracts.MLAbstract import MLAbstract
from contrai_cradle.config.constants import TRAINING_INGREDIENT_PATH


class BertClassifying(LogisticClassifying):
    """
    DistilBERT & Logistic Regression 

    classiying topics with a combination of pre-trained distilBERT
    with LR as final classifier
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
        self._k = int(k)
        self._train_sample_ratio = 1 - 1 / self._k
        self._preprocessing_id = preprocessing_id
        self._param_c = int(param_c)
        self._param_max_iter = int(param_max_iter)

        ### MODEL SPECIFIC OPERATIONS ###
        self._load_data()
        self._import_bert_model_and_tokenizer()
        token_lists = self._tokenization()
        padded = self._pad_and_trim(token_lists)
        self._process_with_distil_bert(padded)
        # assign samples to _observation as data hub 
        # following class tradition
        self._observation = self._comply_input_format()
        ### MODEL SPECIFIC OPERATIONS ###

        self._note = note
        self._training_start = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        self.cross_validation()
        # self._preprocessing_start = prev_output.preprocessing_start
        # self._preprocessing_end = prev_output.preprocessing_end
        self._training_end = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        self._save_model()
        # assiging dummy value to testing time records to avoid errors
        self._testing_start = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        self._testing_end = datetime.datetime.strftime(
            datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # TODO: plot figures
        self.vis_path = ""
        self._save_result()

    # def _train_and_test(self):
    #     lr_clf = LogisticRegression(
    #         C=self._param_c,
    #         max_iter=self._param_max_iter
    #     )
    #     lr_clf.fit(self._train_features, self._train_labels)
    #     lr_clf.score(self._test_features, self._test_labels)

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

    def _comply_input_format(self):
        features = self._last_hidden_states.to_dict(orient='records')
        labels = self._df[1]
        output = []
        for count in range(len(features)):
            output.append([features[count], labels[count]])
        del self._df
        del self._last_hidden_states
        return output
