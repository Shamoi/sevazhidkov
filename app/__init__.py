from flask import Flask
from . import cacher

app = Flask(__name__)
cache = cacher.Cacher()

from . import views
