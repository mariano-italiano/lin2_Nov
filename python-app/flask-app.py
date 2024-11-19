#import psycopg2
import subprocess
import json
from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return "To jest moje aplikacja Python z centos9"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
