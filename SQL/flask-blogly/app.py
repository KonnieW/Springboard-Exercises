"""Blogly application."""
from flask import Flask, request, redirect, render_template
from flask_debugtoolbar import DebugToolbarExtension
#import stuff from models.py
from models import db, connect_db, User

#standard code needed to use Flask
app = Flask(__name__)
app.config['SECRET_KEY'] = 'ihaveasecret'
#URI-is What database are you using.
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///blogly'
#Changing track modifications to false to disable the clunky warning in ipython.
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
#ECHO-Helps track/print SQL statements to the terminal.
app.config['SQLALCHEMY_ECHO'] = True
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = True
#can turn off debugtoolbar redirect notifications but making False
debug = DebugToolbarExtension(app)

#allows you to call on the connect_db(app) function in models.py
connect_db(app)
#usually better to run this in the ipython terminal than write here
db.create_all()

@app.route('/')
def home():
    return redirect("/users")

@app.route('/users')
# """ This order by query lists the users starting from last name. """
def users_list():
    users = User.query.order_by(User.last_name, User.first_name).all()
    return render_template('users/index.html', users=users)


@app.route('/users/new', methods=["GET"])
def users_new_form():
    return render_template('users/new.html')


@app.route("/users/new", methods=["POST"])
def users_new():
    new_user = User(
        first_name=request.form['first_name'],
        last_name=request.form['last_name'],
        image_url=request.form['image_url'] or None)

    db.session.add(new_user)
    db.session.commit()

    return redirect("/users")


@app.route('/users/<int:user_id>')
def users_show(user_id):
    user = User.query.get(user_id)
    return render_template('users/show.html', user=user)


@app.route('/users/<int:user_id>/edit')
def users_edit(user_id):
    user = User.query.get(user_id)
    return render_template('users/edit.html', user=user)


@app.route('/users/<int:user_id>/edit', methods=["POST"])
def users_update(user_id):
    user = User.query.get(user_id)
    user.first_name = request.form['first_name']
    user.last_name = request.form['last_name']
    user.image_url = request.form['image_url']

    db.session.add(user)
    db.session.commit()

    return redirect("/users")


@app.route('/users/<int:user_id>/delete', methods=["POST"])
def users_delete(user_id):
    user = User.query.get(user_id)
    db.session.delete(user)
    db.session.commit()

    return redirect("/users")
