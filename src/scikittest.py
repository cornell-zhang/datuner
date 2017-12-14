import sqlite3
import matplotlib.pyplot as plt
import numpy as np
from sklearn import datasets, linear_model
from sklearn.linear_model import ElasticNet
from sklearn.metrics import mean_squared_error, r2_score


dbtablename = 'bram_test'
dbconn = sqlite3.connect('results' + '.db')
c = dbconn.cursor()

# Load the dataset
data = []
target = []
for result in c.execute('SELECT * FROM ' + dbtablename + ' ORDER BY sweepparam'):
    sweepparam = result[0]
    slack = result[1]
    comb_alut = result[2]
    mem_alut = result[3]
    reg = result[4]
    bram = result[5]
    dsp = result[6]
    data.append([sweepparam])
    target.append(bram)

# Create linear regression object
#regr = linear_model.LinearRegression()
regr = ElasticNet(random_state=0)

# Train the model using the training sets
regr.fit(data, target)

# Make predictions using the testing set
target_pred = regr.predict(data)

# The coefficients
print('Coefficients: \n', regr.coef_)
# The mean squared error
print("Mean squared error: %.2f"
      % mean_squared_error(target, target_pred))
# Explained variance score: 1 is perfect prediction
print('Variance score: %.2f' % r2_score(target, target_pred))

# Plot outputs
plt.scatter(data, target,  color='black')
plt.plot(data, target_pred, color='blue', linewidth=3)

plt.xlabel('Bitwidth')
plt.ylabel('Resource Usage')

plt.show()