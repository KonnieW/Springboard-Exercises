from unittest import TestCase
from app import app
from models import db, User

#create separate db for testing, postgresql etc
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///bloglytest'
app.config['SQLALCHEMY_ECHO'] = False
app.config['TESTING'] = True
app.config['DEBUG_TB_HOSTS'] = ['dont-show-debug-toolbar']

db.drop_all()
db.create_all()

class User_Tests(TestCase):

    def setUp(self):
        self.client = app.test_client()
        app.config['TESTING'] = True

        
        User.query.delete()

        user = User(first_name="Bob", last_name="Walker")
        db.session.add(user)
        db.session.commit()

        self.user_id = user.id
        
    def test_show_user(self):
        with self.client:
            res = self.client.get(f"/users/{self.user_id}")
            html = res.get_data(as_text=True)
            self.assertEqual(res.status_code, 200)
            


    def test_form(self):
        with self.client:
            res = self.client.get("/users/new")
            html = res.get_data(as_text=True)
            self.assertEqual(res.status_code, 200)
            self.assertIn('<h1>Create a user</h1>', html)

    def test_create_new_user(self):

        with self.client:
            res = self.client.post('/users/new', data={'first_name':'Sara', 'last_name':'Smith', 'image_url':' '}, follow_redirects=True)
            self.assertIn(b'Sara Smith', res.data)  #looked on page for the user
            self.assertEqual(res.status_code, 200)

            #what should you see when you do an action, test for every route/error handling
            #look for specific user on page
            #query database using sqlalchemy
            #make sure hitting the urls, searching for stuff on page, getting state code 200