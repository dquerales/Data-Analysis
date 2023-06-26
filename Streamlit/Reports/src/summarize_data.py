import pandas as pd
import numpy as np

def prepare_dataframe(dataframe):
  df = dataframe.copy()
  df.columns = df.columns.str.upper().str.replace(' ', '_')
  df = df.infer_objects()
  return df

def get_summarize(dataframe):
    df = dataframe.copy()
    num_rows = len(df)
    num_cols = len(df.columns)
    missing_cells = df.isna().sum().sum()
    total_cells = num_rows*num_cols
    percentage_missing_cells = (missing_cells/total_cells)*100
    datetime_features = len(df.select_dtypes(include='datetime').columns)
    num_numeric_features = len(df.select_dtypes(include='number').columns)
    num_categorical_features = len(df.select_dtypes(include='object').columns)
    summary_df = pd.DataFrame({'rows': num_rows,
                               'columns': num_cols,
                               'total_cells':total_cells,
                               'missing_cells': missing_cells,
                               'percentage_missing_cells': percentage_missing_cells,
                               'datetime_features': datetime_features,
                               'numerical_features': num_numeric_features,
                               'categorical_features': num_categorical_features}, index=["values"]).T.reset_index()
    #summary_df.to_csv('reports/data-summarize.csv', float_format='%.2f')
    return summary_df

def get_missing_uniques(dataframe):
    df = dataframe.copy()
    count_values = df.notna().sum()
    unique_values = df.nunique()
    percentage_unique_values = unique_values/len(df)*100
    missing_values = df.isna()
    missing_value_counts = missing_values.sum()
    percentage_missing_values = missing_value_counts/len(df)*100
    data_types = df.dtypes
    miss_df = pd.DataFrame({'variable': df.columns,
                            'data_type':data_types,
                            'count': count_values,
                            'unique_values':unique_values,
                            'percentage_unique_values':percentage_unique_values,
                            'empty_cells': missing_value_counts,
                            'percentage_empty_cells': percentage_missing_values}).reset_index(drop=True)
    miss_df = miss_df[['variable', 'count', 'empty_cells', 'percentage_empty_cells']]
    #miss_df.to_csv('reports/data-missing-uniques.csv', float_format='%.2f', index=False)
    return miss_df

def get_max_min_dates(df, datetime_features = None):
  if datetime_features:
    for feature in datetime_features:
      df[feature] = pd.to_datetime(df[feature], errors='coerce')
  else:
    datetime_features = len(df.select_dtypes(include='datetime').columns)
  max_dates = df[datetime_features].max()
  min_dates = df[datetime_features].min()
  result = pd.DataFrame({"datetime_feature":datetime_features, "min_date": min_dates, "max_date": max_dates}).reset_index(drop=True)
  #result.to_csv('reports/data-datetimes.csv')
  return result

def describe_categorical(dataframe):
  df = dataframe.copy()
  dtypes = df.dtypes
  categorical_columns = [column for column in dtypes.index if dtypes[column] == 'object']
  categorical_describe = df[categorical_columns].describe(include='object').T.rename_axis('variable').reset_index()
  #categorical_describe.to_csv('reports/data-categorical-describe.csv', float_format='%.2f', index=False)
  return(categorical_describe)

def describe_numerical(dataframe):
  df = dataframe.copy()
  dtypes = df.dtypes
  numerical_columns = [column for column in dtypes.index if dtypes[column] != 'object']
  numerical_describe = df[numerical_columns].describe().T.rename_axis('variable').reset_index()
  numerical_describe = numerical_describe[['variable','count', 'mean', 'min', 'max']]
  #numerical_describe.to_csv('reports/data-numerical-describe.csv', float_format='%.2f', index=False)
  return(numerical_describe)

def get_overview(dataframe, datetime_features = None):
    df = dataframe.copy()
    df = prepare_dataframe(df)
    try:
      get_max_min_dates(df, datetime_features)
    except:
      pass
    get_summarize(df)
    get_missing_uniques(df)
    describe_categorical(df)
    describe_numerical(df)
    print('data overview completed!')