create database db2;
use db2;
create table ofc(oid int primary key,oname varchar(20) unique,age tinyint,ofc int unique,state varchar(20) not null, check (age>=18));
create table emp(eid int primary key,ename varchar(20) not null,officid int,state varchar(20) default "bhopal",mob varchar(20) unique,foreign key(officid) references office(oid));
alter table emp add column mob varchar(20) unique;

alter table emp add primary key(eid);
alter table emp add unique(mob);
alter table emp add foreign key (officid) references ofc(oid);
alter table ofc add constraint check (age>=18);

alter table emp modify ename varchar(20) not null,modify state varchar(20) default "bhopal";
alter table ofc add unique(oname);
alter table ofc add unique(ofc);
alter table ofc modify state varchar(30) not null;

desc emp;
desc ofc;
alter table emp add foreign key(officid) references ofc(oid);
alter table ofc add primary key(oid);

alter table emp drop foreign key emp_ibfk_1;
alter table emp drop key officid;
alter table emp add foreign key (officid) references ofc(oid) on delete set null on update set cascade;
























alter table office rename column ofcode to ofc;
rename table office to ofc;
rename table employee to emp;
alter table emp drop primary key,drop key mob;
alter table emp modify eid int,modify ename varchar(20),modify state varchar(20);
alter table emp drop foreign key emp_ibfk_1,drop key officid;

alter table ofc drop primary key;
alter table ofc drop key oname;
alter table ofc drop key ofcode ;
alter table ofc drop constraint ofc_chk_1;
desc ofc;

alter table ofc modify oid int,modify state varchar(20);
desc ofc;
desc emp;
alter table ofc modify oid int ,modify state varchar(20);