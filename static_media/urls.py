from django.urls import path
from . import views

app_name  = 'static_media'
urlpatterns = [
    path('', views.FileView.as_view(), name='uploaded_files'),
]