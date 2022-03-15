Flask virtual environment setup/installations:
1. python3 -m venv venv
2. source venv/bin/activate
3. to exit the virtual environment: deactivate venv
4. pip install Flask
5. optional: pip install flask-debugtoolbar
Flask sqlalchemy installations:
5. pip install psycopg2-binary
6. pip install flask-sqlalchemy 

PostgreSQL installations/setup:
1. to check if postgresql is working: sudo service postgresql status
2. to activate it: sudo service postgresql start
3. To start up terminal type in psql
4. to create a new database type CREATE DATABASE _name_of_new_db
5. \l to see what tables there are
6. To seed your database, run the following command from within the starter code directory.
7. cd into the main folder directory where the seed files are held but don't activate psql yet, instead type the seed command line
8. seed a database file: psql < my_database.sql
9. \c _dbname_ to connect to specific ones
10. d to see the attributes and \dt to see the data without all the extra info
11. \d name_of_table to see info on the table itself
12. SELECT * FROM _nameoftable_; to get data
13. \q to exit and return to main terminal page
14. to read a .sql table file from the terminal make sure you're cd in the right folder then psql and connect to specific databases
15. then type \i name_of_file_in the same folder.sql, it will show you all the table info from that file
16. pg_dump -C -c -O my_database_name > backup.sql to make a verbose file of your terminal table
17. \x will change the view of selected tables in the terminal improves wide table readability
19. ctrl + l will clear the screen