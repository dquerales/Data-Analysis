import streamlit as st
import pandas as pd
import plotly.express as px

st.title('Dashboard')
st.markdown('This is a dashboard')

st.subheader('Summary statistics')
df = pd.read_csv('avocado.csv')
st.dataframe(df.head(5))

col1, col2 = st.columns(2)
col1.metric('Rows', df.shape[0])
col2.metric('Columns', df.shape[1])

st.subheader('Overview')

st.dataframe(df.describe())

st.header('Line chart by geographies')

with st.form('line_chart'):
    selected_geography = st.selectbox(label='Geography', options=df['geography'].unique())
    submitted = st.form_submit_button('Submit')
    if submitted:
        filtered_avocado = df[df['geography'] == selected_geography]
        line_fig = px.line(filtered_avocado,
                            x='date', y='average_price',
                            color='type',
                            title=f'Avocado Prices in {selected_geography}')
        st.plotly_chart(line_fig)

with st.sidebar:
    st.subheader('About')
    st.markdown('This dashboard is made by Daniel Querales, using **Streamlit**')
st.sidebar.image('https://streamlit.io/images/brand/streamlit-mark-color.png', width=50)

