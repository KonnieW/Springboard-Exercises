"""Blogly application."""

from flask import Flask
from models import db, connect_db
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SECRET KEY'] = "SECRETSSSS"
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///blogly'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

db = SQLAlchemy()
db.app = app
db.init_app(app)

connect_db(app)
db.create_all()

