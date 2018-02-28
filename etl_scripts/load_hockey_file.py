from sqlalchemy.engine import Engine
import pandas as pd


def import_hockey_data(engine: Engine, fpath):
    """
    Imports data from a given csv file into the database that engine is connecting to

    Reads
    :param engine: Engine sqlalchemy engine connecting to the database
    :param fpath: str path to the file that is to be loaded
    :return:
    """

    import_data = pd.DataFrame()



