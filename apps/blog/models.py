from django.db import models
from django.utils import timezone
from ckeditor_uploader.fields import RichTextUploadingField


class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    preview_text = models.CharField(max_length=400, default='')
    preview_photo = models.ImageField(upload_to='media/blog/img/previews',
                                      default='')
    content = RichTextUploadingField(null=True)
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True, default=timezone.now)

    @property
    def url(self):
        return '/post/{}'.format(self.id)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
