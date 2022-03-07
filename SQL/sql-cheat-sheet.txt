-to check if postgresql is working: sudo service postgresql status
-to activate it: sudo service postgresql start
-To start up terminal type in psql
-to create a new database type CREATE DATABASE _name_of_new_db
-\l to see what tables there are
-To seed your database, run the following command from within the starter code directory.
-cd into the main folder directory where the seed files are held but don't activate psql yet, instead type the seed command line
-seed a database file: psql < my_database.sql
-\c _dbname_ to connect to specific ones
\d to see the attributes and \dt to see the data without all the extra info
-\d name_of_table to see info on the table itself
-SELECT * FROM _nameoftable_; to get data
-\q to exit and return to main terminal page
-to read a .sql table file from the terminal make sure you're cd in the right folder then psql and connect to specific databases
-then type \i name_of_file_in the same folder.sql, it will show you all the table info from that file
-pg_dump -C -c -O my_database_name > backup.sql to make a verbose file of your terminal table
-\x will change the view of selected tables in the terminal improves wide table readability
ctrl + l will clear the screen