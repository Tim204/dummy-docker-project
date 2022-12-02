from django.db import models


class ProfileImage(models.Model):
    title = models.CharField(max_length=100)
    created = models.DateTimeField(auto_now_add=True)
    image = models.ImageField(upload_to='profile/images', blank=True)

    class Meta:
        ordering = ('title',)
        
    def __str__(self) -> str:
        return self.title
    

