create database db3;
use db3;
create table ofc(oid int primary key,oname varchar(20) unique,age tinyint,ofc int unique,state varchar(20) not null, check (age>=18));
create table emp(eid int primary key,ename varchar(20) not null,officid int,state varchar(20) default "bhopal",mob varchar(20) unique,foreign key(officid) references ofc(oid));

alter table emp drop foreign key emp_ibfk_1;
alter table emp drop key officid;

alter table emp add foreign key (officid) references ofc(oid) 
on delete set null 
on update cascade;

alter table emp add foreign key (officid) references ofc(oid) 
on update cascade;
