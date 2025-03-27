create database rahul;
use rahul;
create table salestable(sale_id int primary key,product_id int, quantity_sold int, sale_date date, total_price decimal(10,2));
alter table salestable rename to sales;

#inserting sample data into sales table
insert into sales(sale_id,product_id,quantity_sold,sale_date,total_price)
values(1,101,5,"2024-01-01",2500),
(2,102,3,"2024-01-02",900),
(3,103,2,"2024-01-02",60),
(4,104,4,"2024-01-03",80),
(5,105,6,"2024-01-03",90);

desc sales;
select * from sales;

create table products(product_id int primary key, product_name varchar (20),category varchar(50),unit_price decimal(10,2));

# inserting sample data into products table
insert into products(product_id,product_name,category,unit_price)
values(101,"laptop","electronics",500),
(102,"smartphone","electronics",300),
(103,"headphones","electronics",30),
(104,"keyboard","electronics",20),
(105,"mouse","electronics",15);

desc products;
select * from products;

select product_name,unit_price from products;
select sale_id,sale_date from sales;


