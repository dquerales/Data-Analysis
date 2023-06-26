import streamlit as st
import pandas as pd
import pandas_profiling
from streamlit_pandas_profiling import st_profile_report
from src.summarize_data import get_summarize, get_missing_uniques, describe_categorical, describe_numerical, get_max_min_dates
import os 
import plotly.express as px

if os.path.exists('./dataset.csv'): 
    df = pd.read_csv('dataset.csv', index_col=None)

with st.sidebar: 
    st.title("Explore")
    choice = st.radio("Navigation", ["Upload", "LaTeX", "Profiling", "Target"])
    st.markdown('Made by [Daniel Querales](https://www.linkedin.com/in/danielquerales/)')

if choice == "Upload":
    st.title("Upload Your Dataset")
    file = st.file_uploader("Upload Your Dataset")
    if file: 
        df = pd.read_csv(file, index_col=None)
        df.to_csv('dataset.csv', index=None)
        st.dataframe(df)

def convert_df(df):
    df = df.replace('_','\_', regex=True)   #latex
    df = df.replace('[#,@,&,%]', '', regex=True)	
    return df.to_csv(float_format='%.2f', index=False).encode('utf-8')

if choice == "LaTeX":
    st.title('LaTeX')
    st.header('Summarize')
    summ = get_summarize(df)
    st.dataframe(summ, use_container_width=True)
    st.download_button(label="Download", data=convert_df(summ), file_name='data-summarize.csv', use_container_width=True)
	
    st.header('Missing Values')
    miss = get_missing_uniques(df)
    st.dataframe(miss, use_container_width=True)
    st.download_button(label="Download", data=convert_df(miss), file_name='data-missing-uniques.csv', use_container_width=True)

    st.header('Datetime Features')
    datetime_features = st.multiselect('convert to datetime features', df.columns)	
    try:
    	dates = get_max_min_dates(df, datetime_features)
    	st.dataframe(dates, use_container_width=True)
    	st.download_button(label="Download", data=convert_df(dates), file_name='data-datetimes.csv', use_container_width=True)
    except:
    	pass

    st.header('Categorical Features')
    select_ids = st.multiselect('convert to object type', df.columns)
    for col in select_ids:
    	df[col] = df[col].astype(str)
    des_cat = describe_categorical(df)
    st.dataframe(des_cat, use_container_width=True)
    st.download_button(label="Download", data=convert_df(des_cat), file_name='data-categorical-describe.csv', use_container_width=True)

    st.header('Numerical Features')
    add_numerical = st.multiselect('convert to numeric type', df.columns)
    for col in add_numerical:
    	df[col] = pd.to_numeric(df[col], errors='coerce')
    des_num = describe_numerical(df)
    st.dataframe(des_num, use_container_width=True)
    st.download_button(label="Download", data=convert_df(des_num), file_name='data-numerical-describe.csv', use_container_width=True)

if choice == "Profiling": 
    st.title("Exploratory Data Analysis (EDA)")
    profile_df = df.profile_report()
    st_profile_report(profile_df)
    export = profile_df.to_html()
    st.download_button(label="Download Report", data=export, file_name='profile_report.html', use_container_width=True)

if choice == "Target":
    with st.form('bar_chart'):
        selected_target = st.selectbox(label='target', options=df.columns)
        selected_time = st.selectbox(label='datetime feature', options=df.columns)
        submitted = st.form_submit_button('Submit')
        
        if submitted:
            df[selected_time] = pd.to_datetime(df[selected_time], errors='coerce')
            start_date = st.date_input("Start date", value=df[selected_time].min())
            end_date = st.date_input("End date", value=df[selected_time].max())
            filtered_df = df.loc[(df[selected_time] >= str(start_date)) & (df[selected_time] <= str(end_date))]
            
            values_df = pd.concat([filtered_df[selected_target].value_counts(), filtered_df[selected_target].value_counts(normalize=True)], axis=1, keys=('count','percentage'))
            st.dataframe(values_df, use_container_width=True)
            
            labels = filtered_df[selected_target].value_counts().index
            values = filtered_df[selected_target].value_counts().values
            pie_fig = px.pie(filtered_df, values=values, labels=labels, title=selected_target)
            st.plotly_chart(pie_fig)
            
            line_fig = px.histogram(filtered_df, x=selected_time, color= selected_target, barmode="group", title=selected_target)
            st.plotly_chart(line_fig) 
                         

              