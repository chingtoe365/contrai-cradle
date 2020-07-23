# Clustering inspection
# Author: Jintao Long <jintaolong@brookes.ac.uk>

__doc__ = """
    To learn clustering insight of datasets
"""


# import time
# import warnings

import numpy as np
import pandas as pd

import json
import os

from preprocessing import TRAINING_INGREDIENT_PATH
# import matplotlib.pyplot as plt

# from sklearn import cluster, datasets, mixture
from sklearn.mixture import GaussianMixture
# from sklearn.neighbors import kneighbors_graph
# from sklearn.preprocessing import StandardScaler
# from itertools import cycle, islice
# filename = '20200318150349.txt'
filename = '20200317150747.txt'
filepath = os.path.join(
    os.getcwd(),
    TRAINING_INGREDIENT_PATH,
    filename
)
json_string = open(filepath, 'r').read()
data = json.loads(json_string)
N_topic = 61
np.random.seed(1)
# g = mixture.GMM(n_components=N_topic)
g = GaussianMixture(
    n_components=N_topic,
    covariance_type='tied'
)
td = [x[0] for x in data]
df = pd.DataFrame(td)
td_array = df.values
word_order = list(df.columns)
del df
for i in range(td_array.shape[0]):
    td_array[i] = np.nan_to_num(td_array[i])
    # td_array[i] = td_array[i].astype(int)
g.fit(td_array)
g.predict(td_array)
import pdb; pdb.set_trace()  # breakpoint d3e99b1b //
