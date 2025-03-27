use dummy;
show tables;
select * from customers;
desc employees;

use dummy;
select 1+1;
select concat("welcome"," ","to"," ","bhopal");
select now();

# select from 
# syntax 
# select column_list from tablename
# order of execution
# from ------- select

select * from customers;

# wasq to fetch customername,customernumber,city,state,country

select customername,customernumber,city,state,country from customers;

select * from orderdetails;
desc orderdetails;

select ordernumber,productcode,(quantityordered*priceeach) as ordervalue from orderdetails;

select * from employees;
select employeenumber,concat(firstname," ",lastname) as empfullname,jobtitle from employees;

#wasq to fetch ordernumber,orderdate,status from orders table
select * from orders;

select ordernumber,orderdate,status from orders;

# sorting of data
# order by clause 
# syntax
# select column_list from tablename 
# order by columnname1 [asc|desc], columnname [asc|desc]
#  by default ascending order 
# order of execution from----------- select ------------ order by clause 

#wasq to sort the customers by there lastname in the ascending order display contactlastname and contactfullname

select contactlastname,contactfirstname from customers order by contactlastname;
select contactlastname,contactfirstname from customers order by contactlastname desc,contactFirstName asc;


# aliazing
use dummy;
select ordernumber,(quantityordered*priceeach) as ordervalue
from orderdetails
order by ordervalue desc;

# wasq to fetch employeenumber,firstname,lastname,reportsto,jobtitle
# column data from employee table?
# sort data/record by reportsto

select employeenumber,firstname,lastname,reportsto,jobtitle
from employees
order by reportsto asc;

# where clause
# -- from ------- where ------------- select ------- order by 
# syntax
# select columnlist from tablename where columnname operators condition
   

# wwasq to fetch customerdetail who are located in usa
# display customer name,customernumber,city,state,country 

select customername,customernumber,city,state,country
from customers
where country="usa";

# wasq to fetch employeesdeatil whoes jobtitle is salesrepresentative
-- display employeenumber,firstname,lastname,jobtitle

select employeenumber,firstname,lastname,jobtitle
from employees
where jobtitle="sales rep";

select * from employees

#wasq to fetch employeedetail except sales rep

select employeenumber,firstname,lastname,jobtitle
from employees
where jobtitle!="sales rep";

select employeenumber,firstname,lastname,jobtitle
from employees
where jobtitle!="sales rep";

#wasq to fetch customerdetails whoes credit limit is greater than = 10000
select customername,customernumber,creditlimit
from customers
where creditlimit >= 10000;

# and or operator
# wasq to fetch emplopyeesdetail whoes jobtitle are sales rep and officecode are 1

select employeenumber,firstname,lastname,jobtitle
from employees
where jobtitle = "sales rep" and officecode = 1;

#wasq to find employees who are located in the officecode if from 1 to 3 
select employeenumber,firstname,lastname,jobtitle,officecode
from employees
where officecode >=1 and officecode <=3;

# between
# between low and high
select employeenumber,firstname,lastname,jobtitle,officecode
from employees
where officecode between 1 and 3;

select employeenumber,firstname,lastname,jobtitle,officecode
from employees
where officecode >=1 or officecode <=3;

# wasq to find employeesdetails who are located in officecode=1,3,5
select employeenumber,firstname,lastname,jobtitle,officecode
from employees
where officecode in (1,3,5);

# wasq to fetch customersdetail who are located in usa,france,or japan 

use dummy;
select customername,customernumber,city,state,country
from customers
where country="usa" or country="france" or country="japan";

select customername,customernumber,city,state,country
from customers
where country in ("usa","france","japan");
# not in operators
select * from employees
where officecode not in (1,3,5);
# is null operators 
select customername,customernumber,city,state,country
from customers
where state is null;
# is not null operators
select customername,customernumber,city,state,country
from customers
where state is not null;

# limit
# from --- where -------- select ------ order by ------ limit 
select * from customers limit 5;
#wasq to fetch top 5 customers who have the highest credit limit 

select * from customers order by creditlimit desc limit 5;

select customername,customernumber,creditlimit
from customers order by creditlimit desc limit 1 offset 0;

select customername,customernumber,creditlimit
from customers order by creditlimit desc limit 1,3; # <----- 1 is offset and 3 is limit and seperated by comma (,)

#imp 
# like operators 
# use of string pattern matching 

# wasq to fetch customers details whose name start with A?
# a% is called startswith a
# %e is called endswith e
# &a& anywhere in the whole name will return the name

-- select customername,customernumber,country
-- from customers
-- where

#wasq to find employees fullname whoes lastname endswith son

select concat (firstname," ",lastname) as fullname
from employees
where lastname like "%son";

# wasq to fetch product name who contain car keywords 
select * from products;
select productname
from products 
where productname like "%car%";

select concat (firstname," ",lastname) as fullname
from employees
where lastname like "%son";

#wasq to find the customerdetails whoes name starts with vowel;
# wasq to find the customerdetails whoes name starts with vowel ends with vowel;

select customername from customers
where left(customername,1) in ("a","e","i","o","u") and right(customername,1) in ("a","e","i","o","u");
-- wasq  to find the customersname details whose name start whit vovle;;
-- wasq  to find the customersname details whose and ends with vouvel;
select * from customers where left(customername,1) in ("a","e","i","o","u") and right(customername,1) in ("a","e","i","o","u");

select * from customers where left(customername,1) in ("a","e","i","o","u");

-- select * from customers where customername like "a%"  or customername like "e%" or  customername like "i%"  or customername like "o%"  or customername like "u%" and where customername like "%a" or customername like "%e" or customername like "%i" or customername like "%o" or customername like "%u";
-- select * from customers where customername like "a%"  and customername like "%a" or customername like "i%" and customername like "%i" or customername like "e%" and customername like "%e" or customername like "o%" and customername like "%o" or customername like "u%" and customername like "%u";
select * from customers where customername like "a%"  and customername like "%a" or customername like "i%" and customername like "%i" or customername like "e%" and customername like "%e" or customername like "o%" and customername like "%o" or customername like "u%" and customername like "%u";
select * from customers where customername like "a%" or customername like "e%" or customername like "i%" or customername like "o%" or customername like "u%" and  customername like "%a" or customername like "%e" or customername like "%i" or customername like "%o" or customername like "%u" ;

# what is join
# join is clause which is used to combine records of two or more tables on the basis of related columns between them 
# types of join 
# never giv the number of joins


# CROSS JOINS
# IS ALSO KNOWN AS CARTESIAN JOIN
# (CROSS PRODUCT) -- NUMBER OF RECORDS IN TABLE1 MULTIPLY BY NUMBER OF RECORDS IN TABLE2(CONSIDER NULL ALSO)

# INNER JOINS 
# IS ALSO RETURNS MATCHED RECORDS 
# NOTE ---------> WITHOUT "ON" CONDITION INNER JOIN BEHAVES LIKE CROSS JOIN

# LEFT JOIN
# INNER + REMAINING VALUE OF LEFT TABLE 

# RIGHT JOIN
# INNER + REMAINING VALUE OF RIGHT TABLE 

# FULL 
# INNER + REMAINING VALUE OF LEFT TABLE + REMANING VALUE OF RIGHT TABLE 
# BY DEDUCTING INNER IN RIGHT/LEFT (ANYONE)


# NATURAL JOIN 
# WORKS ON COMMON COLUMNNAME 
# BEHAVE LIKE INNER JOIN IF BOTH COLUMN NAME IS SAME ------------> ANS 7 
# BEHAVE LIKE CROSS JOIN IF BOTH COLUMN NAME IS NOT SAME --------------> ANS 40 


# SELF JOIN
# WORKS ON HIERARCIAL TABLE
															
# MOST IMP 
# LEFT AND INNER JOIN 
