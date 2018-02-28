import csv
import pandas as pd


def load_from_pandas_df(con, csv_path, table):
    """
    Insert data into the database at con using pandas

    :param con:
    :param csv_path:
    :param table:
    :return:
    """

    import_data = pd.read_csv(csv_path)
    import_data.to_sql(name=table, con=con, if_exists='append',
                       index=False, chunksize=1000)


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

        # Construct

        for row in csv_reader:
            pass
