# Put your app in here.
from flask import Flask, request
from operations import add, sub, mult, div

app = Flask(__name__)

@app.route('/add')
def add_page():
    """Add two numbers and return the result."""

    a = request.args.get('a', type=int)
    b = request.args.get('b', type=int)
    return f"{add(a, b)}"

@app.route('/sub')
def sub_page():
    """Substract b from a and return the result."""

    a = request.args.get('a', type=int)
    b = request.args.get('b', type=int)
    return f"{sub(a, b)}"

@app.route('/mult')
def mult_page():
    """Multiply a and b and return the result."""

    a = request.args.get('a', type=int)
    b = request.args.get('b', type=int)
    return f"{mult(a, b)}"

@app.route('/div')
def div_page():
    """Divide a by b and return the result."""

    a = request.args.get('a', type=int)
    b = request.args.get('b', type=int)
    return f"{div(a, b)}"

#Further study:
math_sub = {
    "add": add,
    "sub": sub,
    "mult": mult,
    "div": div,
}

@app.route('/math/<calc>')
def calc_page(calc):
    """Show the answer of the calculation and do all in one single route."""

    a = request.args.get('a', type=int)
    b = request.args.get('b', type=int)
    result = math_sub[calc](a, b)
    return f"{result}"



