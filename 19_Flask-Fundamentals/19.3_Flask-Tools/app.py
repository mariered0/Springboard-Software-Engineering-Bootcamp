from multiprocessing.connection import answer_challenge
from flask import Flask, render_template, request, redirect, flash, session
from flask_debugtoolbar import DebugToolbarExtension
from surveys import *

app = Flask(__name__)
app.config['SECRET_KEY'] = "oh-so-secret"

debug = DebugToolbarExtension(app)
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False


survey = surveys['satisfaction']

@app.route('/')
def show_survey_start():
    """Render a page with the title of the survey, instructions, and a button to start the survey"""

    return render_template('home.html', survey=survey)

@app.route('/start_survey', methods=["POST"])
def set_session():
    """Set a session to an empty list and redirect to the first question."""
    session['responses'] = []
    return redirect('/questions/0')


@app.route(f"/questions/<int:q_num>")
def show_question(q_num):
    """Render a question and options for answer."""
    responses = session.get('responses')
    print(responses)
    if responses == None:
        return redirect('/')
        
    elif len(responses) != q_num:
        flash('Invalid page access detected.')
        return redirect(f"/questions/{len(responses)}")

    elif len(responses) == len(survey.questions):
        return redirect('/thank_you')

    print('else')
    return render_template('question.html', survey=survey, q_num=q_num)


@app.route('/answer', methods=["POST"])
def answer_q():
    """Retrieve the answer of the question and move onto the next question."""
    answer = request.form['answer']
    responses = session['responses']
    responses.append(answer)
    session['responses'] = responses

    if len(responses) == len(survey.questions):
        return redirect('/thank_you')

    return redirect(f"/questions/{len(responses)}")



@app.route('/thank_you')
def thank_you():
    """Render a page to thank the user."""
    return render_template('thank_you.html')

