import time

from flask import render_template

from . import app, cache
from .apps import activity, places, word_count


@app.route('/')
def index():
    github_activity = activity.get_github_activity()
    return render_template(
        'index.html',
        contributions=github_activity
    )


@app.route('/places')
def places_index():
    cities = places.get_all_places(cache)
    return render_template('apps/places.html', places=cities)

@app.route('/word-count')
def words_index():
    words_stat = word_count.get_words(cache)
    words = words_stat['stat']
    # Calculate how much time left from last update of words data
    words_update = int((time.time() - words_stat['updated']) // 3600)

    symbols_stat = word_count.get_symbols(cache)
    symbols = symbols_stat['stat']
    symbols_update = int((time.time() - symbols_stat['updated']) // 3600)
    return render_template(
        'apps/word-count.html',
        words=words, words_update=words_update,
        symbols=symbols, symbols_update=symbols_update
    )
