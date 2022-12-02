from django.shortcuts import render
from django.views.generic import ListView
from .models import ProfileImage


class FileView(ListView):
    model = ProfileImage
    context_object_name = 'files'
    template_name = 'hello.html'

