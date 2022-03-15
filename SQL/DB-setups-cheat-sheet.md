*ctrl + shift + v = preview of .md file interface

Flask virtual environment setup/installations:
1. python3 -m venv venv
2. source venv/bin/activate
3. to exit the virtual environment: deactivate venv
4. to view the list of required installations: pip freeze
5. to create a requirements list: pip freeze > requirements.txt
6. to uninstall any installations: pip uninstall name_of_installation
7. pip install flask
8. optional: pip install flask-debugtoolbar

Flask sqlalchemy installations/setup:
1. pip install psycopg2-binary
2. pip install flask-sqlalchemy 
3. to create a database from virtual envir terminal: createdb name_of_db, this name will be what you put at the end of the URI 
   ```
   app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///name_of_db'
   ```
4. To create all dbs in the virtual envir run these once in ipython:
   ```
   %run app.py
   db.create_all()
   ```
   If you wrote db.create_all() in the app file, then you only need to run app.py.
   This only works once, won't update if your db/table has already been created, for now to update just drop the table and run it again.
5. To create instances of object based on classes in ipython and save to the table (db.session is like a git staging area in python):
   ```
   #name of class is User
   user1 = User(first_name="Boe", last_name="Sage")
   db.session.add(user1) #required to add to database
   db.session.commit()   #commit the transaction
   ```

PostgreSQL installations/setup:
1. to check if postgresql is working: sudo service postgresql status
2. to activate it: sudo service postgresql start
3. To start up terminal type in psql
4. to create a new database type CREATE DATABASE _name_of_new_db
5. to delete a database: DROP DATABASE name_of_database;
6. \l to see what tables there are
7. To seed your database, run the following command from within the starter code directory.
8. cd into the main folder directory where the seed files are held but don't activate psql yet, instead type the seed command line
9. seed a database file: psql < my_database.sql
10. \c _dbname_ to connect to specific ones
11. d to see the attributes and \dt to see the data without all the extra info
12. \d name_of_table to see info on the table itself
13. SELECT * FROM _nameoftable_; to get data
14. \q to exit and return to main terminal page
15. to read a .sql table file from the terminal make sure you're cd in the right folder then psql and connect to specific databases
16. then type \i name_of_file_in the same folder.sql, it will show you all the table info from that file
17. pg_dump -C -c -O my_database_name > backup.sql to make a verbose file of your terminal table
18. \x will change the view of selected tables in the terminal improves wide table readability
19. ctrl + l will clear the screen