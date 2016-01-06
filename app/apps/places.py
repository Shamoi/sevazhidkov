from flask import render_template
import requests
import json

PLACES_FILE_URL = ("https://raw.githubusercontent.com/sevazhidkov/sevazhidkov/"
                   "master/static_data/places.json")


def get_all_places(cache):
    result = cache.get(PLACES_FILE_URL)
    if not result:
        result = json.loads(requests.get(PLACES_FILE_URL).text)
        cache.add(PLACES_FILE_URL, result, 3600)
    return render_template('apps/places.html', places=result)
