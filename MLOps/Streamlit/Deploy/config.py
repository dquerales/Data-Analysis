features = ["passengerid", "pclass", "name", "sex", "age", "sibsp", "parch", "ticket", "fare", "cabin", "embarked"]
targets = ["survived"] 
model_type = "logistic_regression"
target_mapping = {"not survived": 0, "survived": 1}