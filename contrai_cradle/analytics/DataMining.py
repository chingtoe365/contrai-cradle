import os
import json

import pandas as pd

from contrai_cradle.db.db_connector import CONN
from contrai_cradle.tagging import LABEL_VALUE_MAP
from contrai_cradle.preprocessing import TRAINING_INGREDIENT_PATH

class DataMining(object):
    """
    Data mining base class 
    """
    def __init__(
        self, 
        preprocessing_id
    ):
        """
        @data: observation of text and words with labels, data 
        to derive training and testing dataset
        @train_sample_ratio: #{training sample}/#{all samples}
        """
        self._preprocessing_id = preprocessing_id
        self._topic = ''
        self._observation = self._load_data()


    def _get_topic_id(self):
        return LABEL_VALUE_MAP[self._topic]

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

    def _save_as_csv(self, filepath):
        pd.DataFrame(self._observation).to_csv(filepath)


    def _count_label_info(self):
        df = pd.DataFrame(self._observation)
        df.columns = ['text', 'label']
        import pdb; pdb.set_trace()  # breakpoint 33cd1efa //
        label_sample_count = df.groupby('label').count()
        df['wordCount'] = df.apply(lambda x: len(x['text'].split(' ')), axis=1)
        df_summary = df.groupby('label')
        df_summary['average'] = df.groupby('label').average()
        df_summary[''] = df.groupby('label').average()
if __name__ == '__main__':
    dm = DataMining(773)
    # dm._save_as_csv('cleaned_clauses.csv')
    dm._count_label_info()
