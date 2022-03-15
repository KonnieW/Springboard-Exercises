"""Models for Blogly."""
#can technically spread models across multiple files
from flask_sqlalchemy import SQLAlchemy

#creates/saves SQLAlchemy instance to db; executes sqlalchemy
db = SQLAlchemy()

#Need this to connect to the database in app.py
def connect_db(app):
    db.app = app
    db.init_app(app)

default_image = "https://images.unsplash.com/photo-1596854273338-cbf078ec7071?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"
# "https://www.freeiconspng.com/uploads/icon-user-blue-symbol-people-person-generic--public-domain--21.png"


#Defines table schema: colums, rows, values, 
#and maps(inserts) them to the table without manually entering into psql
#all models should subclass db.Model and best to have a singular class name
class User(db.Model):
    """Users of website."""
    
    #specifies the name of the table created in sql database
    __tablename__ = "users"
    #defining individual columns in the table, then type of column starting with db.
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.Text, nullable=False)
    last_name = db.Column(db.Text, nullable=False)
    image_url = db.Column(db.Text, nullable=False, default=default_image)