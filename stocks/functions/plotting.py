import pandas as pd
import sqlalchemy
from .secrets import password
import matplotlib.pyplot as plt
from scipy import stats

def create_inter_industry_plot():   
    engine = sqlalchemy.create_engine(f"mysql+pymysql://root:{password}@localhost:3306/covid")
    df = pd.read_sql("SELECT * FROM industry_trimmed_avg",engine)
    plt.figure(figsize=(16,7))
    for col in df.columns[1:]:
        plt.xlabel("Date")
        plt.ylabel("Trimmed Avg")
        plt.title("Normalized Average Stock Price Between Industry")
        plt.plot(df.date, df[col], label=col)
    plt.legend(loc = "best")
    plt.show()

def create_normalize_plots(industry):
    engine = sqlalchemy.create_engine(f"mysql+pymysql://root:{password}@localhost:3306/covid")
    df = pd.read_sql(f"SELECT * FROM stock_joined_{industry}",engine)
    
    plt.figure(figsize=(16,7))
    for col in df.columns[1:]:
        scaled = f"{col}_scaled"
        df[scaled] = (df[col] - df[col].mean()) / df[col].std()
        df["Trimmed_avg"] = stats.trim_mean((df.filter(regex="scale")), 0.1, axis=1)
        df.to_sql(f"trimmed_{industry}", engine, if_exists='replace')

    for col in df.columns:
        if '_scaled' in col:
            plt.xlabel("Date")
            plt.ylabel("Normalized Stock Prices (z-score)")
            plt.title(f"{industry} Industry")
            df_trim = df.filter(regex="scale")
            df_trim["trimmed"] = stats.trim_mean(df_trim, 0.1, axis=1)
            plt.plot(df.date, df_trim[col], label=col)
        elif "Trimmed_avg" in col:
            plt.plot(df.date, df_trim["trimmed"], label=col)
    

    plt.legend(loc = "best")
    plt.show()