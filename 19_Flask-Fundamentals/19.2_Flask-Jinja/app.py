from flask import Flask, request, render_template
from flask_debugtoolbar import DebugToolbarExtension
from stories import stories

app = Flask(__name__)
app.config['SECRET_KEY'] = "kitty"

debug = DebugToolbarExtension(app)


@app.route('/')
def choose_template():
    """Show a list of stories"""

    return render_template("home.html", stories=stories.values())


@app.route('/form')
def form():
    """Return a page with a form prompting to enter all the words in the story."""
    story_id = request.args["story_id"]
    story = stories[story_id]

    prompts = story.prompts

    return render_template("form.html", story_id=story_id, title=story.title, prompts=prompts)


@app.route('/story')
def story():
    """Replaces the words in the text with the input words and show the story in story.html"""

    story_id = request.args["story_id"]
    story = stories[story_id]

    text = story.generate(request.args)

    return render_template("story.html", title=story.title, text=text)
