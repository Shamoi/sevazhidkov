from flask import render_template

from . import app, cache
from .apps import places, word_count


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/places')
def places_index():
    cities = places.get_all_places(cache)
    return render_template('apps/places.html', places=cities)

@app.route('/word-count')
def words_index():
    return "Test"
