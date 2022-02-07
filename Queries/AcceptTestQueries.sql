Use AcharehDB

Select NameAndFamily 
From Client
Where City = 'Hamedan';

Select ComplainDesc 
From Complaining
Where PersenelCode = 3;

Select Expert.AvgPoints, TakeService.ExpertPoint
From TakeService, Expert
Where Expert.PersenelCode  = 2 and Expert.PersenelCode = TakeService.PersenelCode and TakeService.MemberShipCode = 101 ;

Select Supporter.NameAndFamily 
From Supporter, CallingSupporter 
Where Supporter.PersenelCode = CallingSupporter.PersenelCode and CallingSupporter.MemberShipCode = 103;

Select HaveProfession.ProfLevel, Expert.NameAndFamily
From HaveProfession, TakeService, Client, Expert
Where HaveProfession.PersenelCode = TakeService.PersenelCode and TakeService.MemberShipCode = Client.MemberShipCode and 
      TakeService.AddressDesc = 'Ghazvin' and Client.City = 'Ghazvin' and Expert.PersenelCode = TakeService.PersenelCode ;

Select WorkingHour 
From AgencyWorkingHours, Agency 
Where AgencyWorkingHours.AgencyCode = Agency.AgencyCode and Agency.City = 'Tehrun';

Select ProfNumber 
From EmpHistory, Expert, HaveProfession, Profession
Where Expert.PersenelCode = HaveProfession.PersenelCode and HaveProfession.ProfCode = Profession.ProfCode and 
      Profession.ProfName = 'Fazelab' and EmpHistory.PersenelCode = Expert.PersenelCode

Select NameAndFamily ,KnowledgePoint 
From Supporter, Agency
where Supporter.PersenelCode = Agency.ManagerCode and Agency.Budget = 100000 and Agency.City = 'Tehrun'

Select SupportersAddress.City, SupportersAddress.StreetNo, SupportersAddress.HouseNo, SupportersAddress.Alley  
From SupportersAddress, CallingSupporter , Client
Where Client.NameAndFamily = 'Akbar Gholami' and Client.MemberShipCode = CallingSupporter.MemberShipCode and 
	  CallingSupporter.PersenelCode = SupportersAddress.PersenelCode

Select Distinct Client.NameAndFamily
From Client, Expert, TakeService, HaveProfession, Complaining, Profession
Where Client.MemberShipCode = TakeService.MemberShipCode and Expert.PersenelCode = TakeService.PersenelCode and 
	  Expert.NameAndFamily = 'Michael Johnny' and ( 
			Select Expert2.NameAndFamily
			From Expert As Expert2, TakeService As TakeService2 
			Where Expert2.PersenelCode = TakeService2.PersenelCode and TakeService2.MemberShipCode = Client.MemberShipCode and 
				  Expert2.PersenelCode = HaveProfession.PersenelCode and 
				  Profession.ProfCode = HaveProfession.ProfCode and Profession.ProfName = 'Fazelab' 
			) in ( 'Jack Wiliam' )