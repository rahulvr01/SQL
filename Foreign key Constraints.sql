create database Lotus;
Use lotus;

create table products(pid int primary key,
pname varchar(20) not null, price decimal(10,2));

create table users(uid int primary key,
uname varchar(20) not null,mobile varchar(20) unique);

create table orders(oid int primary key,
userid int,pid int,
foreign key (userid) references users(uid));

desc orders;
desc users;
desc products;

# alter table tablename add foreign key (columnname)
# references parenttable(primarykey column);

alter table orders
add foreign key(pid) references products(pid);

# alter table tablename drop foreign key keyname;
# alter table tablename drop key keyname;

alter table orders drop foreign key orders_ibfk_1;
alter table orders drop key userid;
desc orders;

alter table orders drop foreign key orders_ibfk_2;
alter table orders drop key pid;

alter table orders add foreign key(pid) references products(pid)

alter table products modify pid primary key, pname varchar(20), price decimal(10,2); 

alter table orders drop foreign key orders_ibfk_1;
alter table orders drop key userid;

alter table orders drop foreign key orders_ibfk_2;
alter table orders drop key pid;

desc orders;

alter table orders drop primary key;
alter table orders modify oid int,userid int,pid int;

desc products;
alter table products drop primary key;
alter table products modify pid int;
alter table products modify pname varchar(50);

alter table products modify pname varchar(20) not null;
alter table products modify pname varchar(50);

alter table products modify pid int,pname varchar(20),
price decimal(10,2);

alter table products modify pname varchar(20);

use lotus;
desc products;
desc orders;

create database croma;
use croma;

create table users(uid int primary key,
uname varchar(20),mobile varchar(20));

create table orders(oid int primary key,
userid int,pid int,foreign key(userid) references users(uid));

insert into users(uid,uname,mobile)
values(1,"xyz","+9187347939"),
(2,"def","+91634834367"),
(3,"pqr","+91634789263"),
(4,"abc","+91673727847"),
(5,"prf","+914733783647");

select * from users;

insert into orders(oid,userid,pid)
values
(101,1,202),
(102,2,201),
(103,1,203),
(104,3,201),
(105,2,202);

select * from orders;

insert into orders(oid,userid,pid)
values(106,10,201);

select * from users;
select * from orders;

delete from users where uid=5;
delete from users where uid=1;

alter table orders drop foreign key orders_ibfk_1;
alter table orders drop key userid;

desc orders;

alter table orders add foreign key (userid) 
references users(uid) on delete set null;

use croma;
desc orders;
desc users;

alter table orders drop foreign key orders_ibfk_2;



