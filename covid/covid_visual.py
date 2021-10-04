from functions.plotting import create_covid_plot, create_log_plot, seven_day_moving_avg, create_vaccine_vs_plot


data_list = ["cases", "vaccine", "vaccine_dis", "test"]

# for i in range(len(data_list)):
#     create_covid_plot(data_list[i])
#     create_log_plot(data_list[i])

# seven_day_moving_avg()

create_vaccine_vs_plot("ONT")

