import streamlit as st
import pandas as pd
import numpy as np

# def predict(model, df):
#    predictions_data = predict_model(estimator = model, data = df)
#    return predictions_data['Label'][0]

st.title('Classifier Web App')
st.write('This is a web app to classify')


gender = st.selectbox(label='gender', options=['male', 'female'])
age = st.slider(label = 'age', min_value = 18, max_value = 80, value = 20, step = 1)
status = st.selectbox(label='status', options=['single', 'married', 'divorced'])
  
features = {'gender': gender, 'age': age, 'status': status}
features_df  = pd.DataFrame([features])                  

if st.button('Submit', use_container_width=True):
    st.table(features_df)  

if st.button('Predict', use_container_width=True):
    st.write('label')
    # prediction = predict(model, features_df)
    # st.write(' Based on feature values, your wine quality is '+ str(prediction))