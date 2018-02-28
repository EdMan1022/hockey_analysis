from sqlalchemy.engine import Engine
import pandas as pd
import re


def convert(name):
    """
    Converts input text from camelCase to snake_case
    """
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()


def import_hockey_data(engine: Engine, fpath):
    """
    Imports data from a given csv file into the database that engine is connecting to

    Reads
    :param engine: Engine sqlalchemy engine connecting to the database
    :param fpath: str path to the file that is to be loaded
    :return:
    """

    file = fpath['fpath']
    table = fpath['table']

    import_data = pd.read_csv(file)

    # Replace column names with snake_case versions
    import_data.columns = pd.Series(import_data.columns).apply(convert).tolist()

    # Write the dataframe to the database table
    import_data.to_sql(name=table, con=engine, if_exists='append', index=False, chunksize=1000)


