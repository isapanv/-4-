import pandas as pd
import numpy as np
data = pd.read_csv("demodata.csv")
print(type(data))
#data.shape()
print(data.head(7))
print(data.tail(5))
print(data.info())
print(data.describe())
#print(data.columns())
d1 = data[["weekdays", "date"]]
print(d1)
print(data.iloc[1:3])
print(data.loc[1:3])
print(data['gains']<0)
#print(data[(data.weekdays == "Wed" & (data.up))]<0) #brackets are necsecary
print(data.query('weekdays == "Wed" and up'))
fl = data["weekdays"].map(lambda x: x=="Wed")
print(data[fl])
print(data.sample(n=3));
print(data.sample(n=3));
print(data.sample(frac=0.3));
print(data["prices"].hist());
print(data["prices"].mean());
print(data["prices"].quantile(1/4));


titanic = pd.read_csv('titanic.csv')
print(titanic.info())
print(titanic.describe())
print(titanic.head())
relatives = titanic['SibSp']
titanic['relatives'] = relatives
print(titanic.head())
surv = titanic.pivot_table()
print(len(titanic[(titanic['Sex']  == 'female') & (titanic['Survived'] == 1)].count()))
print(len(titanic[(titanic['Sex']  == 'male') & (titanic['Survived'] == 1)].count()))

print(titanic.info())
print(titanic.head())
arr = titanic[440:451:2]
print(arr[['Age', 'Sex']])
p564 = titanic[titanic['PassengerId'] == 564]
p442 = titanic[titanic['PassengerId'] == 442]
print(p564)
print(p442)
print(p564[['Name', 'Sex']])
print(p442[['Name', 'Sex']])

print(titanic[titanic['Survived'] == 0].head(5))

print(titanic['Pclass'].value_counts())
titanic.loc[titanic['Pclass'] == 1, 'Pclass']= 'Элита'
titanic.loc[titanic['Pclass'] == 2, 'Pclass']= 'Средний класс'
titanic.loc[titanic['Pclass'] == 3, 'Pclass']= 'Работяги'
print(titanic['Pclass'].value_counts())
titanic['Fare_bin'] = np.where(titanic['Fare']<20, 'Дешево', 'Дорого')
print(titanic[['Fare', 'Fare_bin']])
