import sqlite3
import matplotlib.pyplot as plt
import numpy as np
import xgboost as xgb
from numpy import loadtxt
from xgboost import XGBClassifier
from sklearn import datasets, linear_model
from sklearn.linear_model import ElasticNet
from sklearn.metrics import mean_squared_error, r2_score
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

dbtablename = 'multiplier'
dbconn = sqlite3.connect('results' + '.db')
c = dbconn.cursor()

# Load the dataset
data_list = []
target_list = []
for result in c.execute('SELECT * FROM ' + dbtablename + ' ORDER BY sweepparam'):
    sweepparam = result[0]
    if sweepparam <= 128:
        slack = result[1]
        comb_alut = result[2]
        mem_alut = result[3]
        reg = result[4]
        bram = result[5]
        dsp = result[6]
        data_list.append([sweepparam])
        target_list.append(reg)

# load data
data = np.array(data_list)
target = np.array(target_list)
data_pred = []
for i in range(1, 128):
    data_pred.append([i])
#data = X
#target = Y

# Training set
train_X = data
train_Y = target
dtrain = xgb.DMatrix(train_X, label=train_Y.reshape(-1,1))

# Testing set
test_X = data
test_Y = target
dtest = xgb.DMatrix(test_X)

print data
print target
print data_pred

# XGBoost 1 (defaults with 50 trees) training
param = {'booster': 'gbtree', # gbtree, gblinear
         'eta': 0.1, # step size shrinkage
         #'gamma': 1, # min. loss reduction to make another partition
         #'min_child_weight': min_samples_leaf, # In regression, minimum number of instances required in a child node
         #'max_depth': max_depth,  # maximum depth of a tree
         #'lambda': 0.0, # L2 regularization term on weights, default 0
         #'lambda_bias': 0.0, # L2 regularization term on bias, default 0
         #'save_period': 0, # 0 means do not save any model except the final round model
         #'nthread': 1,
         #'subsample': subsample,
         'objective': 'reg:linear' # binary:logistic, reg:linear
         # 'eval_metric': the evaluation metric
         }
num_round = 50 # the number of round to do boosting, the number of trees
bst1 = xgb.train(param, dtrain, num_round)

# # fit model no training data
# model = XGBClassifier(learning_rate=0.1, gamma=0, reg_alpha=0, reg_lambda=1, objective='reg:linear')
# model.fit(data, target)
# # make predictions for test data
# target_pred = model.predict(data)
# predictions = [round(value) for value in target_pred]
# # evaluate predictions
# #accuracy = accuracy_score(target, predictions)
# #print("Accuracy: %.2f%%" % (accuracy * 100.0))

target_pred = bst1.predict(dtest)

# The mean squared error
print("Mean squared error: %.2f"
      % mean_squared_error(target, target_pred))
# Explained variance score: 1 is perfect prediction
print('Variance score: %.2f' % r2_score(target, target_pred))

# Plot outputs
#target_pred = model.predict(data_pred)
target_pred = bst1.predict(xgb.DMatrix(data_pred))
plt.scatter(data, target,  color='black')
plt.plot(data_pred, target_pred, color='blue', linewidth=3)

plt.xlabel('Bitwidth')
plt.ylabel('Resource Usage')

plt.show()