from django.db import models

# Create your models here.

class sqlserverconn( models.Model ) :
    gholamCode = models.IntegerField( primary_key= True )
    Name = models.CharField( max_length=10 )
    City = models.CharField( max_length=10 )
    Country = models.CharField( max_length=10 )