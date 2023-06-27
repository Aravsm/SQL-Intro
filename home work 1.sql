-- Create Table on Database and insert Names with Age and Deleate it;

create database peoplelist;
use peoplelist;
create table people(
First_Name varchar (20),
Last_Name varchar (20),
Age Int
);
use peoplelist;
create table people(
First_Name varchar (20),
Last_Name Varchar (20),
Age Int

);
insert into people (First_name,Last_name,Age) values ('Ram','varma',25), ('Laxman' ,'Sharma', 28),
('Ravi', 'Tiwari', 30), ( 'Shivam', 'Datta', 35);
Select *From People;
drop table people;
drop database peoplelist;