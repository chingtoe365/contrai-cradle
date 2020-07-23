import nltk
from nltk.chunk.util import tree2conlltags,conlltags2tree
from nltk.tag import UnigramTagger, BigramTagger
from nltk.tag.api import TaggerI
from nltk.chunk import ChunkParserI

nltk.download('conll2000')
from nltk.corpus import conll2000
data= conll2000.chunked_sents()
train_data=data[:10900]
test_data=data[10900:]
# grammar = r"""
#     NP: {<DT|P.+>?<VB.>?<JJ>?<NN.?>+}
#         {<NNP>+}
#         {<NP><CC><NP>}
#         {<NP><PP>}
#     PP: {<IN|TO>+<NP|JJ>}
#         {<RB><JJ>}
#         {<PP><CC>?<PP>}
#     VP: {<MD>?<RB.?>?<VB.?>+<NP|PP|CLAUSE>?}
#     CLAUSE: {<NP><VP>}
#     """

# class RegexChunkParser(TaggerI):
#     def parse(self, sentence):
#         chunkParser =  nltk.RegexpParser(grammar, loop=100)
#         tree = chunkParser.parse(tagged)

# RegexChunkParser =  nltk.RegexpParser(grammar, loop=100)
# RegexChunkParser =  nltk.RegexpTagger(grammar)
def conll_tag_chunks(chunk_sents):
    tagged_sents = [tree2conlltags(tree) for tree in chunk_sents]
    return [[(t, c) for (w, t, c) in sent] for sent in tagged_sents]

def combined_tagger(train_data, taggers, backoff=None):
    for tagger in taggers:
        backoff = tagger(train_data, backoff=backoff)
    return backoff

#Define the chunker class
class NGramTagChunker(ChunkParserI):
    def __init__(self,train_sentences,tagger_classes=[UnigramTagger,BigramTagger]):
        train_sent_tags=conll_tag_chunks(train_sentences)
        self.chunk_tagger=combined_tagger(train_sent_tags,tagger_classes)
    def parse(self,tagged_sentence):
        if not tagged_sentence:
          return None
        pos_tags=[tag for word, tag in tagged_sentence]
        chunk_pos_tags=self.chunk_tagger.tag(pos_tags)
        chunk_tags=[chunk_tag for (pos_tag,chunk_tag) in chunk_pos_tags]
        wpc_tags=[(word,pos_tag,chunk_tag) for ((word,pos_tag),chunk_tag) in zip(tagged_sentence,chunk_tags)]
        return conlltags2tree(wpc_tags)
#train chunker model
ntc=NGramTagChunker(train_data)