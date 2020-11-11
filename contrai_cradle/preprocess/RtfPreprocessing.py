import os
import re
from contrai_cradle.preprocessing import PreprocessingAbstract
from contrai_cradle.analytics.sentence_tree_analytics import SentenceTreeFeatureScanner
from contrai_cradle.utils import update_dict_by_accumulate
from contrai_cradle.event_logger import logger

from sklearn.feature_extraction.text import TfidfVectorizer

class RtfPreprocessing(PreprocessingAbstract):
    _paragraph_separator_sub = "###############"
    def _load_file(self, file_path):
        full_path = os.path.join(os.getcwd(), file_path)
        return open(full_path).read()

    def _full_text_pre_clean(self):
        #--- remove format paragraph
        text = re.sub(r'\\rtf1[\s,\S]*?\\par\s', '', self._contract_doc)
        #--remove footer paragraph
        text = re.sub(r'\\footery\d+[\s,\S]+?\\par\s', '', self._contract_doc)
        #---remove cross-ref: datafields
        # text = re.sub(r'{\\field[\s,\S]+?\\sectd', '', text))
        text = re.sub(r'_Ref\d+', '', text)
        #--- split the text by \\par
        text = re.sub(
            r'\\par\s', self._paragraph_separator_sub, text)
        #--- remove comments 
        text = re.sub(r'\\atrfend[\s,\S]*?}}}', '', text)
        # remove some special text coloring
        text = re.sub(r'\\bkmk.*?}', '', text)
        # remove images 
        text = re.sub(r'\\picscalex[\s,\S]+?}', '', text)
        # remove underscores
        text = re.sub(r'__+', '', text)

        return text

    def _full_page_pre_clean(self, page):
        page = page.lower()
        #--- remove all decorative tags
        page = re.sub(r'\\[a-z,A-Z,0-9,\-,\*,\',\~]*', '', page)
        page = re.sub(r'\\~', '', page)
        #--- remove cross refs 
        page = re.sub(r'_ref\d+', '', page)
        #--- remove table of content bookmarks
        page = re.sub(r'_toc\d*', '', page)
        #--- remove curly brackets
        page = re.sub(r'[{,}]', '', page)
        #--- destroy TOB - example: Cont_0014.rtf
        # Otherwise sometimes >1 DEFINITIONS in the next step will be spotted
        page = re.sub(r'toc[\S,\s]*pageref[\s,\S]*pageref', '', page)
        #--- remove hyperlinks
        page = re.sub(r'hyperlink \"[\S,\s]*\"', '', page)
        #--- http text
        page = re.sub(r'\(http://.*\)', '', page)
        page = re.sub(r'\(https://.*\)', '', page)
        #--- document path or file name
        page = re.sub(r'\S+\.\S+', '', page)
        # TODOs:
        # - hyphen in title
        # - space and line break in title
        # skip definition
        page = page.strip()
        # remove space at front just for non-legal body detection
        pattern = re.compile(
            '^[\\s, \\n, \\t, '+self._paragraph_separator_sub+']+'
        )
        page = re.sub(pattern, '', page)    
        return page 

    def _numerize_texts(self) -> List:
        derived_observations = []
        same_topic_BOW = []
        # add a file to point topic to file
        # only used as reference for research
        topic_file_pointer = []
        tfidf_calculation_corpus = []
        tfidf_calculation_topic = []
        current_label = ''
        mock_caption_prefix = '1.'
        bullet_cached_text = ''
        preknown_caption = False
        prematured_annex = False
        end_of_legal_body = False
        is_in_bullet_list = False
        # current_index = 0
        # prev_index = -1
        # last_paragraph_fs = ''
        # wired_document_switch_on = False
        # text = re.sub(r'Article\s\d+}\n\\par\s', '1.', self._contract_doc)
        #--- remove format paragraph
        text = self._full_text_pre_clean()
        #--- split the text by special string into different pages
        pages = text.split('\\pagebb')
        #--- loop through every paragraph
        current_paragraph_section = 0
        index_topic_map = {}
        try:
            for page in pages:
                paragraph_count = 0
                page = self._full_page_pre_clean(page)
                paragraphs = page.split(self._paragraph_separator_sub)
                
                for paragraph in paragraphs:
                    paragraph_count += 1
                    paragraph_raw = paragraph

                    # #--- remove all decorative tags
                    # paragraph = re.sub(r'\\[a-z,A-Z,0-9,\-,\*,\']*', '', paragraph)
                    # paragraph = re.sub(r'\\~', '', paragraph)
                    # #--- remove cross refs 

                    # #TODO: something left! a long hash string eft like this

                    # # 
                    # paragraph = re.sub(r'_ref\d+', '', paragraph)
                    # #--- remove table of content bookmarks
                    # paragraph = re.sub(r'_toc\d*', '', paragraph)
                    # #--- remove curly brackets
                    # paragraph = re.sub(r'[{,}]', '', paragraph)
                    # #--- destroy TOB - example: Cont_0014.rtf
                    # # Otherwise sometimes >1 DEFINITIONS in the next step will be spotted
                    # paragraph = re.sub(r'toc[\S,\s]*pageref[\s,\S]*pageref', '', paragraph)
                    # TODOs:
                    # - hyphen in title
                    # - space and line break in title

                    # remove space at front just for caption detection
                    paragraph = re.sub(r'^\s+', '', paragraph)
                    
                    # if a paragraph starts with Appendix then jump out 
                    # and stop looping through the rest of doc as those are not needed
                    # 'appendix' 'schedule' 'exhibit' 'annex'
                    # trait: page title

                    if paragraph_count == 1 and \
                        self._non_legal_content_check(paragraph):
                        break

                    if len(derived_observations) > 0 and \
                        self._non_legal_content_check(paragraph):
                        # if paragraph starts with these words and
                        # body has already been caught 
                        # it indicates the end of legal body
                        end_of_legal_body = True
                        break

                    # captions indicated by 'Article' keyword
                    # special treatment for Cont_0371.rtf
                    if preknown_caption:
                        paragraph = mock_caption_prefix + paragraph
                    if re.search(r'^article\s\d+', paragraph):
                        preknown_caption = True
                    else:
                        preknown_caption = False

                    # replace line break
                    paragraph = re.sub(r'\s*\n\s*', ' ', paragraph)
                    # replace consecutive spaces to just one space
                    paragraph = re.sub(r'\s\s+', ' ', paragraph)

                    # skip definition
                    # paragraph = paragraph.strip()
                    if len(paragraph) == 0 or \
                        not re.search(r'[a-zA-Z]', paragraph):
                        # skip it when
                        # - paragraph is empty
                        # - only digits and special chars
                        continue

                    # replace all white space
                    no_space_string = re.sub(r'[\s, \n]', '', paragraph)
                    # this caption search has excluded nested bullet numbers
                    # eg. 1.1.3 a sentence followed 
                    # will be excluded
                    normal_caption_search = re.search(
                        r'^(\d+)[\., \s, \)]*((?![0-9, \., \(, \", \*, \']).+)', no_space_string)

                    # last step cleaning
                                    # denoise text
                    paragraph = self.denoise_text(paragraph)
                    # replace contractions
                    # eg. don't --> do n't
                    paragraph = self.replace_contractions(paragraph)
                    # print(">>>before title iden")
                    if (
                            normal_caption_search and \
                            not re.search(r'\\outlinelevel1', paragraph_raw)
                            # not prematured_annex
                        ):
                        # define caption paragraph capture rules
                        # - caption-like paragraph
                        # - the captured index is increasing OR 
                        # it's the first time a caption captured
                        # speical treatment for excluding normal clause in definition
                        # as caption, eg. Cont_0357.rtf
                        # if caption index "1" appears twice then this is the abnormal one
                        # print("begin of caption check")
                        capcap = re.search(
                            r'(\d+)\.?\)?\[?\s*([\w, \s, \-, \,]+)', paragraph
                        )

                        current_label = capcap.group(2).lower().strip()

                        current_label = re.sub(r'\s\s+', ' ', current_label)
                        # print("current label: {}".format(current_label))
                        # clear BOW in the case when _multiple_paragraphs is set True
                        if self._multiple_paragraphs and \
                            same_topic_BOW:
                            # if there is something in current BOW, add it first to output
                            # as it comes to a finish for previous topic
                            derived_observations.append(same_topic_BOW)
                            topic_file_pointer.append(
                                [same_topic_BOW[0], same_topic_BOW[1]] + \
                                    [
                                        current_label,
                                        os.path.basename(self._file_path),
                                    ]
                            )
                            tfidf_calculation_corpus.append(' '.join(
                                [k for k in same_topic_BOW[0]]
                            ))
                            tfidf_calculation_topic.append(same_topic_BOW[1])
                            same_topic_BOW = []
                            # print("clear bow done")
                        # concatenate broken label - this happen sometimes

                        # current_paragraph_section = caption_search.group(1)
                        # index_topic_map[]
                        # current_label = 'definition'      
                        # print("end of caption check")
                    else:
                        # no caption-like string is found
                        if self._definition_check(current_label) or \
                            current_label == '' or \
                            not re.search(r'[a-zA-Z]', current_label):
                            # Skip when
                            # * it is definition
                            # * it does not belong to any label         
                            # # save font size to last_paragraph_fs for next
                            # last_paragraph_fs = font_size

                            continue
                        else:
                            # remove cross ref without links
                            paragraph = re.sub(r'[clause, section]\s\d+[\.\d+]*', '', paragraph)
                            # replace tilde with space which sometimes happen
                            # eg. Cont_0001.rtf section 6.3
                            paragraph = re.sub(r'~', ' ', paragraph)
                            # print(paragraph)

                            # process listing contents identification of colons
                            if paragraph[-1] == ':':
                                is_in_bullet_list = True
                                bullet_cached_text = paragraph
                                continue

                            if is_in_bullet_list:
                                # remove bullet numbering & letters (roman) 
                                paragraph = re.sub(r'^[\d, \.]+', '', paragraph)
                                paragraph = re.sub(r'\([\d, \w]+\)', '', paragraph)
                                paragraph = bullet_cached_text + paragraph
                                if paragraph[-1] == '.':
                                    is_in_bullet_list = False

                            # if no special skipping needed then record it
                            # in bag of words
                            # remove bullet numbering & letters (roman) 
                            paragraph = re.sub(r'^[\d, \.]+', '', paragraph)
                            paragraph = re.sub(r'\([\d, \w]+\)', '', paragraph)
                            paragraph = re.sub(':', ' ', paragraph)
                            #TODO: tokenize that easy? white spaces?
                            raw_word_vec = self._tokenize(paragraph)
                            # normalize the tokens
                            raw_word_vec = self.normalize(raw_word_vec)

                            # remove tokens with only non-alphabetical chars
                            raw_word_vec = [w for w in raw_word_vec if re.search(r'\w', w)]
                            # print('<>>>>>>>>before pos ana')
                            # select specific type of words (noun/verb/etc.)
                            if self._pos:
                                raw_word_vec = self._pos_tag_check(raw_word_vec, self._pos)

                            # using POS tag to filter abnormal sentences
                            if not self._normality_check_with_pos_tag(raw_word_vec):
                                continue

                            paragraph_output = None
                            # print('<>>>>>>>>before semantic ana')
                            # semantic analysis
                            if self._semantic_analysis:
                                semantic_tree = self._trunk_extraction(raw_word_vec)
                                features = SentenceTreeFeatureScanner(semantic_tree).feature_extract_aggregate()
                                # print(features)
                                # print('-----------------------------------')
                                vectorized_words_and_label = self._word_scan(
                                    raw_word_vec, current_label, self._strigent_topic, semantic_tree
                                )

                                if len(vectorized_words_and_label) == 0:
                                    continue
                                # emphasize important words
                                if features['most_important_noun'] in vectorized_words_and_label[0].keys():
                                    vectorized_words_and_label[0][features['most_important_noun']] *= EXAGERATE_COEF
                                if features['most_important_verb'] in vectorized_words_and_label[0].keys():
                                    vectorized_words_and_label[0][features['most_important_verb']] *= EXAGERATE_COEF
                                if features['most_important_adjective'] in vectorized_words_and_label[0].keys():
                                    vectorized_words_and_label[0][features['most_important_adjective']] *= EXAGERATE_COEF
                                if features['most_important_adverb'] in vectorized_words_and_label[0].keys():
                                    vectorized_words_and_label[0][features['most_important_adverb']] *= EXAGERATE_COEF
                                del features["most_important_noun"]
                                del features["most_important_verb"]
                                del features["most_important_adjective"]
                                del features["most_important_adverb"]
                            
                                paragraph_output = (
                                    {**vectorized_words_and_label[0], **features},
                                    vectorized_words_and_label[1]
                                )
                                # print(paragraph)
                                # print("---------------ok------------")
                            else:
                                paragraph_output = self._word_scan(
                                    raw_word_vec, current_label, self._strigent_topic
                                )

                            # if len(paragraph_output) == 0:
                            if len(paragraph_output) == 0:
                                continue
                            else:
                                if paragraph_output[0] == {}:
                                    continue
                                
                                if self._multiple_paragraphs:
                                    if same_topic_BOW:
                                        # combine paragraphs in same topic as one clause
                                        same_topic_BOW = [update_dict_by_accumulate(
                                            same_topic_BOW[0],
                                            paragraph_output[0]
                                        )] + [paragraph_output[1]]

                                    else:
                                        same_topic_BOW = paragraph_output
                                else:
                                    # for word in paragraph_output[0].split(' '):
                                    #   if len(word) > 30:
                                    derived_observations.append(
                                        paragraph_output    
                                    )
                                    topic_file_pointer.append(
                                        paragraph_output + \
                                            (
                                                current_label,
                                                os.path.basename(self._file_path),
                                            )
                                    )
                                    # for tfidf calculation
                                    tfidf_calculation_corpus.append(' '.join(
                                        [k for k in paragraph_output[0]]
                                    ))
                                    tfidf_calculation_topic.append(paragraph_output[1])
                if end_of_legal_body:
                    break

            if self._embedding_method == 'tfidf':
                derived_observations = []
                vectorizer = TfidfVectorizer()
                tfidf_mat = vectorizer.fit_transform(
                    tfidf_calculation_corpus).toarray()
                words_for_tfidf_mat = vectorizer.get_feature_names()
                # pd.DataFrame(tfidf_mat)
                for i in range(tfidf_mat.shape[0]):
                    derived_observations.append([
                        dict(zip(words_for_tfidf_mat, tfidf_mat[i])), 
                        tfidf_calculation_topic[i]
                    ])


        except Exception as e:
            logger.error(
                "{0}\n Some error happen in preprocessing \n{1}".format(
                    self._file_path,
                    e.args[0]
                )
            )

        if len(derived_observations) == 0:
            logger.error(self._file_path+"\n Empty")

        return {
            'derived_observations': derived_observations,
            'topic_file_pointer': topic_file_pointer
        }