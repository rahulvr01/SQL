show databases;

# syntax use 
# use databasename
use sakila;
show tables;

# desc tablename
desc actor;


# create 
# syntax- create database databasename;
create database cybrom;
use cybrom;

create table student(sid int,sname varchar(20),
age tinyint,fees decimal(10,2),d_o_b date,
mobile varchar(20));

desc student;

# rename 
# rename table tableoldname to tablenewname;

rename table student to stu;
desc stu;

# drop 
# drop table tablename 

drop table stu;

# drop 
# drop database databasename;
drop database cybrom;

create database office;
use office;

create table emp(eid int,ename varchar(20),
age tinyint,d_o_j date,salary decimal(10,2),
mobile varchar(20));

desc emp;

rename table emp to employee;

# alter - for change in a n existing structure(table)
# alter - add column to an existing structure
# alter - table tablename add column columnname datatype;

alter table employee add column city varchar(20);
desc employee;

# alter table tablename drop column city;

alter table employee drop column city;

use office;
alter table employee rename column mobile to phone;

desc employee;

alter table employee drop column city;

desc employee;

#alter 
#change datatype
# alter table tablename modify  column columname datatype;

alter table employee modify column eid tinyint;

#change in the value of datatype 
alter table employee modify column ename varchar(50);

# insert 
# insert into tablename(column1,column2,column3,... columnn);
# values(value1,value2,value3,...valuen);
# single record insertion

insert into employee(eid,ename,age,d_o_j,salary,phone)
values
(1,"xyz",32,"2022-10-02",50000,"+9199272232414");

# select * from tablename;
select * from employee;

# multiple record insertion 
insert into employee(eid,ename,age,d_o_j,salary,phone)
values
(2,"abc",31,"2022-07-09",65000,"+914525255467"),
(3,"def",32,"2022-07-09",64000,"+9154263482");

use office;

# extension based insertion
insert into employee
set eid=104,ename="fed",age=34,d_o_j="2022-01-10",
salary=60000,phone="+918645625795";

select * from employee;

# update 
# syntax 
# update tablename set columnname=newvalue
# where column=datavalue;

update employee set ename="cybrom"
where eid=1;

set sql_safe_updates=0;
select * from employee;

# delete from tablename where columnname=datavalue;

delete from employee where eid=3;

start transaction;
delete from employee;
rollback;

select * from employee;

truncate table employee;




