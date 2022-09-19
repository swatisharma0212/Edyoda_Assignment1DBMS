create database ecomm;

create table ecomm.SalesPeople
(
Snum int primary key,
Sname varchar(10) unique,
City varchar(20),
Comm int NOT NULL
);
Insert into ecomm.SalesPeople(Snum,Sname,City,Comm)
Values(1001,"Peel","London",12),
(1002,"Serres","Sanjos",13),
(1004,"Motika","London",11),
(1007,"Rifkin","Barcelona",15),
(1003,"Axelrod","Newyork",10);


create table ecomm.Customers
(
Cnum int primary key,
Cname varchar(10) ,
City varchar(20) not null,
Snum int,
foreign key (Snum) references ecomm.salespeople(Snum)
);

Insert into ecomm.Customers(Cnum,Cname,City)
Values(2001,"Hoffman","London"),
(2002,"Giovanni","Rome"),
(2003,"Grass","Berlin"),
(2004,"Liu","Sanjose"),
(2006,"Clemens","London"),

(2008,"Cisneros","Sanjose"),
(2007,"Pereira","rome");


create table ecomm.Orders
(
Onum int primary key,
Amt float,
Odate Date,
Cnum int,
Snum int,
foreign key (Cnum) references ecomm.Customers(Cnum),
foreign key (Snum) references ecomm.Salespeople(Snum)
);

Insert into ecomm.Orders(Onum,Amt,Odate)
Values(3001,18.69,'1990-10-03'),
(3003,767.19,'1990-10-03'),
(3002,1900.10,'1990-10-03'),
(3005,5160.45,'1990-10-03'),

(3006,1098.16,'1990-10-03'),
(3009,1713.23,'1990-10-04'),
(3007,75.75,'1990-10-04'),
(3008,4273.00,'1990-10-05'),
(3010,1309.95,'1990-10-06'),
(3011,9891.88,'1990-10-06');


select * from ecomm.salespeople;
select * from ecomm.customers;

update ecomm.Customers Set Snum = 1001 where Cnum = 2001;
update ecomm.Customers Set Snum = 1003 where Cnum = 2002;
update ecomm.Customers Set Snum = 1002 where Cnum = 2003;
update ecomm.Customers Set Snum = 1002 where Cnum = 2004;
update ecomm.Customers Set Snum = 1001 where Cnum = 2006;
update ecomm.Customers Set Snum = 1007 where Cnum = 2008;
update ecomm.Customers Set Snum = 1004 where Cnum = 2007;

update ecomm.orders set Cnum=2008 where Onum=3001;
update ecomm.orders set Snum=1007 where Onum=3001;
update ecomm.orders set Cnum=2001,Snum=1001 where Onum=3003;
update ecomm.orders set Cnum=2007,Snum=1004 where Onum=3002;
update ecomm.orders set Cnum=2003,Snum=1002 where Onum=3005;
update ecomm.orders set Cnum=2008,Snum=1007 where Onum=3006;
update ecomm.orders set Cnum=2002,Snum=1003 where Onum=3009;
update ecomm.orders set Cnum=2004,Snum=1002 where Onum=3007;
update ecomm.orders set Cnum=2006,Snum=1001 where Onum=3008;
update ecomm.orders set Cnum=2004,Snum=1002 where Onum=3010;
update ecomm.orders set Cnum=2006,Snum=1001 where Onum=3011;

select * from ecomm.orders;
select * from salespeople;

select count(*) from ecomm.salespeople where Sname like 'a%' or 'A%';

select s.snum,s.Sname,sum(o.Amt) as Amt from salespeople s inner join  orders o on s.Snum=o.Snum where o.Amt>2000 group by o.snum;

select count(Sname) from salespeople where city='Newyork';

select count(Sname) from salespeople where city in('London','Paris');

select count(cnum),snum,odate from orders group by snum;


