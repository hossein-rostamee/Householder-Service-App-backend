from django.shortcuts import render
from django.template  import loader
from django.http import HttpResponse
import pyodbc
from .models import sqlserverconn
# Create your views here.


def index( request ) :
    template = loader.get_template( 'AcharehMain/AcharehUI.html' )
    context = {}
    return HttpResponse( template.render( context, request ) )

def welcome( request ) :
    return render( request, 'AcharehMain/Welcome.html' )

def Query1( request ) :
    conn = pyodbc.connect( 'Driver={SQL Server Native Client 11.0};' 
                           'Server=DESKTOP-71AV8RA;' 
                           'Database=AcharehDB;'
                           'Trusted_Connection=yes;' )
    cursor = conn.cursor()
    cursor.execute( "Select NameAndFamily From Client Where City = 'Hamedan';" )
    result = cursor.fetchall()                      
    return render( request, 'AcharehMain/Query1.html', { 'sqlserverconn' : result } )

def Query2( request ) :
    conn = pyodbc.connect( 'Driver={SQL Server Native Client 11.0};' 
                           'Server=DESKTOP-71AV8RA;' 
                           'Database=AcharehDB;'
                           'Trusted_Connection=yes;' )
    cursor = conn.cursor()
    cursor.execute( "Select ComplainDesc From Complaining Where PersenelCode = 3;" )
    result = cursor.fetchall()                      
    return render( request, 'AcharehMain/Query2.html', { 'sqlserverconn' : result } )



def Query3( request ) :
    conn = pyodbc.connect( 'Driver={SQL Server Native Client 11.0};' 
                           'Server=DESKTOP-71AV8RA;' 
                           'Database=AcharehDB;'
                           'Trusted_Connection=yes;' )
    cursor = conn.cursor()
    cursor.execute( "Select Expert.AvgPoints, TakeService.ExpertPoint From TakeService, Expert Where Expert.PersenelCode  = 2 and Expert.PersenelCode = TakeService.PersenelCode and TakeService.MemberShipCode = 101 ;" )
    result = cursor.fetchall()                      
    return render( request, 'AcharehMain/Query3.html', { 'sqlserverconn' : result } )



def Query4( request ) :
    conn = pyodbc.connect( 'Driver={SQL Server Native Client 11.0};' 
                           'Server=DESKTOP-71AV8RA;' 
                           'Database=AcharehDB;'
                           'Trusted_Connection=yes;' )
    cursor = conn.cursor()
    cursor.execute( "Select Supporter.NameAndFamily From Supporter, CallingSupporter Where Supporter.PersenelCode = CallingSupporter.PersenelCode and CallingSupporter.MemberShipCode = 103;" )
    result = cursor.fetchall()                      
    return render( request, 'AcharehMain/Query4.html', { 'sqlserverconn' : result } )



def Query5( request ) :
    conn = pyodbc.connect( 'Driver={SQL Server Native Client 11.0};' 
                           'Server=DESKTOP-71AV8RA;' 
                           'Database=AcharehDB;'
                           'Trusted_Connection=yes;' )
    cursor = conn.cursor()
    cursor.execute( "Select HaveProfession.ProfLevel, Expert.NameAndFamily From HaveProfession, TakeService, Client, Expert Where HaveProfession.PersenelCode = TakeService.PersenelCode and TakeService.MemberShipCode = Client.MemberShipCode and TakeService.AddressDesc = 'Ghazvin' and Client.City = 'Ghazvin' and Expert.PersenelCode = TakeService.PersenelCode ;" )
    result = cursor.fetchall()                      
    return render( request, 'AcharehMain/Query5.html', { 'sqlserverconn' : result } )



def Query6( request ) :
    conn = pyodbc.connect( 'Driver={SQL Server Native Client 11.0};' 
                           'Server=DESKTOP-71AV8RA;' 
                           'Database=AcharehDB;'
                           'Trusted_Connection=yes;' )
    cursor = conn.cursor()
    cursor.execute( "Select WorkingHour From AgencyWorkingHours, Agency Where AgencyWorkingHours.AgencyCode = Agency.AgencyCode and Agency.City = 'Tehrun';" )
    result = cursor.fetchall()                      
    return render( request, 'AcharehMain/Query6.html', { 'sqlserverconn' : result } )



def Query7( request ) :
    conn = pyodbc.connect( 'Driver={SQL Server Native Client 11.0};' 
                           'Server=DESKTOP-71AV8RA;' 
                           'Database=AcharehDB;'
                           'Trusted_Connection=yes;' )
    cursor = conn.cursor()
    cursor.execute( "Select ProfNumber From EmpHistory, Expert, HaveProfession, Profession Where Expert.PersenelCode = HaveProfession.PersenelCode and HaveProfession.ProfCode = Profession.ProfCode and Profession.ProfName = 'Fazelab' and EmpHistory.PersenelCode = Expert.PersenelCode" )
    result = cursor.fetchall()                      
    return render( request, 'AcharehMain/Query7.html', { 'sqlserverconn' : result } )



def Query8( request ) :
    conn = pyodbc.connect( 'Driver={SQL Server Native Client 11.0};' 
                           'Server=DESKTOP-71AV8RA;' 
                           'Database=AcharehDB;'
                           'Trusted_Connection=yes;' )
    cursor = conn.cursor()
    cursor.execute( "Select NameAndFamily ,KnowledgePoint From Supporter, Agency where Supporter.PersenelCode = Agency.ManagerCode and Agency.Budget = 100000 and Agency.City = 'Tehrun'" )
    result = cursor.fetchall()                      
    return render( request, 'AcharehMain/Query8.html', { 'sqlserverconn' : result } )



def Query9( request ) :
    conn = pyodbc.connect( 'Driver={SQL Server Native Client 11.0};' 
                           'Server=DESKTOP-71AV8RA;' 
                           'Database=AcharehDB;'
                           'Trusted_Connection=yes;' )
    cursor = conn.cursor()
    cursor.execute( "Select SupportersAddress.City, SupportersAddress.StreetNo, SupportersAddress.HouseNo, SupportersAddress.Alley  From SupportersAddress, CallingSupporter , Client Where Client.NameAndFamily = 'Akbar Gholami' and Client.MemberShipCode = CallingSupporter.MemberShipCode and  CallingSupporter.PersenelCode = SupportersAddress.PersenelCode" )
    result = cursor.fetchall()                      
    return render( request, 'AcharehMain/Query9.html', { 'sqlserverconn' : result } )




def Query10( request ) :
    conn = pyodbc.connect( 'Driver={SQL Server Native Client 11.0};' 
                           'Server=DESKTOP-71AV8RA;' 
                           'Database=AcharehDB;'
                           'Trusted_Connection=yes;' )
    cursor = conn.cursor()
    cursor.execute( "Select Distinct Client.NameAndFamily From Client, Expert, TakeService, HaveProfession, Complaining, Profession Where Client.MemberShipCode = TakeService.MemberShipCode and Expert.PersenelCode = TakeService.PersenelCode and Expert.NameAndFamily = 'Michael Johnny' and (  Select Expert2.NameAndFamily From Expert As Expert2, TakeService As TakeService2  Where Expert2.PersenelCode = TakeService2.PersenelCode and TakeService2.MemberShipCode = Client.MemberShipCode and  Expert2.PersenelCode = HaveProfession.PersenelCode and  Profession.ProfCode = HaveProfession.ProfCode and Profession.ProfName = 'Fazelab'  ) in ( 'Jack Wiliam' )" )
    result = cursor.fetchall()                      
    return render( request, 'AcharehMain/Query10.html', { 'sqlserverconn' : result } )





