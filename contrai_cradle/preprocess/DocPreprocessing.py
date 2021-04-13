import os
import re
from typing import Dict
from contrai_cradle.preprocessing import PreprocessingAbstract

class DocPreprocessing(PreprocessingAbstract):
    def _load_file(self, file_path):
        full_path = os.path.join(os.getcwd(), file_path)
        return docx.Document(full_path)


    def _numerize_texts(self) -> Dict:
        derived_observations = []
        word2vec_corpus = []
        topic_file_pointer = []
        current_label = ''
        if len(self._contract_doc.paragraphs) > 0:
            for p in self._contract_doc.paragraphs:
                word_vec = []
                if len(p.text) == 0:
                    # if the paragraph is empty skip it
                    continue

                # if a paragraph starts with Appendix then jump out 
                # and stop looping through the rest of doc as those are not needed
                # trait: page title

                if p.text.lower().startswith('appendix') or \
                p.text.lower().startswith('exhibit') or \
                p.text.lower().startswith('annex') or \
                p.text.lower().startswith('schedule'):
                    break

                # denoise text
                text = self.denoise_text(p.text)
                # replace contractions
                # eg. don't --> do n't
                text = self.replace_contractions(text)
                # remove curly brackets
                text = re.sub(r'[{,}]', '', text)
                raw_word_vec = self._tokenize(text)
                # normalize the tokens
                raw_word_vec = self.normalize(raw_word_vec)
                # make TAG_OR_NOT judgement first as we use stop words to identify
                # TODO: REMOVE this when we have mannual tags in documents
                if self._caption_as_label(text, raw_word_vec):
                    current_label = clean_string(text)

                derived_observations.append(
                    self._word_scan(
                        raw_word_vec, current_label, self._strigent_topic
                    )
                )                               
                topic_file_pointer.append(
                    self._word_scan(
                        raw_word_vec, current_label, self._strigent_topic
                    ) + \
                    (
                        current_label,
                        os.path.basename(self._file_path),
                    )
                )
                if self._do_stemming:
                    for word in raw_word_vec:
                        word_vec.append(self._stemming(word))
                else:
                    word_vec = raw_word_vec
                word2vec_corpus.append(word_vec)

        return {
            'derived_observations': derived_observations,
            'topic_file_pointer': topic_file_pointer, 
            'word2vec_corpus': word2vec_corpus
        }
