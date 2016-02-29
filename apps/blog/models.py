from django.db import models
from django.utils import timezone
from ckeditor_uploader.fields import RichTextUploadingField


class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    preview_text = models.CharField(max_length=400, default='')
    preview_photo = models.ImageField(upload_to='blog/img/previews',
                                      default='', null=True, blank=True)
    color = models.CharField(max_length=7, default='#ffffff')
    custom_url = models.CharField(max_length=200, default='', null=True, blank=True)
    content = RichTextUploadingField(null=True, blank=True)
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True, default=timezone.now)

    @property
    def url(self):
        return self.custom_url or '/post/{}'.format(self.id)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
