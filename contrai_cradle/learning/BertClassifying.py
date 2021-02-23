import datetime
import os
import json
import numpy as np
import pandas as pd
import torch
import transformers as ppb # pytorch transformers
import tensorflow as tf
from transformers.optimization import AdamW
# from utils.data.paths import resources_path

from tensorflow.keras.preprocessing.sequence import pad_sequences
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import train_test_split
from ignite.engine import Engine, Events
from ignite.metrics import RunningAverage, Accuracy, Precision
from ignite.handlers import ModelCheckpoint, EarlyStopping
from ignite.contrib.handlers import ProgressBar
from torch.utils.data import DataLoader
from torch.utils.data import Dataset

from contrai_cradle.db.db_connector import CONN
# from contrai_cradle.learning.LogisticClassifying import LogisticClassifying
from contrai_cradle.abstracts.MLAbstract import MLAbstract
from contrai_cradle.config.constants import TRAINING_INGREDIENT_PATH


class ContractDataset(Dataset):
    def __init__(self, data, device):
        self.device = device

        # Load the JSON file containing our pre-processed data
        # with open(path, 'r') as fp:
        sample_size = len(data['input_ids'])
        self.data = []
        for i in range(sample_size):
            self.data.append(
                [
                    data["input_ids"][i],
                    data["attention_mask"][i],
                    data["token_type_ids"][i],
                    data["labels"][0][i] 
                ]
            )

    def __len__(self):
        return len(self.data)

    def __getitem__(self, item):
        # Return four different tensors (3 inputs and the label)
        ids, att, tokens, labels = list(map(lambda o: torch.tensor(o).to(self.device), self.data[item]))

        return ids.long(), att.float(), tokens.long(), labels.long()

class BertClassifying(MLAbstract):
    """
    DistilBERT & Logistic Regression 

    classiying topics with a combination of pre-trained distilBERT
    with LR as final classifier
    """
    _model_type = "BERT"
    _parametric = False
    _parameters = ""
    # _num_labels = 54
    _num_labels = 54
    _sample_num_per_label = 5
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
    

    # TODO: try tweak this enlarge

    # TODO: try to start with just 2 samples to see changes of logits

    
    # TODO: extract sub-sentence from each sample to bootstrap sample size

    
    _num_epochs = 100 # The author of BERT specifically tell us to fine tune our model up to 5 epochs at maximum
    _batch_size = 32

    # TODO: try tweak this enlarge
    # The author of BERT specifically tell us to use a learning rate between 2e-5 and 5e-5
    # tried 2e-5 probably too slow
    _lr = 5e-5 

    _model_name = 'dbmdz/bert-base-italian-xxl-cased'

    _model_chkpt_dir = 'path/to/your/checkpoint/dir'

    # If you don't have an NVIDIA GPU use 'cpu'
    # _device = torch.device('cuda')
    _device = torch.device('cpu')

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
        self._save_model_bool = save_model
        self._topic = topic
        self._embedding_method = embedding_method
        self._note = note
        
        ### MODEL SPECIFIC OPERATIONS ###
        self._load_data()
        self._import_bert_model_and_tokenizer()
        train_dl, test_dl = self._train_test_batch_prepare_and_tokenize()
        # Call the training procedure
        print("Training start:{}".format(
                datetime.datetime.strftime(
                    datetime.datetime.now(), "%Y-%m-%d %H:%M:%S"
                )
            )
        )
        self._train(
            self._model_name, 
            self._model, 
            self._num_epochs, 
            train_dl, 
            test_dl, 
            self._optimizer, 
            self._model_chkpt_dir
        )
        print("Training ends:{}".format(
                datetime.datetime.strftime(
                    datetime.datetime.now(), "%Y-%m-%d %H:%M:%S"
                )
            )
        )
        # token_lists = self._tokenization()
        # padded = self._pad_and_trim(token_lists)
        # self._process_with_distil_bert(padded)
        # assign samples to _observation as data hub 
        # following class tradition
        # self._observation = self._comply_input_format()
        ### MODEL SPECIFIC OPERATIONS ###

        
        # self.cross_validation()
        # self._preprocessing_start = prev_output.preprocessing_start
        # self._preprocessing_end = prev_output.preprocessing_end
        # self._training_end = datetime.datetime.strftime(
        #     datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # self._save_model()
        # assiging dummy value to testing time records to avoid errors
        # self._testing_start = datetime.datetime.strftime(
        #     datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # self._testing_end = datetime.datetime.strftime(
        #     datetime.datetime.now(), "%Y-%m-%d %H:%M:%S")
        # TODO: plot figures
        # self.vis_path = ""
        # self._save_result()

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
        self._df.columns = ['clauses', 'labels']
        # self._df.head()

    def _import_bert_model_and_tokenizer(self):
        model_class, tokenizer_class, pretrained_weights = (
            ppb.BertForSequenceClassification, ppb.BertTokenizer, 'bert-base-uncased'
            # ppb.BertForSequenceClassification, ppb.BertTokenizer, 'bert-base-uncased'
        )
        # configuration = ppb.BertConfig(
        #     num_labels = 55
        # )
        ## Want BERT instead of distilBERT? Uncomment the following line:
        #model_class, tokenizer_class, pretrained_weights = (
        #     ppb.BertModel, ppb.BertTokenizer, 'bert-base-uncased'
        # )

        # Load pretrained model/tokenizer
        self._tokenizer = tokenizer_class.from_pretrained(pretrained_weights)
        self._model = model_class.from_pretrained(
            pretrained_weights, 
            num_labels=self._num_labels
        ).to(self._device)
        # Pick the optimizer according to the official paper.
        # Note: AdamW is a class from the Huggingface library (as opposed to pytorch)
        # 'W' stands for 'Weight Decay"
        self._optimizer = AdamW(
            self._model.parameters(),
            lr=self._lr,  # Between 2e-5 and 5e-5 according to the authors of BERT
            eps=1e-8  # Default value. Leave it like this unless you know why you need to change it.
        )

    # def _tokenize_and_train(self):

        # print(self._df.iloc[0:4,])
        # texts = self._df['clauses'].tolist()
        # inputs = self._tokenizer(texts, return_tensors="pt", truncation=True, padding=True)
        # labels = torch.tensor(self._df['labels'].tolist()).unsqueeze(0)
        # print(labels)
        # Training starts
        # turn on training mode        
        # model.train()
        # for _ in trange(int(self._num_epochs), desc="Epoch"):
        #     tr_loss = 0
        #     nb_tr_examples, nb_tr_steps = 0, 0
        #     for step, batch in enumerate(tqdm_notebook(train_dataloader, desc="Iteration")):
        #         batch = tuple(t.to(device) for t in batch)
        #         input_ids, input_mask, segment_ids, label_ids = batch

        #         # logits = self._model(input_ids, segment_ids, input_mask, labels=None)
        #         logits = self._model(**inputs, labels=labels)

        #         if OUTPUT_MODE == "classification":
        #             loss_fct = CrossEntropyLoss()
        #             loss = loss_fct(logits.view(-1, num_labels), label_ids.view(-1))
        #         elif OUTPUT_MODE == "regression":
        #             loss_fct = MSELoss()
        #             loss = loss_fct(logits.view(-1), label_ids.view(-1))

        #         if GRADIENT_ACCUMULATION_STEPS > 1:
        #             loss = loss / GRADIENT_ACCUMULATION_STEPS

        #         loss.backward()
        #         print("\r%f" % loss, end='')
                
        #         tr_loss += loss.item()
        #         nb_tr_examples += input_ids.size(0)
        #         nb_tr_steps += 1
        #         if (step + 1) % GRADIENT_ACCUMULATION_STEPS == 0:
        #             optimizer.step()
        #             optimizer.zero_grad()
        #             global_step += 1
        # outputs = self._model(**inputs, labels=labels)
        # print("Model Loss")
        # print(outputs.loss)
        # print("Model Logits")
        # print(outputs.logits)

    def _train_test_batch_prepare_and_tokenize(self):
        # filter to leave only 2 labels data
        # find 2 labels with largest size of samples
        # add a column
        # self._df["count"] = self._df["labels"]
        picked_labels = self._df.groupby(["labels"]).count().sort_values(
            by=['clauses'], ascending=False
        ).iloc[0:self._num_labels,].index.tolist()
        self._df = self._df[self._df["labels"].isin(picked_labels)]
        # self._df["count"] = self._df.groupby(['labels'])["count"].transform("count")

        # transform labels to continuous sequence
        self._df['labels'] = [
            np.where(
                np.array(list(set(self._df['labels'])))==x
            )[0][0] for x in self._df['labels'].tolist()
        ]
        # sort and select only first occurence for each label 
        # as training set
        self._df['ind'] = self._df.index
        train_df = self._df.sort_values(
            ['labels'], ascending=False
        ).groupby(['labels'], as_index=False).head(self._sample_num_per_label)
        # the remaining as testing set
        test_df = self._df[~self._df['ind'].isin(
            train_df['ind']
        )]

        train_texts = train_df['clauses'].tolist()
        train_ds = self._tokenizer(
            train_texts, return_tensors="pt", truncation=True, padding=True
        )
        train_labels = torch.tensor(
            train_df['labels'].tolist()
        ).unsqueeze(0)
        train_ds['labels'] = train_labels

        test_texts = test_df['clauses'].tolist()
        test_ds = self._tokenizer(
            test_texts, return_tensors="pt", truncation=True, padding=True
        )
        test_labels = torch.tensor(
            test_df['labels'].tolist()
        ).unsqueeze(0)
        test_ds['labels'] = test_labels
        train_ds = ContractDataset(
            train_ds, self._device
        )
        test_ds = ContractDataset(
            test_ds, self._device
        )
        train_dl = DataLoader(
            train_ds, batch_size=self._batch_size, shuffle=True, num_workers=2, pin_memory=True
        )
        test_dl = DataLoader(
            test_ds, batch_size=self._batch_size, shuffle=True, num_workers=2, pin_memory=True
        )
        return train_dl, test_dl
        # self._df = self._df.sort_values(
        #     ['labels'], ascending=False
        # )

        # self._df = self._df.iloc[0:3,]

    # def _tokenization(self):
    #     return self._df[0].apply(
    #         (
    #             lambda x: self._tokenizer.encode(x, add_special_tokens=True)
    #         )
    #     )

    # def _pad_and_trim(self, token_lists):
    #     token_lists = [
    #         seq_val for seq_key, seq_val in token_lists.to_dict().items()
    #     ]
    #     df = pd.DataFrame(token_lists)
    #     df = df.iloc[:,:self._max_length]
    #     # replace nulls with token id 0 - pad with 0 for shorter sequences
    #     df = df.replace(np.nan, 0)
    #     return np.array(df)

    # def _process_with_distil_bert(self, padded):
    #     input_ids = torch.tensor(padded)

    #     with torch.no_grad():
    #         self._last_hidden_states = self._model(input_ids.long())

    # def _comply_input_format(self):
    #     features = self._last_hidden_states[0][:,0,:].numpy()
    #     features = pd.DataFrame(features).to_dict(orient='records')
    #     labels = self._df[1]
    #     output = []
    #     for count in range(len(features)):
    #         output.append([features[count], labels[count]])
    #     del self._df
    #     del self._last_hidden_states
    #     return output
    

    def _train(
        self, model_name, model, epochs, train_dl, test_dl, optimizer, chkpt_dir
    ):
        # Ignite's Train loop
        def train_loop(engine, batch):
            # Set the model in training mode
            model.train()

            # Null the gradients
            optimizer.zero_grad()

            # Unpack the batch returned by the DataLoader
            input_ids, attention_mask, token_type_ids, labels = batch

            # Compute model outputs
            output = model(
                input_ids=input_ids,
                attention_mask=attention_mask,
                token_type_ids=token_type_ids,
                labels=labels
            )

            # The loss is the first element in the returned tuple
            loss = output[0]

            # Back-propagate
            loss.backward()

            # Compute optimizer step towards our loss minimum
            optimizer.step()

            # Return the loss value at each iteration
            return loss.item()

        # Ignite's Test loop
        def val_loop(engine, batch):
            # Set the model in evaluation mode, disabling dropout and autograd
            model.eval()

            # Deactivate autograd
            with torch.no_grad():
                # Unpack the batch returned by the test DataLoader
                input_ids, attention_mask, token_type_ids, labels = batch

                # Compute model outputs
                output = model(
                    input_ids=input_ids,
                    attention_mask=attention_mask,
                    token_type_ids=token_type_ids,
                    labels=labels
                )

            # transformed_labels = torch.zeros(output[1].shape[0], output[1].shape[1])
            # for sample_index in range(len(labels)):
            #     transformed_labels[sample_index][int(labels[sample_index])] = 1
            # Return predicted and real labels

            # apply softmax to logits in output
            # for i in range(shape(output[1].shape[1])):
            #     tf.nn.softmax(output[1][i])
            # softmax = torch.nn.Softmax()

            # pred = tf.map_fn(tf.nn.softmax, output[1])
            print("Model output logits first row: ")
            print(output[1][0])
            return output[1], labels

        # Define two Ignite Engines for training and testing, respectively.
        trainer = Engine(train_loop)
        validator = Engine(val_loop)

        # Bind an accuracy & precision metric to the validation engine
        # Accuracy(is_multilabel=True).attach(validator, "accuracy")
        Accuracy().attach(validator, "accuracy")
        # Precision(is_multilabel=True).attach(validator, "precision")
        Precision().attach(validator, "precision")

        # As Early Stopping score function we use the accuracy
        def score_function(engine: Engine):
            # The engine should be a validator
            val_accuracy = engine.state.metrics['accuracy']
            return -val_accuracy

        # Define the actual Early Stopping function
        early_stopping_handler = EarlyStopping(
            patience=2,  # You might want to change this, but be careful.
            score_function=score_function,
            trainer=trainer,
        )

        # Evaluate the model after every epoch.
        @trainer.on(Events.EPOCH_COMPLETED)
        def log_validation_results(engine):
            validator.run(test_dl)
            print(
                f"validation epoch: {engine.state.epoch} acc: {100 * validator.state.metrics['accuracy']} prec:{100 * validator.state.metrics['precision']}")

        # Add a running average over the loss and a progressbar relative to the number of iterations
        RunningAverage(output_transform=lambda x: x).attach(trainer, "loss")
        ProgressBar(persist=True).attach(trainer, metric_names=['loss'])

        # Save checkpoints and config
        checkpoint_handler = ModelCheckpoint(
            chkpt_dir,
            'checkpoint',
            n_saved=epochs,
            save_as_state_dict=True,
            require_empty=False
        )

        # Save a model with huggingface's interface
        def huggingface_save_handler():
            # Create the dir
            if not os.path.exists(os.path.join(chkpt_dir, 'huggingface')):
                os.mkdir(os.path.join(chkpt_dir, 'huggingface'))

            # Save model & tokenizer
            model.save_pretrained(save_directory=os.path.join(chkpt_dir, 'huggingface'))
            # AutoTokenizer.from_pretrained(model_name).save_pretrained(os.path.join(chkpt_dir, 'huggingface'))

        trainer.add_event_handler(Events.EPOCH_COMPLETED, checkpoint_handler, {'model': model})
        trainer.add_event_handler(Events.COMPLETED, huggingface_save_handler)
        # validator.add_event_handler(Events.COMPLETED, early_stopping_handler)

        # Do not run for more than 5 epochs, you'll
        trainer.run(train_dl, max_epochs=epochs)