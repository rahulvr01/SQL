# table creation with help of constraints
create database bank;
use bank;

create table customers
(cid int primary key,cname varchar(20) not null,
age tinyint,gender varchar(20),mobile varchar(20) unique,
city varchar(20) default "bhopal",check(age>=18));

desc customers;

# check = syntax tablename_chk_1 (where 1 is no. of columns to check)
# primary key = no name 
# Unique = name of the particular column 

# remove primary key 
# alter table tablename drop primary key;

alter table customers drop primary key;
alter table customers modify cid int;

# primary key , check and unique use drop 
# default and not null use modify

# not null 
# alter table tablename modify columnname datatype;

alter table customers modify cname varchar(50);
desc customers;

# start transaction works in insert , update and delete 

# default 
# alter table tablename modify columnname datatype;

alter table customers modify city varchar(20);
desc customers;


# check constraint
# alter table tablename drop constraint constraintname;

alter table customers drop constraint customers_chk_1;

use bank;

# unique table customers drop key/index/constraint uniquekeyname

alter table customers drop key mobile;
desc customers; 

# add constraint
# primary key
# alter tabl tablename add primary key(*column name);

alter table customers add primary key(cid);
desc customers;

# not null 
# alter table tablename modify columnname datatype not null;

alter table customers modify cname varchar(50) not null;

# default
# alter table tablename modify columnname datatype default "value";

alter table customers modify city varchar(50) 
default "bhopal";
desc customers;

# unique
# alter table tablename add unique(columnname);

alter table customers add unique(mobile);
desc customers;

# check 
# alter table tablename add constraint check(columnnname)

alter table customers add constraint check(age>=18);
desc customers;





