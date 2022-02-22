from flask import Flask, request, render_template, redirect, flash
# from surveys import satisfaction_survey as survey

app = Flask(__name__)


@app.route("/")
def root_page():
    return render_template("base.html") #render template will call on the file in the parens under templates folder and render it, needed for jinja templates

@app.route("/start")
def start_page():
    return render_template("page_zero.html")

@app.route("/page_one")
def first_page():
    return render_template("page_one.html")

@app.route("/page_two")
def second_page():
    return render_template("page_two.html")

@app.route("/page_three")
def third_page():
    return render_template("page_three.html")

@app.route('/done')
def completed_survey():
    return render_template("complete.html")