import os

import dotenv
import sqlalchemy

from etl_script import load_from_pandas_df, shootout_score_transform

# First loads database uri from environmental variable
# If the user has a .env file in the root, then loads the environmental variable from it
env_path = '.env'
if os.path.isfile(env_path):
    dotenv.load_dotenv(env_path)

# Initializes the engine connecting to the database
db_uri = os.environ.get('DB_URI')
mysqldb = sqlalchemy.create_engine(db_uri)

file_tables = [
    {"file": "static/csv/Master.csv", "table": "master", "columns": None},
    {"file": "static/csv/Coaches.csv", "table": "coach", "columns": None},
    {"file": "static/csv/AwardsPlayers.csv", "table": "award_player", "columns": None},
    {"file": "static/csv/ScoringShootout.csv", "table": "scoring_shootout", "columns": None,
     "transform": shootout_score_transform},
    {"file": "static/csv/Scoring.csv", "table": "scoring", "columns": ['player_id', 'year', 'tm_id']}
]

# For each table to load in, run the load in function with the table name,
# file path to the csv data, and list of columns to load in
for file_table in file_tables:
    load_from_pandas_df(
        con=mysqldb,
        csv_path=file_table['file'],
        table=file_table['table'],
        columns=file_table['columns'],
        transform=file_table.get('transform')
    )
