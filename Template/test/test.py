import os; os.chdir('..')

try:
    %run 'notebooks/1.0-data_download.ipynb'
except:
    print('cant load notebook')
    pass

