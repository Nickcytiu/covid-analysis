import requests as re
import pandas as pd
import os
import sqlalchemy
from .db_password import password
import datetime

def extract_covid_cases_data(response):
    
    date = datetime.datetime.strptime(response["date_active"] , "%d-%m-%Y").strftime("%Y-%m-%d")
    province = response["province"]
    active_cases = response["active_cases"]
    active_cases_change = response["active_cases_change"]
    cumulative_case = response["cumulative_cases"]
    cumulative_deaths = response["cumulative_deaths"]
    cumulative_recovered = response["cumulative_recovered"]
    
    return [
            active_cases,
            active_cases_change,
            cumulative_case,
            cumulative_deaths,
            cumulative_recovered,
            date,
            province
           ]

def extract_covid_vaccine_data(response):
    
    date = datetime.datetime.strptime(response["date_vaccine_administered"] , "%d-%m-%Y").strftime("%Y-%m-%d")
    province = response["province"]
    vaccine_administered = response["avaccine"] 
    cumulative_vaccine_administered = response["cumulative_avaccine"]
    
    return [
        date,
        province,
        vaccine_administered,
        cumulative_vaccine_administered
    ]    

def extract_covid_vaccine_dis_data(response):
    
    date = datetime.datetime.strptime(response["date_vaccine_distributed"] , "%d-%m-%Y").strftime("%Y-%m-%d")
    province = response["province"]
    distributed_vaccine = response["dvaccine"]
    cumulative_vaccine_distributed = response["cumulative_dvaccine"]
    
    return [
        date,
        province,
        distributed_vaccine,
        cumulative_vaccine_distributed
    ]

def extract_test_data(response):
    
    date = datetime.datetime.strptime(response["date_testing"] , "%d-%m-%Y").strftime("%Y-%m-%d")
    province = response["province"]
    testing = response["testing"] 
    cumulative_testing = response["cumulative_testing"]
    
    return [
        cumulative_testing, 
        date,
        province,
        testing
    ]    

def create_covid_df(base_url, cols_cases, cols_vaccine,
                    cols_vaccine_dis, cols_test):

    path = os.path.expanduser("~/Desktop/Data Analytics/covid-analysis/covid/CSV/")

    #  Making the API call
    print('making an API call')
    api_result = re.get(base_url)
    print(api_result.status_code)
    api_response = api_result.json()
    print('parsing the response')
    
    #   Creating COVID cases dataframe
    covid_cases_dict = {}
    global df_cases
    print('creating cases dataframe')
    for ix, val in enumerate(api_response['active']):
        covid_cases_dict[ix] = extract_covid_cases_data(val)
    df_cases = pd.DataFrame.from_dict(covid_cases_dict,
                                        orient='index',
                                        columns=cols_cases)
    df_cases.to_csv(path+"covid_cases.csv")
    
    
    #    Creating COVID vaccine administered dataframe
    covid_vaccine_dict = {}
    global df_vaccine
    print('creating vaccine dataframe')
    for ix, val in enumerate(api_response['avaccine']):
        covid_vaccine_dict[ix] = extract_covid_vaccine_data(val)
    df_vaccine = pd.DataFrame.from_dict(covid_vaccine_dict,
                                        orient='index',
                                        columns=cols_vaccine)
    df_vaccine.to_csv(path+"covid_vaccine.csv")
    

    #     Creating COVID vaccine distributed dataframe
    covid_vaccine_dis_dict = {}
    global df_vaccine_dis
    print('creating vaccine_dis dataframe')
    for ix, val in enumerate(api_response['dvaccine']):
        covid_vaccine_dis_dict[ix] = extract_covid_vaccine_dis_data(val)
    df_vaccine_dis = pd.DataFrame.from_dict(covid_vaccine_dis_dict,
                                            orient='index',
                                            columns=cols_vaccine_dis)
    df_vaccine_dis.to_csv(path+"covid_vaccine_dis.csv")


    #     Creating COVID tests dataframe
    covid_test_dict = {}
    global df_test
    print('creating vaccine_test dataframe')
    for ix, val in enumerate(api_response['testing']):
        covid_test_dict[ix] = extract_test_data(val)
    df_test = pd.DataFrame.from_dict(covid_test_dict,
                                    orient='index',
                                    columns=cols_test)
    df_test.to_csv(path+"covid_test.csv")

    # Writing dataframe to SQL
    engine = sqlalchemy.create_engine(f"mysql+pymysql://root:{password}@localhost:3306/covid")
    df_cases.to_sql('covid_cases',engine,if_exists='replace')
    df_vaccine.to_sql('covid_vaccine',engine,if_exists='replace')
    df_vaccine_dis.to_sql('covid_vaccine_dis',engine,if_exists='replace')
    df_test.to_sql('covid_test',engine,if_exists='replace')
