from django.http import HttpResponse
from django.shortcuts import render
from django.views.decorators.cache import cache_page

from . import services

LAST_MEDIUM_POSTS_NUM = 3


@cache_page(60 * 15)
def index(request):
    context = {
        'last_medium_posts': services.last_medium_posts(LAST_MEDIUM_POSTS_NUM)
    }
    return render(request, 'home/index.html', context=context)
