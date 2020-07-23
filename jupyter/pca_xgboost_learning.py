import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
import xgboost as xgb
import json
from google_word2vec.stats_kitchen import PCA
def data_shuffle(original_formatted_data):
    features = pd.DataFrame([x[0] for x in original_formatted_data])
    target = np.array([x[1] for x in original_formatted_data])
    del original_formatted_data
    target = np.array([np.where(np.array(sorted(set(target)))==y)[0][0] for y in target])
    features.columns = np.array(range(0, features.shape[1])).astype(str)
    features.replace(np.nan, 0, inplace=True)
    features = features.apply(lambda x:x.astype(int))
    features = features.loc[:, features.apply(lambda x: sum(x!=0) > 1, axis=0)]
    return features.values, target

target_input = '/home/vagrant/sync/testfield/training_ingredients/20200702033913.txt'
# target_input = '/home/vagrant/sync/testfield/training_ingredients/20200616122637.txt'
json_string = open(target_input, 'r').read()
data = json.loads(json_string)
features, target = data_shuffle(data)
X_train, X_test, y_train, y_test = train_test_split(features, target, test_size=0.33, random_state=42)
# model = xgb.XGBRegressor(
#     # tree_method='gpu_hist', gpu_id=0,
#     objective="multi:softprob", random_state=42, num_class=54,
#     max_depth=2, nthread=-1)
# # xgb_param = self._model.get_xgb_params()
# # xgb_param['num_class'] = 61
# # features, target = self._data_shuffle(train_data)
# print("Training start...")
# model.fit(X_train, y_train)
X_train
eigvals, eigvecs = PCA(X_train)
