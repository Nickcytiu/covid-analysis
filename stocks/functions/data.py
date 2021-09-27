import time
from alpha_vantage.timeseries import TimeSeries
import sqlalchemy
import os
import pandas as pd
from .secrets import password, api_key
from pandas.core.tools.datetimes import to_datetime

engine = sqlalchemy.create_engine(f"mysql+pymysql://root:{password}@localhost:3306/covid")

# Writing dataframe to SQL

def write_to_db(stock_list, industry, root_path):
    full_path = os.path.join(root_path, industry)
    if not os.path.exists(full_path):
        os.makedirs(full_path)
        
    tables = []

    for stock in stock_list:
        
        ts = TimeSeries(key = api_key, output_format = 'pandas')
        df, meta_data = ts.get_daily(symbol=stock, outputsize='full')
        df.columns = [col.split(" ")[1] for col in df.columns]
        
        table_name = f"stocks_{stock}"
        print(f"Writing {stock} data to CSV and DB via {table_name}")
        df.to_csv(os.path.join(full_path, table_name + '.csv'))
        
        df.to_sql(table_name, engine, if_exists='replace')
        tables.append(df)
        time.sleep(12)

    return tables

def make_industry_table(tables, stock_list, industry, date_cutoff='2020-01-01'):
    
    table_stock = zip(tables, stock_list)
    series = []
    
    for t, s in table_stock:
        t = t['open']
        t = t.rename(s)
        series.append(t)
             
    main = series[0]
    
    for t in series[1:]:
        main = pd.concat([main, t], join='inner', axis=1)
        
    main = main[main.index >= date_cutoff]
    main.sort_index(ascending=False, inplace=True)
    
    table_name = f"stock_joined_{industry}"
    print(f'Joining stocks in {industry} industry to {table_name} in db')
    main.to_sql(table_name, engine, if_exists='replace')

def write_csv_to_db():
    df = pd.read_csv("/Users/nicktiu/Desktop/Data Analytics/covid-analysis/stocks/stock_csv/VIX_History.csv")
    df["DATE"] = pd.to_datetime(df["DATE"], format="%m/%d/%Y")
    engine = sqlalchemy.create_engine(f"mysql+pymysql://root:{password}@localhost:3306/covid")
    df.to_sql("stocks_VIX", engine, if_exists='replace')
