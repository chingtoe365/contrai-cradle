__doc__ = '''
    Learning model metaclass
'''

class LearningModelMeta:
    """
    Metaclass for all learning models
    """
    def __new__(cls, preprocessing_id, topic, k):
        return super().__new__(cls)

    def __init__(self, preprocessing_id, topic, k):
        self._preprocessing_id = preprocessing_id
        self._topic = topic
        self._k = k
