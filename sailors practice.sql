use joinques;
CREATE TABLE SAILORS (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    rating INT,
    age DECIMAL(5,1)
);

INSERT INTO SAILORS (sid, sname, rating, age) VALUES
(22, 'Dustin', 7, 45),
(29, 'Brutus', 1, 33),
(31, 'Lubber', 8, 55.5),
(32, 'Andy', 8, 25.5),
(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),
(71, 'Zorba', 10, 16),
(74, 'Horatio', 9, 35),
(85, 'Art', 3, 25.5),
(95, 'Bob', 3, 63.5);

CREATE TABLE RESERVES (
    sid INT,
    bid INT,
    day DATE,
    PRIMARY KEY (sid, bid, day)
);

INSERT INTO RESERVES (sid, bid, day) VALUES
(22, 101, '1998-10-10'),
(22, 102, '1998-10-10'),
(22, 103, '1998-10-08'),
(22, 104+, '1998-10-07'),
(31, 102, '1998-11-10'),
(31, 103, '1998-11-06'),
(31, 104, '1998-11-12'),
(64, 101, '1998-09-05'),
(64, 102, '1998-09-08'),
(74, 103, '1998-09-08');

CREATE TABLE BOATS (
    bid INT PRIMARY KEY,
    bname VARCHAR(50),
    color VARCHAR(20)
);

INSERT INTO BOATS (bid, bname, color) VALUES
(101, 'Interlake', 'blue'),
(102, 'Interlake', 'red'),
(103, 'Clipper', 'green'),
(104, 'Marine', 'red');


select sname from sailors s 
inner join reserves r on s.sid=r.sid
where r.bid=103;

select sname from sailors s
inner join reserves r on s.sid=r.sid
inner join boats B on B.bid=r.bid
where color in("red" or "green"); 

select sname from sailors s
inner join reserves r on s.sid=r.sid
inner join boats B on B.bid=r.bid
where color in("red" or "green");



#1.Find the names of sailors who have reserved at least one boat.
select distinct sname from sailors1 s
inner join reserves1 r on s.sid=r.sid;

#2.Find the names of sailors who have not reserved any boat.
select distinct sname from sailors s left join reserves r on s.sid = r.sid where r.sid is null;

#3.Find the names of sailors along with the number of boats they have reserved.
select distinct sname,count(r.sid) from sailors s
inner join reserves r on s.sid=r.sid group by s.sname;

#4.Find the names of sailors who have reserved both a red and a blue boat.
select  sname, count(b.color)from sailors s inner join reserves r on s.sid = r.sid
inner join boats b on r.bid = b.bid where color in ("red" , "green") group by s.sname;

#5.Find the names of sailors who have reserved only red boats.
select distinct sname from sailors s inner join reserves r on s.sid=r.sid
inner join boats b on r.bid = b.bid where color in ("red");

#6.Find the sailor(s) who has reserved the maximum number of boats.

select sname,count(bid) as counts from sailors s inner join reserves r on s.sid = r.sid 
group by s.sname
order by counts desc
limit 1;

#7.Find the names of sailors who have reserved all types of boats (red, blue, and green).

select  distinct sname from sailors s inner join reserves r on s.sid = r.sid
inner join boats b on r.bid = b.bid where color in ("red","blue","green") ;

use dummy;
select ordernumber,sum(quantityordered * priceeach) as total_amount
from orderdetails group by ordernumber having total_amount >50000;


select ordernumber,sum(quantityordered * priceeach) as total_amount
from orderdetails group by ordernumber;

select customernumber, customername , count(ordernumber) as total_counts
from customers inner join orders using (customernumber) 
group by customernumber,customername having total_counts >3 
order by total_counts;

use joinques;
#8
SELECT s.sname FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
GROUP BY s.sid, s.sname
HAVING COUNT(DISTINCT day) >= 2;

SELECT DISTINCT b.bid, b.bname, b.color
FROM Boats b
JOIN Reserves r ON b.bid = r.bid
WHERE day BETWEEN '1998-10-01' AND '1998-10-31';


-- Find the names of sailors who have reserved all types of boats (red, blue, and green). 
SELECT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color IN ('red', 'blue', 'green')
GROUP BY s.sid, s.sname
HAVING COUNT(DISTINCT b.color) = 3;

-- Find the total number of reservations made for each boat.
select  b.bid, b.bname, COUNT(r.sid) as total_reservations
from  Boats b
inner join Reserves r on b.bid = r.bid
group by b.bid, b.bname;
















