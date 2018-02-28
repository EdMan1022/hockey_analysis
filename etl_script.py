import csv
import pandas as pd
import re


def convert(name):
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()


def load_from_pandas_df(con, csv_path, table, columns=None):
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

    import_data.to_sql(name=table, con=con, if_exists='append',
                       index=False, chunksize=100)


def custom_transform(df):
    pass


def load_csv_data(con, csv_path, table):
    """
    Inserts data from a csv file into table on the MySQL database at con

    :param con: MySQLdb engine of the database the data is loaded into
    :param csv_path: path to the csv file containing the data
    :param table: name of the table the data is inserted into
    :return: None
    """

    with open(csv_path, 'r') as csv_file:  # Open the csv file containing the data in read mode
        csv_reader = csv.reader(csv_file)  # initialize a csv reader for the file

        # Initialize a cursor from the connection, and get the number of columns and column names from the schema
        cursor = con.cursor()
        n_cols = len(cursor.description)
        col_names = [i[0] for i in cursor.description]

        # Construct sql statement

        for row in csv_reader:
            pass
