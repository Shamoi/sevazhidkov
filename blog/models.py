from django.db import models


class Category(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()


class Post(models.Model):
    title = models.CharField(max_length=146)
    preview_text = models.TextField()
    preview_image = models.ImageField()
    html_text = models.TextField()
    markdown_text = models.TextField()
    category = models.ForeignKey(Category)
    pub_date = models.DateTimeField()
