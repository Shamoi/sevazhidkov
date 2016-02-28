from django.views.generic import ListView, DetailView

from .models import Post


class PostsListView(ListView):
    queryset = Post.objects.order_by('-published_date')


class PostDetailView(DetailView):
    model = Post
