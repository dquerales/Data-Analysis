import streamlit as st
import pandas as pd
import numpy as np
import joblib
import config

# load model
#model = joblib.load('model.joblib')
features = config.features

def predict(input):
    predictions = model.predict(input)

st.title('Classifier')

passengerid = st.text_input("Input Passenger ID", '123456') 
pclass = st.selectbox("Choose class", [1,2,3])
name  = st.text_input("Input Passenger Name", 'John Smith')
sex = st.selectbox("Choose sex", ['male','female'])
age = st.slider("Choose age",0,100)
sibsp = st.slider("Choose siblings",0,10)
parch = st.slider("Choose parch",0,2)
ticket = st.text_input("Input Ticket Number", "12345") 
fare = st.number_input("Input Fare Price", 0,1000)
cabin = st.text_input("Input Cabin", "C52") 
embarked = st.select_slider("Did they Embark?", ['S','C','Q'])

row = np.array([passengerid, pclass, name, sex, age, sibsp, parch, ticket, fare, cabin, embarked]) 
input = pd.DataFrame([row], columns = features)

if st.button('Predict', use_container_width=True):
    prediction = predict(input)