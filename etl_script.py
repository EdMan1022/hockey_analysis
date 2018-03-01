import csv
import pandas as pd
import re


def convert(name):
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()


def load_from_pandas_df(con, csv_path, table, columns=None, transform=None):
    """
    Insert data into the database at con using pandas

    :param con:
    :param csv_path:
    :param table:
    :param columns: optional list of columns to import. If not included, imports all columns
    :return:
    """

    # Initialize the data as a pandas dataframe, if dataset were larger would need to implement chunking
    import_data = pd.read_csv(csv_path)

    # Convert the column headers from camelcase to snake_case
    new_headers = pd.Series(import_data.columns).apply(convert).tolist()
    import_data.columns = new_headers

    if columns is not None:
        import_data = import_data.loc[:, columns]
    if transform is not None:
        import_data = transform(import_data)

    import_data.to_sql(name=table, con=con, if_exists='append',
                       index=False, chunksize=100)


def shootout_score_transform(df):
    """
    Adds a shot percentage column by dividing the number of shootout goals by the number of shots

    :param df: input pandas dataframe from the shootout_score data
    :return: transformed pandas dataframe
    """
    df.loc[:, 'shot_percentage'] = df.loc[:, 'g']/df.loc[:, 's']

    return df.groupby('tm_id').sum()
