__doc__ = """
"""
import re

class SentenceTreeFeatureScanner():
    """
    This class extract features from a sentence tree structure
    """
    def __init__(self, tree):
        self._tree = tree

    def feature_extract_aggregate(self):
        return {
            'np_max' : self._extract_trunk_max_length('NP'),
            'vp_max' : self._extract_trunk_max_length('VP'),
            'pp_max' : self._extract_trunk_max_length('PP'),
            'clause_max' : self._extract_trunk_max_length('CLAUSE'),
            'np_min' : self._extract_trunk_min_length('NP'),
            'vp_min' : self._extract_trunk_min_length('VP'),
            'pp_min' : self._extract_trunk_min_length('PP'),
            'clause_min' : self._extract_trunk_min_length('CLAUSE'),
            'most_important_noun': self._get_most_important_noun(),
            'most_important_verb': self._get_most_important_verb(),
            'most_important_adjective': self._get_most_important_adjective(),
            'most_important_adverb': self._get_most_important_adverb()
        }
        
    def _extract_trunk_max_length(self, chunk_type):
        max_len = 0
        for subtree in self._tree.subtrees():
            if len(re.findall(chunk_type, str(subtree))) == 1 and \
                subtree.label() == chunk_type:
                if len(subtree) > max_len:
                    max_len = len(subtree)
        return max_len

    def _extract_trunk_min_length(self, chunk_type):
        min_len = 10
        for subtree in self._tree.subtrees():
            if len(re.findall(chunk_type, str(subtree))) == 1 and \
                subtree.label() == chunk_type:
                if len(subtree) < min_len:
                    min_len = len(subtree)
        return min_len

    def _extract_chunk_combination(self, combination):
        pass

    def _get_most_important_noun(self):
        """
        Important in the sense that
        it is the last noun of first NP of first clause
        """
        for subtree in self._tree.subtrees():
            if subtree.label() == 'CLAUSE':
                for subsubtree in subtree.subtrees():
                    if subsubtree.label() == 'CLAUSE':
                        continue
                    if len(re.findall('NP', str(subsubtree))) == 1:
                        imp_n = subsubtree[-1][0]
                        self._most_important_noun_index_within_clause = \
                            [w[0] for w in subtree.leaves()].index(imp_n)
                        return imp_n
        return ''

    def _get_most_important_verb(self):
        """
        Important in the sense that
        it is the last verb of first VP of first clause
        """
        for subtree in self._tree.subtrees():
            if subtree.label() == 'CLAUSE':
                for subsubtree in subtree.subtrees():
                    if subsubtree.label() == 'CLAUSE':
                        continue
                    if len(re.findall('VP', str(subsubtree))) == 1:
                        imp_v = subsubtree[-1][0]
                        self._most_important_verb_index_within_clause = \
                            [w[0] for w in subtree.leaves()].index(imp_v)
                        return imp_v
        return ''

    def _get_most_important_adjective(self):
        """
        Important in the sense that
        it is closest adjective to the most important noun
        in the same CLAUSE
        """
        for subtree in self._tree.subtrees():
            if subtree.label() == 'CLAUSE':
                for subsubtree in subtree.subtrees():
                    if subsubtree.label() == 'CLAUSE':
                        continue
                    if len(re.findall('NP', str(subsubtree))) == 1:
                        count = 0
                        candidates = {} 
                        for w_tuple in subsubtree.leaves():
                            if w_tuple[1] == 'JJ':
                                proximity = abs(count - \
                                    self._most_important_noun_index_within_clause)
                                candidates[w_tuple[0]] = proximity
                            count += 1
                        if len(candidates.keys()) != 0:
                            return sorted(candidates.items(), key=lambda x: x[1])[0][0]
        return ''

    def _get_most_important_adverb(self):
        """
        Important in the sense that
        it is closest adverb to the most important verb
        """
        for subtree in self._tree.subtrees():
            if subtree.label() == 'CLAUSE':
                for subsubtree in subtree.subtrees():
                    if subsubtree.label() == 'CLAUSE':
                        continue
                    if len(re.findall('VP', str(subsubtree))) == 1:
                        count = 0
                        candidates = {} 
                        for w_tuple in subsubtree.leaves():
                            if w_tuple[1] == 'RB':
                                proximity = abs(count - \
                                    self._most_important_verb_index_within_clause)
                                candidates[w_tuple[0]] = proximity
                            count += 1
                        if len(candidates.keys()) != 0:
                            return sorted(candidates.items(), key=lambda x: x[1])[0][0]
        return ''