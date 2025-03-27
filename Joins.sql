create database joins11;
use joins11;

create table table1(id int);
create table table2(id int);

insert into table1(id) values
(1),(1),(1),(2),(3),(3),(3),(null);

insert into table2(id) values
(1),(1),(2),(4),(null);

select * from table1;
select * from table2;

# cross join ---- cartesian join
# no of records of table1 multiply by no of records of table2
# syntax
# select columnlist from tablename cross join tablename;
# note --- cross join with ON keyword it behaves like inner join

select * from table1 cross join table2;
select count(*) from table1 cross join table2;

select count(*) from table1 t1 cross join table2 t2 
on t1.id=t2.id;

# inner join 
# returns matched records between two tables
# syntax 
# select columnlist from tablename inner join/join tablename 
# on tablename.commoncolumn=tablename.commoncolumnname;

select * from table1 inner join table2; # agr no nhi hoga toh behave like cross join 
select * from table1 t1 inner join table2 t2
on t1.id=t2.id;

select count(*) from table1 t1 inner join table2 t2
on t1.id=t2.id;


# left join 
# inner join + remaining value of left table

select * from table1 t1 left join table2 t2 
on t1.id=t2.id;
select count(*) from table1 t1 left join table2 t2 
on t1.id=t2.id;

# right join
select * from table1 t1 right join table2 t2 
on t1.id=t2.id;
select count(*) from table1 t1 right join table2 t2 
on t1.id=t2.id;

# natural join 
select count(*) from table1 full join table2;
select count(*) from table1 natural join table2;

alter table table2 rename column id to eid;
use joins11;
alter table table2 rename columm eid to id;

alter table table2 rename column eid to id;
alter table table2 rename column eid to id;

# right exclusive join (not a type of join)

select count(*) from table1 t1
left join table2 t2 on t1.id=t2.id
union 
select count(*) from table1 t1 
right join table2 t2 on t1.id=t2.id
where t1.id is null;

# left exclusiove join (not a type of join)

select count(*) from table1 t1 
right join table2 t2 on t1.id=t2.id
union all
select count(*) from table1 t1
left join table2 t2 on t1.id=t2.id
where t1.id is null;


select count(*) from table1 t1 
right join table2 t2 on t1.id=t2.id
union all
select count(*) from table1 t1
left join table2 t2 on t1.id=t2.id
where t2.id is null;


use dummy;

# cross join on dummy database 
select count(*) from customers 
cross join orders;

# inner join 
select customername,c.customernumber from 
customers c
inner join orders o 
on c.customernumber=o.customernumber;

# left join
select customername,c.customernumber from 
customers c 
left join orders o 
on c.customernumber=o.customernumber;

select customername,c.customernumber from 
customers c 
right join orders o 
on c.customernumber=o.customernumber;


