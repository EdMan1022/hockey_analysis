# hockey_analysis
Simple project for analyzing NHL data using a MySQL database

To run this code on a local MySQL database:

1. Create a new python venv using python 3.6 as the version and activate it

1. [Install MySQL](https://dev.mysql.com/doc/refman/5.7/en/installing.html) in the venv

1. [Install the python mysqlclient](https://github.com/PyMySQL/mysqlclient-python/blob/master/README.md). On Ubuntu this requires
```
$ sudo apt-get install python-dev libmysqlclient-dev
$ sudo apt-get install python3-dev
$ pip install mysqlclient
```

4. Clone the repository by opening a terminal window and running
```
$ git clone https://github.com/EdMan1022/hockey_analysis.git
```

5. Initialize the hockey database using the `hockey_db_init.sql` script. Navigate to the project root using
```
$ cd hockey_analysis/ 
```

6. and run the script
```
$ mysql -u [USER] -p[PASSWORD] < ./static/sql/hockey_db_init.sql
``` 
4. Now we need to build the python interpreter that loads the files. Set up a virtualenv using python 3.6

5. Installing the library to talk with MySQL is difficult. Follow [this](https://github.com/PyMySQL/mysqlclient-python/blob/master/README.md) guide to install it on python 3
6. Now install the rest of the packages in the .requirements file
7. Create a `.env` file in the root with `DB_URI` set equal to the uri of the database, or set this environmental variable manually
8. Run the `load_data` python script
