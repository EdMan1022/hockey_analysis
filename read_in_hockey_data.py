import dotenv
import os
from sqlalchemy import create_engine
from .etl_scripts.load_hockey_file import import_hockey_data


# First loads database uri from environmental variable
# If the user has a .env file in the root, then loads the environmental variable from it
if os.path.isfile('.env'):
    dotenv.load_dotenv('.env')
db_uri = os.environ.get('DB_URI')

# Initializes the engine connecting to the database
engine = create_engine(db_uri)

fpaths = [
    {'fpath': '.static/csv/Master.csv', 'table': 'master'},
    {'fpath': '.static/csv/Coaches.csv', 'table': 'coach'},
    {'fpath': '.static/csv/AwardsPlayers.csv', 'table': 'award_player'},
    {'fpath': '.static/csv/ScoringShootout.csv', 'table': 'scoring_shootout'},
]

for fpath in fpaths:
    import_hockey_data(engine, fpath)
