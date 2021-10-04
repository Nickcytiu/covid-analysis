from functions.data import write_csv_to_db, write_to_db, make_industry_table
import os
import sqlalchemy

# Travel, Aerospace, Retail, Ecommerce, Automotive, Transportation, Entertainment

trav_list = ["AC.TRT", "UAL", "DAL"]
aero_list = ["BA", "AIRA.FRK", "BBD-A.TRT"]
ret_list = ["L.TRT", "COST", "WMT"]
ecom_list = ["AMZN", "SHOP.TRT", "BABA"]
auto_list = ["F", "GM", "TM"]
trans_list = ["UBER", "LYFT"]
ent_list = ["NFLX", "DIS", "CGX.TRT"]

industry_names = ['Travel', 'Aerospace', 'Retail', 'Ecommerce', 'Auto', 'Transportation', 'Entertainment']
stock_lists = [trav_list, aero_list, ret_list, ecom_list, auto_list, trans_list, ent_list]

csv_folder = 'stock_csv'
path = os.path.join(os.path.dirname(os.path.realpath(__file__)), csv_folder)
os.makedirs(path, exist_ok=True)

for stock_list, industry in zip(stock_lists, industry_names):
    tables = write_to_db(stock_list, industry, path)
    make_industry_table(tables, stock_list, industry)

write_csv_to_db()
