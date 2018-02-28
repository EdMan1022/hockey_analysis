# hockey_analysis
Simple project for analyzing NHL data using a MySQL database

To run this code on a local MySQL database:

1. [Install MySQL](https://dev.mysql.com/doc/refman/5.7/en/installing.html) on the system if it isn't already

2. Clone the repository by opening a terminal window and running 
```
$ git clone https://github.com/EdMan1022/hockey_analysis.git
```

3. Initialize the hockey database using the `hockey_db_init.sql` script. Navigate to the project root using
```
$ cd hockey_analysis/ 
```

and run the script  
```
$ mysql -u [USER] -p[PASSWORD] < ./static/sql/hockey_db_init.sql
``` 
