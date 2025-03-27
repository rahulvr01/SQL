create database joinques;
use joinques;


CREATE TABLE `Sailors` (
  `sid` integer NOT NULL,
  `sname` varchar(10) NOT NULL,
  `rating` integer NOT NULL,
  `age` double NOT NULL
);
INSERT INTO Sailors ( sid, sname, rating, age) 
VALUES 
( 22, 'Dustin', 7, 45.0),
( 29, 'Brutus', 1, 33.0),
( 31, 'Lubber', 8, 55.5),
( 32, 'Andy', 8, 25.5),
( 58, 'Rusty', 10, 35.0),
( 64, 'Horatio', 7, 35.0),
( 71, 'Zorba', 10, 16.0),
( 74, 'Horatio', 9, 35.0),
( 85, 'Art', 3, 25.5),
( 95, 'Bob', 3, 63.5);


CREATE TABLE `Reserves` (
  `sid` integer NOT NULL,
  `bid` integer NOT NULL,
  `day` date NOT NULL
);

INSERT INTO Reserves ( sid, bid, day) 
VALUES 
( 22, 101, '1998-10-10'),
( 22, 102, '1998-10-10'),
( 22, 103, '1998-10-8'),
( 22, 104, '1998-10-7'),
( 31, 102, '1998-11-10'),
( 31, 103, '1998-11-6'),
( 31, 104, '1998-11-12'),
( 64, 101, '1998-9-5'),
( 64, 102, '1998-9-8'),
( 74, 103, '1998-9-8');


CREATE TABLE `Boats` (
  `bid` integer NOT NULL,
  `bname` varchar(10) NOT NULL,
  `color` varchar(10) NOT NULL
);
INSERT INTO Boats ( bid, bname, color) 
VALUES 
(101, 'Interlake', 'blue'),
(102, 'Interlake', 'red'),
(103, 'Clipper', 'green'),
(104, 'Marine', 'red');

#find the names of sailors who have reserved boats 103
select sname from sailors s 
inner join reserves r on s.sid=r.sid
where r.bid=103;

# find the colors of the boats reserved by lubber 
select color from Boats B 
inner join reserves r on B.bid=r.bid
inner join sailors s on s.sid=r.sid
where sname="Lubber";

# find the name of sailors who have reserved a red or green boats
select sname from sailors s
inner join reserves r on s.sid=r.sid
inner join boats B on B.bid=r.bid
where color in("red" or "green");

select distinct sname from sailors s
inner join reserves r on s.sid=r.sid
inner join boats B on B.bid=r.bid
where color in("red" or "green");


use dummy;
select * from payments;

# wasq to fetch the customers who have not made any payment fetch customername,customernumber
select customername,c.customernumber from customers c
left join payments p on c.customernumber=p.customernumber 
where p.customernumber is null;

#self join 
# works on inner , left and right join 

use dummy;
select * from dummy;

# wasq to fetch managers,and their report employees

select * from employees;

select m.employeenumber,concat(m.firstname," ",m.lastname) as manager,
concat(e.firstname," ",e.lastname) as directreport,
e.employeenumber from 
employees e inner join employees m
on m.employeeNumber=e.reportsTo;

select m.employeenumber,concat(m.firstname," ",m.lastname) as manager,
concat(e.firstname," ",e.lastname) as directreport,
e.employeenumber from 
employees e left join employees m
on m.employeeNumber=e.reportsTo;

select m.employeenumber,concat(m.firstname," ",m.lastname) as manager,
concat(e.firstname," ",e.lastname) as directreport,
e.employeenumber from 
employees e right join employees m
on m.employeeNumber=e.reportsTo;





