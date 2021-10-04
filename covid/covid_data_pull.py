from functions.data import create_covid_df

base_url = "https://api.opencovid.ca/timeseries"

cols_cases = ["active_cases","active_cases_change", 
              "cumulative_case","cumulative_deaths",
              "cumulative_recovered","date","province"]

cols_vaccine = ["date", "province", 
                "vaccine_administered",
                "cumulative_vaccine_administered"]

cols_vaccine_dis = ["date", "province",
                    "distributed_vaccine",
                    "cumulative_vaccine_distributed"]

cols_test = ["cumulative_testing", "date", "province",
            "testing"]

create_covid_df(base_url, cols_cases, cols_vaccine, cols_vaccine_dis, cols_test)