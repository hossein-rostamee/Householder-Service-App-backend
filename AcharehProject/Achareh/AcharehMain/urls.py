from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path( 'AcharehUI', views.index ),
    path( '', views.welcome ),
    path( 'Query1', views.Query1 ),
    path( 'Query2', views.Query2 ),
    path( 'Query3', views.Query3 ),
    path( 'Query4', views.Query4 ),
    path( 'Query5', views.Query5 ),
    path( 'Query6', views.Query6 ),
    path( 'Query7', views.Query7 ),
    path( 'Query8', views.Query8 ),
    path( 'Query9', views.Query9 ),
    path( 'Query10', views.Query10 )
]
