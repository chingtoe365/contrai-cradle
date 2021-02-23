import os
import re
import pandas as pd

from typing import Dict
from contrai_cradle.preprocessing import PreprocessingAbstract


class CsvPreprocessing(PreprocessingAbstract):
    tag_obtaining_method = 'current_label_as_label'

    def _load_file(self, file_path):
        full_path = os.path.join(os.getcwd(), file_path)
        # return open(full_path).read()
        return pd.read_csv(full_path)

    def _full_text_pre_clean(self, text):
        # remove <> tags
        text = re.sub(r'<.*?>', '', text)
        # remove ampersand
        text = re.sub(r'&.*?;', '', text)
        return text

    def _numerize_texts(self) -> Dict:
        derived_observations = []
        clauses = self._contract_doc['clause']
        tags = self._contract_doc['tag']
        tags_list = list(set(tags))
        for i in range(self._contract_doc.shape[0]):
            if tags[i] == 'notclear' or tags[i] == 'none' or tags[i] == 'def' or \
                tags[i] == 'mult':
                #  or \
                # self._contract_doc.iloc[i]['title'] == 'GENERAL' or \
                # self._contract_doc.iloc[i]['title'] == 'DEFINITIONS .':
                continue
            text = self._full_text_pre_clean(clauses[i])
            if not self._extract_sentence:
                #TODO: tokenize that easy? white spaces?
                raw_word_vec = self._tokenize(text)
                # normalize the tokens
                raw_word_vec = self.normalize(raw_word_vec)

                # remove tokens with only non-alphabetical chars
                raw_word_vec = [w for w in raw_word_vec if re.search(r'\w', w)]
                paragraph_output = self._word_scan(
                    raw_word_vec, tags_list.index(tags[i]), self._strigent_topic
                )
                derived_observations.append(
                    paragraph_output    
                )
            else:
                for sentence in text.split("."):
                    if sentence != '':
                        #TODO: tokenize that easy? white spaces?
                        raw_word_vec = self._tokenize(sentence)
                        # normalize the tokens
                        raw_word_vec = self.normalize(raw_word_vec)

                        # remove tokens with only non-alphabetical chars
                        raw_word_vec = [w for w in raw_word_vec if re.search(r'\w', w)]
                        paragraph_output = self._word_scan(
                            raw_word_vec, tags_list.index(tags[i]), self._strigent_topic
                        )
                        derived_observations.append(
                            paragraph_output    
                        ) 
        return {
            'derived_observations': derived_observations
        }
