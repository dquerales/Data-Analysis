# -*- coding: utf-8 -*-
"""
Created on Sun Mar  5 15:06:01 2023

@author: Daniel
"""
# import xgboost as xgb
import streamlit as st
# import pandas as pd
# import numpy as np
import joblib


#load model
model = joblib.load(open('Models/pipe_clf_model_checkpoint.joblib', 'rb'))
model_clf = model['pipeline_clf']


st.title('Sentiment Analysis')

text = st.text_input('Write your text review:')


if st.button('Predict Sentiment'):
    prediction = model_clf.predict([text])

    if prediction == 1:
        output = 'Good'
    else:
        output = 'Bad'
        
    st.success(f'The predicted sentiment is {output}')

with st.sidebar:
    st.subheader('About')
    st.markdown('This webapp was made by Daniel Querales (d.querales@gmail.com) using **Streamlit**')
st.sidebar.image('https://streamlit.io/images/brand/streamlit-mark-color.png', width=50)
