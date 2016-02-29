from django.views.generic import ListView, DetailView

from .models import Post


class PostsListView(ListView):
    queryset = Post.objects.order_by('-published_date')
    paginate_by = 10


class PostDetailView(DetailView):
    model = Post
