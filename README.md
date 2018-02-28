# hockey_analysis
Simple project for analyzing NHL data using a MySQL database

To run this code on a local MySQL database:

1. Clone the repository and navigate to its directory by opening a terminal window and running
```
$ git clone https://github.com/EdMan1022/hockey_analysis.git
$ cd hockey_analysis/
```

2. Create a new python venv using python 3.6 as the version and activate it

3. [Install MySQL](https://dev.mysql.com/doc/refman/5.7/en/installing.html) if it isn't already. On Ubuntu use
```
$ sudo apt-get install mysql-server
```

4. [Install the python mysqlclient](https://github.com/PyMySQL/mysqlclient-python/blob/master/README.md). On Ubuntu this requires
```
$ sudo apt-get install python-dev libmysqlclient-dev
$ sudo apt-get install python3-dev
```
5. Now install the rest of the packages in the requirements file using
```
$ pip install -r requirements.txt
```

6. Initialize the hockey database using the `hockey_db_init.sql` script

```
$ mysql -u [USER] -p[PASSWORD] < ./static/sql/hockey_db_init.sql
```
8. Create a `.env` file in the root with `DB_URI` set equal to the uri of the database, or set this environmental variable manually with
```
$ export DB_URI=mysql://[USER]:[PASSWORD]@localhost/hockey
```
9. Run the `load_hockey_data.py` python script

```
$ python load_hockey_data.py
```

10.