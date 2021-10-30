------------------------employeeTable-------------------------------------------

CREATE TABLE Employee(
EID INTEGER ,
FName VARCHAR(20),
LName VARCHAR(20),
DOB DATE,
Gender VARCHAR(6),
PhoneNo INTEGER,
Salary INTEGER,
PRIMARY KEY(EID)
);

----------------------ResourcesTables------------------------------------------

CREATE TABLE Book(
ISBN INTEGER PRIMARY KEY,
BName VARCHAR(100),
Author VARCHAR(20) NOT NULL,
Publisher VARCHAR(50),
PublishingYear INTEGER,
PublishingCity VARCHAR(30),
EditionNo VARCHAR(15),
Category VARCHAR(50),
Status VARCHAR(2),
CallNo VARCHAR(20)
);

CREATE TABLE Recordings(
RID INTEGER PRIMARY KEY,
RName VARCHAR(100),
RType VARCHAR(15),
Publisher VARCHAR(50),
PublishingYear INTEGER,
PublishingCity VARCHAR(30),
Category VARCHAR(50),
Description VARCHAR(250),
Status VARCHAR(2),
CallNo Varchar(20)
);

CREATE TABLE Thesis(
TID INTEGER PRIMARY KEY,
TName VARCHAR(100),
Author VARCHAR(20) NOT NULL,
Category VARCHAR(50),
Status VARCHAR(10),
CallNo varchar(20)
);

CREATE TABLE Journal(
JID INTEGER PRIMARY KEY,
JTitle VARCHAR(100),
JType VARCHAR(50),
Category VARCHAR(50),
Status VARCHAR(20),
CallNo  varchar(20)
);

CREATE TABLE Room(
RNumber INTEGER PRIMARY KEY,
RType VARCHAR(20),
Time DATE,
Status VARCHAR(20),
Duration VARCHAR(20),
Location VARCHAR(20)
);
----------------------------------CirculationService---------------------------
CREATE TABLE CirculationService(
ServiceNo INTEGER PRIMARY KEY,
ServiceType VARCHAR(10),
MID INTEGER,
FOREIGN KEY(MID) REFERENCES Member(MID)
);
-------------------------------------MemberTable-------------------------------
CREATE TABLE MEMBER(
MID INTEGER PRIMARY KEY,
FName VARCHAR(20),
LName VARCHAR(20),
DOB Date,
Gender VARCHAR(6),
MType VARCHAR(30),
Privilege INTEGER,
Status VARCHAR(10),
Password INTEGER,
Email VARCHAR(20),
 Phone INTEGER,
JoinDate DATE,
ExpiryDate DATE,
City VARCHAR(50),
Street VARCHAR(50),
ZIPCode INTEGER
);

--------------------------------Privilege---------------------------------------
CREATE TABLE Privilege(
PNumber INTEGER PRIMARY KEY,
PName VARCHAR(30),
LoanPeriod VARCHAR(20),
MaxItems INTEGER,
MaxRenewal INTEGER
);


---------------------------------Fine-------------------------------------------
CREATE TABLE Fine(
Amount INTEGER,
FServiceNo INTEGER,
Description VARCHAR(250),
Status VARCHAR(10),
FOREIGN KEY(FServiceNo) REFERENCES CirculationService(ServiceNo)
);

--------------------------------------LoansTables-------------------------------
CREATE TABLE BookLoan(
LoanID INTEGER,
itemID INTEGER,
StartDate DATE,
EndDate DATE,
Status VARCHAR(10),
FOREIGN KEY(LoanID) REFERENCES CirculationService(ServiceNo),
FOREIGN KEY(ItemID) REFERENCES Book(ISBN)
);
CREATE TABLE MediaLoan(
LoanID INtEGER,
itemID INTEGER,
StartDate DATE,
EndDate DATE,
Status VARCHAR(10),
FOREIGN KEY(LoanID) REFERENCES CirculationService(ServiceNo),
FOREIGN KEY(ItemID) REFERENCES Recordings(RID)
);
CREATE TABLE ThesisLoan(
LoanID INTEGER,
itemID INTEGER,
StartDate DATE,
EndDate DATE,
Status VARCHAR(10),
FOREIGN KEY(LoanID) REFERENCES CirculationService(ServiceNo),
FOREIGN KEY(ItemID) REFERENCES Thesis(TID) );
CREATE TABLE JournalLoan(
LoanID INTEGER,
itemID INTEGER,
StartDate DATE,
EndDate DATE,
Status VARCHAR(10),
FOREIGN KEY(LoanID) REFERENCES CirculationService(ServiceNo),
FOREIGN KEY(ItemID) REFERENCES Journal(JID));
CREATE TABLE RoomReservation(
LoanID INtEGER,
itemID INTEGER,
StartDate DATE,
EndDate DATE,
Status VARCHAR(10),
FOREIGN KEY(LoanID) REFERENCES CirculationService(ServiceNo),
FOREIGN KEY(ItemID) REFERENCES Room(RNumber)
);

---------------------------------InalienableItemsTable--------------------------
CREATE TABLE Inalienable(
Item_ID INTEGER ,
Name VARCHAR(10),
Type    varchar(10),
Status VARCHAR(20),
CallNo VARCHAR(20),
PRIMARY KEY (Item_ID)
);

CREATE TABLE ShortLoan(
LID INTEGER,
ItemID INTEGER,
LoanPeriod INTEGER,
StartTime DATE,
EndTime DATE,
Status VARCHAR(10),
FOREIGN KEY(LID) REFERENCES CirculationService(ServiceNo),
FOREIGN KEY(ItemID) REFERENCES Inalienable(Item_ID));

ALTER TABLE MEMBER
ADD FOREIGN KEY (Privilege) REFERENCES Privilege(PNumber);
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

insert into employee values (1 , 'lama' , 'mohammed' , '2000-12-05' , 'F' , 0552553843 , 5480);
insert into employee values (2 , 'noura' , 'ali' , '1995-10-24' , 'F' , 0554433843 , 3720);
insert into employee values (3 , 'sama' , 'naser' , '1991-09-28' , 'F' , 0552775843 , 10600);
insert into employee values (4 , 'yara' , 'khaled' , '1998-04-20' , 'F' , 05234553843 , 6730);
insert into employee values (5 , 'wajed' , 'amer' , '1997-08-01' , 'F' , 05529342743 , 8200);


insert into ROOM values (111 , 'lap' , NULL , 'busy' , '4 HR' , 'F1' );
insert into ROOM values (131 , 'reading' , NULL , 'avaliable' , '2 HR' , 'F3' );
insert into ROOM values (132 , 'reading' , NULL , 'busy' , '3 HR' , 'F3' );
insert into ROOM values (121 , 'working' , NULL , 'avaliable' , '5 HR' , 'F2' );


insert into privilege values (1 , 'diamond' , '25 day' , 10 , 7);
insert into privilege values (2 , 'golden' , '20 day' , 7 , 5);
insert into privilege values (3 , 'selver' , '16 day' , 5 , 4);
insert into privilege values (4 , 'bronze' , '10 day' , 3 , 3);


insert into member values (1 , 'ali' , 'rashed' , '1995-12-18' , 'M' , 'staff' , 3 , 'Active' , 199592 , 'ali@gmil.com' , 0547229735 , '2021-03-17' , '2022-02-01' , 'qassim' , 'abubaker' , 124254 );
insert into member values (2 , 'hanan' , 'sami' , '2001-10-14' , 'F' , 'Student' , 1 , 'Active' , 199592 , 'hanan@gmil.com' , 0587223225 , '2020-09-08' , '2021-12-01' , 'Riaydh' , 'omarBinAlkatab' , 34564 );
insert into member values (3 , 'aml' , 'saleh' , '1995-11-05' , 'F' , 'Graduate' , 4 , 'InActive' , 199592 , 'aml@gmil.com' , 0523229735 , '2021-08-20' , '2022-05-01' , 'qassim' , 'KingSalman' , 12234 );
insert into member values (4 , 'saad' , 'waqas' , '1994-07-12' , 'M' , 'graduate' , 2 , 'InActive' , 199592 , 'saad@gmil.com' , 0565229735 , '2021-10-30' , '2022-09-01' , 'qassim' , 'KingAbdallah' , 122342 );



insert into circulationservice VALUES(1 , 'BookLoan' , 2);
insert into circulationservice VALUES(2 , 'shortLoan' , 1);
insert into circulationservice VALUES(3 , 'ThesisLoan' , 2);
insert into circulationservice VALUES(4 , 'jourlLoan' , 1);
insert into circulationservice VALUES(5 , 'ThesisLoan' , 2);
insert into circulationservice VALUES(6 , 'ThesisLoan' , 2);

insert into fine values (300 ,2, '2 books unreturned' , 'unpaid');
insert into fine values (150 ,1 ,  '2 thesis unreturnd' , 'paided');
insert into fine values (200, 3 ,'damaged' , 'unpaid');


insert into inalienable values(1 , 'UpInThMoon' , 'Book' , 'avaliable' , 'pk 123 456');
insert into inalienable values(2 , 'Culu1967' , 'Thesis' , 'avaliable' , 'SE 1463 723');
insert into inalienable values(3 , 'vid1950' , 'recourding' , 'unavaliable' , NULL);
insert into inalienable values(4 , 'nktimes93' , 'newspaper' , 'avaliable' , 'NP 995 397');


insert into thesis values(1 , 'compnw1994' , 'jaems nalson' , 'Technology' , 'avaliable' , 'TH 125 745');
insert into thesis values(2 , 'Advance culculas' , 'liam ash' , 'Sciences' , 'avaliable' , 'TH 234 834');
insert into thesis values(3 , 'MLA' , 'Paul Oliver' , 'Psychology' , 'avaliable' , 'TH 452 724');

insert into thesisloan values(3 , 2 , '2021-10-30' , '2021-11-12' , 'unreturnd');
insert into thesisloan values(5 , 1 , '2021-09-17' , '2021-10-29' , 'unreturnd');
insert into thesisloan values(6 , 3 , '2021-08-30' , '2021-09-12' , 'unreturnd');


insert into book values(1 , 'web knowledge' , 'khan' , NULL , 2012 , 'India' , '2' , 'Technology' ,NULL ,  'T' , 'BK 278 153');
insert into book values(2 , 'KBS and AI' , 'priti sajja' , NULL ,  2009,'UK' ,  '5' , 'Technology' ,NULL ,  'T' , 'BK 23 2424');
insert into book values(3 , 'history of King Abdalaziz ' ,'staffs of al-turath' , NULL, 2016 ,'Riyadh' ,  '6', 'History' , NULL ,'T' , 'BK 212 873');



-------------List the id, name and salary of staff ordered by staff salary------
select  EID , Fname , Lname, salary 
from EMPLOYEE
ORDER BY  salary;


------------List the available rooms--------------------------------------------

select RNumber 
from room
where status='avaliable';



---------------Total number of unpaid fines.------------------------------------

select sum(amount)
from fine
where status='unpaid';

----------------List the inalienable items--------------------------------------

select Name
from inalienable;

-----------------Total number of unreturned thesis------------------------------

select status   , COUNT(*)
from thesisloan
where status='unreturnd'
GROUP BY status;

--------------------Books in technology category--------------------------------

SELECT Bname 
from book  
where category='Technology';


---loan period and maximum number of items amember can borrow based on each privilege--
select  PNumber , LoanPeriod , MaxItems 
from privilege
order by Pnumber;


---------------inactive members' names and phone number-------------------------


select M.MID ,M.Fname , M.Lname , M.phone
from  member M
where  Status='InActive';


------------------------------View----------------------------------------------



CREATE OR REPLACE VIEW vBookStatus AS (
SELECT BName, Author, Status
FROM Book
WHERE Status='available'
);



-------------------------------CentrolAccess------------------------------------


CREATE ROLE BookRole IDENTIFIED BY Book123;
GRANT SELECT ON vBookStatus TO BookRole;
SET ROLE BookRole IDENTIFIED BY Book123;
CREATE USER A53287 IDENTIFIED BY Aa966;
GRANT BookRole TO A53287;


