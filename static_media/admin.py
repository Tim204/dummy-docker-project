from django.contrib import admin
from .models import ProfileImage


@admin.register(ProfileImage)
class CategoryAdmin(admin.ModelAdmin):
    search_fields = ['title']

