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

and run the script  
```
$ mysql -u [USER] -p[PASSWORD] < ./static/sql/hockey_db_init.sql
``` 
