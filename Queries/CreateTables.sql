--Create database AcharehDB

Use AcharehDB

go

Create Schema AchareClass

go 

Create Table Profession
(
	ProfCode int primary key check(ProfCode <= 10000 ) not null,
	ReqNum   int not null default '0',
	ProfWage int not null,
	ImageNo  int ,
	ProfName varchar(100) not null,
	TestQuorum int not null check( TestQuorum <= 100 and TestQuorum >= 0 ),
);

Create Table ProfessionSkills
(
	Skill varchar( 100 ) not null unique,
	ProfCode int not null check(ProfCode <= 10000 ),
	Constraint PROFTB
		Foreign key ( ProfCode ) References Profession( ProfCode )
			on delete cascade,
	Constraint PROFTB2
		Primary key ( ProfCode, Skill )
);

Create Table CarProf
(
	CarProfCode int not null check(CarProfCode <= 10000 ) primary key,
	CarToolBoxNo int unique,
	Foreign key ( CarProfCode ) References Profession( ProfCode ),
);

Create Table CompProf
(
	CompProfCode int not null check(CompProfCode <= 10000 ) primary key,
	CompToolBoxNo int unique,
	Foreign key ( CompProfCode ) References Profession( ProfCode ),
);

Create Table WaterProf
(
	WaterProfCode int not null check(WaterProfCode <= 10000 ) primary key,
	WaterToolBoxNo int unique,
	Foreign key ( WaterProfCode ) References Profession( ProfCode ),
);

Create Table Expert
(
	PersenelCode int not null primary key,
	NameAndFamily varchar( 100 ) not null,
	PhoneNumber varchar(11) not null,
	WorkingHours varchar( 10 ) not null,
	AvgPoints int not null,
	Sex varchar(1) not null check( Sex in ( 'F', 'M' ) ),
	HouseNo varchar(12),
	StreetNo varchar(20),
	City varchar(20),
	Alley varchar(20)
);

Create Table EmpHistory
(
	PersenelCode int not null,
	foreign key ( PersenelCode ) References Expert( PersenelCode ),
	ProfessionType varchar(100) not null,
	Primary Key ( PersenelCode, ProfessionType ),
	ProfNumber int,
	Point int,
);

Create Table Agency 
(
	AgencyCode int primary key,
	SupporterNum int not null,
	Budget int not null check( Budget <= 100000 and Budget >= 0 ),
	HouseNo varchar(12),
	StreetNo varchar(20),
	City varchar(20),
	Alley varchar(20),
	ManagerCode int not null,
	StartDate Date,
);

Create Table AgencyWorkingHours
(
	AgencyCode int,
	WorkingHour varchar(12),
	Foreign Key ( AgencyCode ) References Agency( AgencyCode ),
	Primary Key ( AgencyCode, WorkingHour ),
);

Create Table Client
(
	MemberShipCode int not null Primary Key,
	PhoneNumber varchar(11) not null,
	AccountCredit int,
	Sex varchar(1) not null check( Sex in ( 'F', 'M' ) ),
	NameAndFamily varchar(100) not null,
	HouseNo varchar(12),
	StreetNo varchar(20),
	City varchar(20),
	Alley varchar(20),
);

Create Table Supporter
(
	PersenelCode int primary key,
	NameAndFamily varchar(100) not null,
	Sex varchar(1) not null check( Sex in ( 'F', 'M' ) ),
	Wage int not null,
	KnowledgePoint int not null check( KnowledgePoint >= 0 and KnowledgePoint <= 100 ),
	PhoneNumber varchar(11) not null,
	AgencyCode int not null,
	Foreign Key (AgencyCode) References Agency( AgencyCode )

);

Alter Table Agency
Add Foreign Key ( ManagerCode ) References Supporter( PersenelCode );

Create Table SupportersAddress
(
	PersenelCode int not null,
	Foreign Key ( PersenelCode ) References Supporter( PersenelCode ),
	HouseNo varchar(12),
	StreetNo varchar(20),
	City varchar(20),
	Alley varchar(20),
	Primary Key ( PersenelCode, HouseNo, StreetNo, City, Alley ),
);

Create Table CallingSupporter 
(
	MemberShipCode int not null Primary Key,
	PersenelCode int not null,
	Foreign Key ( PersenelCode ) References Supporter( PersenelCode ),
	Foreign Key ( MemberShipCode ) References Client( MemberShipCode ),
	CallPoint int check( CallPoint <= 100 and CallPoint >= 0 ),
	CallCode int not null,
);

Create Table HaveProfession
(
	PersenelCode int not null Primary Key,
	Foreign Key ( PersenelCode ) References Expert( PersenelCode ),
	ProfCode int not null,
	Foreign Key ( ProfCode ) References Profession( ProfCode ),
	ProfLevel varchar( 8 ) Check( ProfLevel in ( 'High', 'Low', 'Medium' ) ),
);

Create Table TakeService
(
	PersenelCode int not null,
	Foreign Key ( PersenelCode ) References Expert( PersenelCode ),
	MemberShipCode int not null,
	Foreign Key ( MemberShipCode ) References Client( MemberShipCode ),
	Primary Key ( PersenelCode, MemberShipCode ),
	AddressDesc varchar( 100 ) not null, 
	TimeDesc time not null, --09:12:22
	TrafficCost varchar( 20 ),
	ProfessionCost varchar( 20 ),
	ExpertPoint int check( ExpertPoint >= 0 and ExpertPoint <= 100 ),
	ServiceCode int not null,
);

Create Table Complaining
(
	PersenelCode int not null,
	Foreign Key ( PersenelCode ) References Expert( PersenelCode ),
	MemberShipCode int not null,
	Foreign Key ( MemberShipCode ) References Client( MemberShipCode ),
	Primary Key ( PersenelCode, MemberShipCode ),
	ComplainDesc varchar( 100 ),
	ComplainCode int not null,
);

