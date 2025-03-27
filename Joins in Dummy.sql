use dummy;
# wasq to fetch customername and their respective sales rep 

select customername,employeenumber,
concat(firstname," ",lastname) as empname
from employees e
inner join customers c
on e.employeenumber = c.salesrepemployeenumber;

# wasq to fetch customername,ordernumber,orderdate,ordervalue,productcode,productname from customers,orders,orderdetails,products table

select customername,o.ordernumber,orderdate,(quantityordered*priceeach) as ordervalue,p.productcode,productname
from customers c
inner join orders o on c.customernumber=o.customernumber
inner join orderdetails od on
o.ordernumber=od.ordernumber
inner join products p on od.productcode=p.productcode;

# wasq to fetch customername and their respective sales rep name and also fetch order date and order status
select customername,status,concat(firstname," ",lastname) as empname,ordernumber
from customers c
inner join orders o on c.customernumber=o.customernumber
inner join employees e on 
c.salesrepemployeenumber=e.employeenumber;

# wasq to fetch customers who have not placed any order (24)
# wasq to fetch products who have not sold (1)

use dummy;

With cte as ( select customername , sum(quantityordered*priceeach) as totalspending 
from customers c inner join orders o on c.customernumber=o.customernumber
Inner join orderdetails od
On o.ordernumber=od.ordernumber
Group by customername 
),
Cte1  as( Select *, Dense_rank() over(order by totalspending desc) as drank from cte)
Select * from cte1 where Drank<=3;

select * from products;


-- with pr as(select productline, productname, sum(quantityordered*priceeach) as totalsales from products p 

select productline, productname, sum(quantityordered*priceeach) as totalsales from products p
inner join orderdetails od on p.productcode=od.productcode;	

use dummy;
-- wasq to fetch customername   cusotomers who have not place anyorder   24
select customername from customers c
left join orders o
on c.customernumber=o.customernumber
where o.customernumber is null;



-- wasq to fetch  products who have not sold  1

select productname,p.productcode from products p
left join orderdetails od 
on p.productcode=od.productcode
where od.productcode is null;


# group by
# is clause that groups similar records into a summary record based on column value or impressions
# it reduces the number value of into a one row for each group 

# syntax 
# select c1.c2,c3,c4... cn ( aggre. column) 
# from tablename group by c1,c2,c3,c4..cn(only the categorical data values) 

# wasq to fetch unqiue records from status columns
use dummy;
select status from orders;

select distinct status from orders;

select status from orders
group by status;

#wasq to fetch customer and their order count 

select customernumber,customername, 
count(ordernumber) as ordercount 
from customers inner join orders 
using (customernumber)
group by customernumber,customername
order by ordercount desc;

#2
select customernumber,customername, 
count(ordernumber) as ordercount 
from customers inner join orders 
using (customernumber)
group by 1,2
order by ordercount desc;

#3
select count(ordernumber)as ordercount,customernumber,customername
from customers inner join orders 
using (customernumber)
group by 2,3
order by ordercount desc;

# wasq to fetch customer and their total sales 
select c.customersname, c.customernumber,count(quantityordered*priceeach) as totalsales
from customers c inner join orders o 
on c.customernumber=o.customernumber 
group by c.customername,c.customernumber;

select c.customersname,sum(quantityordered*priceeach) as totalsales
from customers c inner join orders o 
on c.customernumber=o.customernumber 
inner join orderdetails od 
on o.ordernumber=od.ordernumber
group by c.customername,totalsales;

select customername,sum(quantityordered*priceeach) as totalsales
from customers inner join 
orders using(customernumber)
inner join orderdetails using(ordernumber)
group by customername;


# wasq to fetch total order value foreach product line ? 
# wasq to fetch total order value by product line for each year 

select productline,sum(quantityordered*priceeach) as totalordervalue 
from products inner join 
orderdetails using(productcode)
group by productline;

select * from orders;
select productline,year(orderdate) as orderyear,sum(quantityordered*priceeach) as totalordervalue 
from products inner join orderdetails 
using(productcode) 
inner join orders using(ordernumber) 
group by productline,orderyear
having orderyear=2004 and totalordervalue>500000;



# wasq to fetch total sales for each year 
select year(orderdate) as orderyear, sum(quantityordered*priceeach) as totalordervalue
from orders inner join orderdetails
using(ordernumber)
group by orderyear
having orderyear>2003 and totalordervalue >2003
order by totalordervalue desc;


# wasq to fetch ordernumber,the numbers of item sold per order and total sales for each order and find the order having total sales greater than 10000,
# and total item count is more than 600

select ordernumber,sum(quantityordered*priceeach) as totalsales,sum(quantityordered) as itemcounts 
from orderdetails 
group by ordernumber
having totalsales>10000 and itemcounts>600;

# wasq that returns order year , order status , and total order value for each combination of year and order status 

select year(orderdate) as orderyear,status, sum(quantityordered*priceeach) as totalordervalue 
from orders inner join orderdetails 
using (ordernumber)
group by 1,2;

# wasq that returns total ordervalue summarised by productline and orderyear 


-- select year(orderdate) as orderyear,productline,sum(quantityordered*priceeach) as totalordervalue

create table sales
select productline,year(orderdate) as orderyear,
from products inner join orderdetails 
using(productcode) 
inner join orders using(ordernumber) 
group by productline,orderyear;

select * from sales;
use dummy;

# roll up ---- that uses with group by 
# returns the total and grandtotal 

# wasq to fetch totalordervalue?
select sum(ordervalue) as totalordervalue from sales;

# wasq to fetch totalordervalue by productline?

select productline,sum(totalordervalue)
from sales 
group by productline
union 
select "totalsum",sum(totalordervalue) from sales;

select ifnull(productline,"totalsum") as productline,sum(totalordervalue) from sales 
group by productline with rollup;

select productline,orderyear,sum(totalordervalue) from sales 
group by productline,orderyear with rollup;

select productline,orderyear,sum(totalordervalue) from sales 
group by orderyear,productline with rollup;


# wasq to cal the avg buy price of all the products 
# wasq to cal the avg buy price of classic cars
# wasq to fetch any products which have the same buy price
# wasq to find avg buy price of products for each productline
# wasq to find buy price of each productline who have by average by greater than 50
# wasq to find maximum min avg buy price of products 

select avg(buyprice) from products;

use dummy;

# wasq to fetch customer and their sales representatives;

select concat(firstname,lastname),jobtitle
from employees
where jobtitle = "sales rep";
select distinct count(*) ;
select concat(firstname,lastname) as fullname,
group_concat(distinct customername order by customername) as customernames
from employees e 
inner join customers c 
on e.employeeNumber=c.salesrepemployeenumber
group by fullname
order by fullname desc;

# wasq to find customers name customernumber and their order count
use dummy;

with cte as(
select customername,c.customernumber,count(*) as ordercount
from customer c
inner join orders o on c.customernumber=o.customernumber
group by customername,customernumber)

select *, 
case ordercount
when 1 then "one time customer"
when 2 then "repeated customer"
when 3 then "frequent customer"
else "loyal customer" end
as customertype
from cte;

# wasq to customername and their total sales on the basis of total sales create a conditional column and the conditions are 
# if total sales is less than 10k than silver 
# 10k-100k = gold customers
# 100k > = platinum customers

with cte as(
select c.customername ,sum(quantityordered*priceeach) as totalsales
from customers c
inner join orderdetails od
on c.customernumber=od.customernumber
inner join orders 
on od.ordernumber=o.ordernumber
group by customername)
select *,
case when totalsales<10000 then "silver customer"
when totalsales =10000 and 100000 then "gold customer"
when totalsales >100000 then "platinum customer"
end as customertype from cte;


with cte as(
select c.customername ,sum(quantityordered*priceeach) as totalsales
from customers c
inner join orders o using(customernumber)
inner join orderdetails using(ordernumber)
group by 1),cte1 as
(select *,
case when totalsales<10000 then "silver customer"
when totalsales between 10000 and 100000 then "gold customer"
when totalsales >100000 then "platinum customer"
end as customertype from cte) 
select customertype,count(customertype) as customertypecount
from cte1 group by customertype;


with cte as 
(select c.customernumber,customername,
count(*) as ordercount 
from customers c inner join 
orders o 
on c.customernumber=o.customernumber
group by 1,2)
select *,
if(ordercount=1,"onetimecustomer",
	if(ordercount=2,"repeatedcustomer",
		if(ordercount=3,"frequentcustomer","loyalcustomer")))
as customertype
from cte;

with cte as
(select c.customernumber,customername,
count(*) as ordercount 
from customers c inner join 
orders o 
on c.customernumber=o.customernumber
group by 1,2)
select *, 
case when ordercount=1 then "onetimecustomer"
when ordercount=2 then "repeatedcustomer"
when ordercount=3 then "frequentcustomer"
else "loyalcustomer"
end as customertype
from cte;

select 
sum(if(status="shipped",1,0)) as "shipped",
sum(if(status="resolved",1,0)) as "resolved",
sum(if(status="disputed",1,0)) as "disputed",
sum(if(status="cancelled",1,0)) as "cancelled",
sum(if(status="on hold",1,0)) as "on hold",
sum(if(status="in process",1,0)) as "in process",
count(*) as totalorder
from orders;

# wasq to fetch customername, state , country from customers sort the customers by state if the stata is not null or sort the country in case the state is null 

select customername,state,country 
from customers 
order by 
case when state is null then country else state end
asc;


# sir's formulae by case when 
select customername,state,country 
from customers
order by 
(case when state is null then country else state end)
asc;

# sir's formulae by if else
select customername,state,country 
from customers
order by if(state is null,country,state) asc;

# if null function
# ifnull(column,value)

select customername,city,ifnull(state,"n/a") as state,country 
from customers;

select customername,city,coalesce(state,"n/a") as state,country 
from customers;

create table phone(pno int,ono int,hno int);
insert into phone(pno,ono,hno)
value(91,null,null),
(null,85,null),
(90,89,88),
(null,null,78),
(99,98,null);

select ifnull(pno,hno) as p from phone;
select coalesce(pno,ono,hno) as p from phone;

use dummy;

select concat_ws(" ","welcome","to","bhopal");
select upper ("cybrom");
select lower ("CYBROM");
select left("cybrom",2);
select right("cybrom",2);


# wasq to fetch customername whose name starts with vowel and ends with consonants

select customername from customers 
where left(customername,1) in ("a","e","i","o","u")
and right(customername,1) not in ("a","e","i","o","u");

# substring 
# syntax(string,position,no.ofcharacter)

select substring("cybrom",-3,1);

select substring(customername,1,"aeiou");

select customername from customers
where substring(customername,1,1) in ("a","e","i","o","u")
and substring(customername,-1,1) not in ("a","e","i","o","u");

# trim(string)
select trim("            welcome  to  bhopal");

# reverse(string)
select reverse("cybrom");

# replace(string,oldstring,newstring)
select replace("welcome to cybrom","cybrom","bhopal");

# length(string) 
select length("cybrom");

#instr(string,substring)
select instr("welcome to bhopal","o");

# wasq to fetch productname that contain car key word in it 
select productname from products 
where instr(productname,"car");

# datetime fn 
select curdate();
select current_date();
select sysdate(); #returns the date and time of that particular time period
select current_time();
select now(); 


select year(now());
select month(now());
select monthname(now());
select quarter(now());
select date(now());
select time(now());
select week(now());
select weekday(now()); # it assumes tuesday as 1 and because of thursday it will return 3













select count(*) from customers;



