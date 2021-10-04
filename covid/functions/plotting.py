import numpy as np
from numpy import log
import pandas as pd
import sqlalchemy
from .db_password import password
from datetime import date
import scipy
from scipy import signal
import matplotlib.pyplot as plt


# Plotting 7 day avg
def seven_day_moving_avg(): 
    engine = sqlalchemy.create_engine(f"mysql+pymysql://root:{password}@localhost:3306/covid")
    sql_script = "SELECT * FROM province_7day_avg"
    df = pd.read_sql(sql_script, engine)

    plt.figure(figsize=(16,8))
    for col in df.columns[1:]:
        plt.plot(df.date, df[col], label=col)
    plt.legend()
    plt.title("7 Day Moving Average for Active Cases")
    plt.xlabel("Date")
    plt.ylabel("7 Day Moving Average")
    plt.show()


def create_covid_plot(data):
    prov = ['AB', 'BC', 'MB', 'NB', 'NL', 'NS', 'NU', 'NWT', 'ONT', 'PEI',
            'QC', 'SA', 'YU']
    engine = sqlalchemy.create_engine(f"mysql+pymysql://root:{password}@localhost:3306/covid")
    df = pd.read_sql(f"SELECT * FROM province_{data}_joined", engine)
    x = df.date
    y = df[prov]
    plt.figure(figsize=(16,7))
    plt.plot(x, y, label=prov)
    plt.legend(loc = 'best')
    plt.xlabel("Date") 
    plt.ylabel(f"Cumulative {data}")
    plt.title(f"Provinces Cumulative {data}")
    plt.show()


def create_covid_plot(data):
    prov = ['AB', 'BC', 'MB', 'NB', 'NL', 'NS', 'NU', 'NWT', 'ONT', 'PEI',
            'QC', 'SA', 'YU']
    engine = sqlalchemy.create_engine(f"mysql+pymysql://root:{password}@localhost:3306/covid")
    df = pd.read_sql(f"SELECT * FROM province_{data}_joined", engine)
    x = df.date
    y = df[prov]
    plt.figure(figsize=(16,7))
    plt.plot(x, y, label=prov)
    plt.legend(loc = 'best')
    plt.xlabel("Date") 
    plt.ylabel(f"Cumulative {data}")
    plt.title(f"Provinces Cumulative {data}")
    plt.show()

# Plotting log scaled cumulative cases
def create_log_plot(data):
    prov = ['AB', 'BC', 'MB', 'NB', 'NL', 'NS', 'NU', 'NWT', 'ONT', 'PEI',
            'QC', 'SA', 'YU']
    engine = sqlalchemy.create_engine(f"mysql+pymysql://root:{password}@localhost:3306/covid")
    df = pd.read_sql(f"SELECT * FROM province_{data}_joined", engine)
    plt.figure(figsize=(16,7))
    for col in df.columns[1:]:
        name = f"{col}_scaled"
        df[name] = log(df[col])
    for col in df.columns:
        if '_scaled' in col:
            plt.legend(loc = 'upper left')
            plt.xlabel("Date")
            plt.ylabel(f"Normalized Cumulative {data} (log)")
            plt.plot(df.date, df[col], label=col)
            plt.title(f"Provinces Normalized {data} (log)")  
    plt.show()

def create_vaccine_vs_plot(province):
    engine = sqlalchemy.create_engine(f"mysql+pymysql://root:{password}@localhost:3306/covid")
    df_avg = pd.read_sql("SELECT * FROM province_7day_avg", engine)
    df_vac = pd.read_sql("SELECT * FROM province_7day_avg_vac", engine)
    if province == "Canada":
        df_avg["Canada_A"] = df_avg.sum(axis=1)
        df_vac["Canada_v"] = df_vac.sum(axis=1)
        main = df_avg.merge(df_vac, on='date')
        fig, ax1 = plt.subplots(figsize=(16,7))
        x1 = main.date
        y1 = main["Canada_A"]
        y2 = main["Canada_v"]
        ax2 = ax1.twinx()
    else:
       df_avg[f"{province}_A"] = df_avg[f"{province}"]
       df_vac[f"{province}_v"] = df_vac[f"{province}"]
       main = df_avg.merge(df_vac, on='date')
       fig, ax1 = plt.subplots(figsize=(16,7))
       x1 = main.date
       y1 = main[f"{province}_A"]
       y2 = main[f"{province}_v"]
       max = scipy.signal.find_peaks(y1)
       ax2 = ax1.twinx()


    ax1.plot(x1, y1, label = "Active Cases" , color="green")
    ax1.set_xlabel("Date", fontsize = 14)
    ax1.set_ylabel("Active Cases", color="green", fontsize = 14)
    ax2.plot(x1, y2, color="red")
    ax2.set_ylabel("Vaccine Administered", color="red", fontsize = 14)

    plt.title(f"Vaccine Administered vs Active Cases ({province})", fontsize = 20)
    plt.show()
    