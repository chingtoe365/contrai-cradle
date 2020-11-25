import os
import pandas as pd
import numpy as np
import xgboost as xgb
from xgboost import plot_tree
from xgboost import plot_importance
from nltk.metrics.scores import (
    precision, recall, f_measure, accuracy
)
from sklearn.model_selection import KFold


from contrai_cradle.learning import MLAbstract

class XGBoostClassifying(MLAbstract):
    """
    X Gradient Boosting
    """
    _model_type = "Extreme Gradient Boosting"
    _parameters = ""
    _parametric = False
    _plot_tree = True
    _feature_map_path = os.path.join(
        os.getcwd(),
        TRAINING_INGREDIENT_PATH,
        'feature_map.txt'
    )
    _tree_figure_savepath = os.path.join(
        os.getcwd(),
        'results/summary/tree.png'
    )
    _importance_figure_savepath = os.path.join(
        os.getcwd(),
        'results/summary/importance.png'
    )

    def _data_shuffle(self, original_formatted_data):
        def space_concat(x):
            return ' '.join(x)

        features = pd.DataFrame([x[0] for x in original_formatted_data])
        target = np.array([x[1] for x in original_formatted_data])
        target = np.array([np.where(np.array(sorted(set(target))) == y)[0][0] for y in target])
        # convert output to one-hot vectors
        z = np.zeros((target.size, target.max() + 1))
        z[np.arange(target.size), target] = 1
        feature_map = pd.DataFrame({
            'ind': [str(y) for y in range(0, features.shape[1])],
            'fname': features.columns.map(lambda x: '_'.join(x.split(' '))),
            'ftype': ['q'] * features.shape[1]
        })
        feature_map_file_txt = '\n'.join(feature_map.apply(space_concat, axis=1))
        f = open(self._feature_map_path, "w")
        f.write(feature_map_file_txt)
        f.close()
        features.columns = np.array(range(0, features.shape[1])).astype(str)
        features.replace(np.nan, 0, inplace=True)
        features = features.apply(lambda x: x.astype(int))
        # filter features that contain too much zeros (only appearing in one document)
        features = features.loc[:, features.apply(lambda x: sum(x > 0) > 1, axis=0)]
        # return features, z
        return features, target

    def _train(self, features, target, class_num):
        # self._model = SklearnClassifier()
        # self._model = xgb.XGBRegressor(
        self._model = xgb.XGBClassifier(
            # tree_method='gpu_hist', gpu_id=0,
            objective="multi:softmax", random_state=42, num_class=class_num)
        # xgb_param = self._model.get_xgb_params()
        # xgb_param['num_class'] = 61
        # features, target = self._data_shuffle(train_data)
        print("Training start...")
        self._model.fit(features, target)

    def _test(self, features, target, sample_type):
        if sample_type == 'train':
            predictions = self._model.predict(features)
            self._accuracy_train = accuracy(target, predictions)
            self._train_true_positive_num = sum(np.array(target) != -1)
            self._precision_train = 0
            self._recall_train = 0
            self._f_measure_train = 0
        elif sample_type == 'test':
            predictions = self._model.predict(features)
            self._accuracy_test = accuracy(target, predictions)
            self._test_true_positive_num = sum(np.array(target) != -1)
            self._precision_test = 0
            self._recall_test = 0
            self._f_measure_test = 0

    def cross_validation(self):
        accuracy_train_sum = 0
        accuracy_test_sum = 0
        kfold = KFold(n_splits=self._k, shuffle=True, random_state=42)
        scores = []
        X, y = self._data_shuffle(self._observation)
        # class_num = y.shape[1]
        class_num = len(set(y))
        for train_index, test_index in kfold.split(X):
            X_train, X_test = X.loc[train_index], X.loc[test_index]
            y_train, y_test = y[train_index], y[test_index]
            before = time.time()
            self._train(X_train, y_train, class_num)
            after = time.time()
            print("One XGBoost model trained with time in {} seconds".format(str(after - before)))
            self._test(X_train, y_train, 'train')
            self._test(X_test, y_test, 'test')
            print("testing accruracy: {}".format(str(self._accuracy_test)))
            accuracy_train_sum += self._accuracy_train
            accuracy_test_sum += self._accuracy_test

            if self._plot_tree:
                # fig = plt.gcf()
                # fig.set_size_inches(300, 200)
                # fig.set_size_inches(16, 8)
                fig_tree = plot_tree(self._model, fmap=self._feature_map_path)
                # # fig.show()
                # # f = open(self._tree_figure_savepath, 'wb')
                fig_tree.figure.savefig(self._tree_figure_savepath, dpi=300)
                # fig1 = plt.gcf()
                # fig1.set_size_inches(300, 200)
                # plot_importance(self._model, fmap=self._feature_map_path)
                fig_imp = plot_importance(
                    self._model,
                    max_num_features=50
                    # fmap=self._feature_map_path
                )
                # fig1.show()
                # f1 = open(self._importance_figure_savepath, 'wb')
                fig_imp.figure.savefig(self._importance_figure_savepath, dpi=300)
                break

        self._accuracy_train = accuracy_train_sum / self._k
        self._accuracy_test = accuracy_test_sum / self._k
