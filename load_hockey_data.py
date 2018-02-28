import MySQLdb
import dotenv
import os

from etl_script import load_from_pandas_df

env_path = '.env'

if os.path.isfile(env_path):
    dotenv.load_dotenv(env_path)

db_host = os.environ.get('DB_HOST')
db_user = os.environ.get('DB_USER')
db_pwd = os.environ.get('DB_PASSWORD')
db = os.environ.get('DB')


mysqldb = MySQLdb.connect(host=db_host,
                          user=db_user,
                          passwd=db_pwd,
                          db=db)

file_tables = [
    {"file": "static/csv/Master.csv", "table": "master"},
    {"file": "static/csv/Coaches.csv", "table": "coach"},
    {"file": "static/csv/AwardsPlayers.csv", "table": "award_player"},
    {"file": "static/csv/ScoringShootout.csv", "table": "scoring_shootout"},
]

for file_table in file_tables:
    load_from_pandas_df(
        con=mysqldb,
        csv_path=file_table['file'],
        table=file_table['table']
    )
