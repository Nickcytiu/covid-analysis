from functions.plotting import create_normalize_plots, create_inter_industry_plot

df_list = ['Travel', 'Aerospace', 'Retail', 'Ecomm', 'Auto', 'Transportation', 'Entertainment']

for i in range(len(df_list)):
    create_normalize_plots(df_list[i])
create_inter_industry_plot()