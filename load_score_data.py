
import dotenv
import os
import sqlalchemy

from etl_script import load_from_pandas_df


env_path = '.env'

if os.path.isfile(env_path):
    dotenv.load_dotenv(env_path)

db_uri = os.environ.get('DB_URI')
mysqldb = sqlalchemy.create_engine(db_uri)


file_table = {"file": "static/csv/Scoring.csv", "table": "scoring"}

columns_list = ['player_id', 'year', 'tm_id']

load_from_pandas_df(mysqldb, file_table['file'], file_table['table'],
                    columns=columns_list)