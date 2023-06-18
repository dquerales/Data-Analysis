import streamlit as st
import pandas as pd
import pandas_profiling
from streamlit_pandas_profiling import st_profile_report
import os 

if os.path.exists('./dataset.csv'): 
    df = pd.read_csv('dataset.csv', index_col=None)

with st.sidebar: 
    st.title("Explore")
    choice = st.radio("Navigation", ["Upload","Profiling"])
    st.markdown('Made by [Daniel Querales](https://www.linkedin.com/in/danielquerales/)')

if choice == "Upload":
    st.title("Upload Your Dataset")
    file = st.file_uploader("Upload Your Dataset")
    if file: 
        df = pd.read_csv(file, index_col=None)
        df.to_csv('dataset.csv', index=None)
        st.dataframe(df)
        col1, col2 = st.columns(2)
        col1.metric('Rows', df.shape[0])
        col2.metric('Columns', df.shape[1])

if choice == "Profiling": 
    st.title("Exploratory Data Analysis (EDA)")
    profile_df = df.profile_report()
    st_profile_report(profile_df)
    export = profile_df.to_html()
    st.download_button(label="Download Report", data=export, file_name='profile_report.html', use_container_width=True)