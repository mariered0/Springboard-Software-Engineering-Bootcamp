from multiprocessing.connection import answer_challenge
from flask import Flask, render_template, request
from flask_debugtoolbar import DebugToolbarExtension
from surveys import *

app = Flask(__name__)
app.config['SECRET_KEY'] = "oh-so-secret"

debug = DebugToolbarExtension(app)

responses = []

@app.route('/')
def show_survey_start():
    """Render a page with the title of the survey, instructions, and a button to start the survey"""

    return render_template('home.html', surveys=surveys)

@app.route('/questions/0')
def show_question0():
    """Render a question #0 and options for answer."""
    # answer_q0 = request.args[f"question{question_number}"]
    print(request.args)
    return render_template('question.html', surveys=surveys)