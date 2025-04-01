create database group_by;
show tables;

#Create Products Table;
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    price DECIMAL(10, 2)
);

-- Creating Sales Table
CREATE TABLE Sale (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(10, 2)
);

-- Inserting Data into Products Table
INSERT INTO Product (product_id, product_name, category_id, price) VALUES
(1, 'Laptop', 1, 800.00),
(2, 'Smartphone', 1, 500.00),
(3, 'Tablet', 1, 300.00),
(4, 'Headphones', 2, 100.00),
(5, 'Smartwatch', 2, 200.00),
(6, 'Camera', 3, 600.00),
(7, 'Tripod', 3, 80.00),
(8, 'Lens', 3, 250.00),
(9, 'Television', 4, 900.00),
(10, 'Soundbar', 4, 150.00);

-- Inserting Data into Sales Table
INSERT INTO Sale (sale_id, product_id, sale_date, quantity, total_amount) VALUES
(1, 1, '2025-03-01', 2, 1600.00),
(2, 2, '2025-03-02', 3, 1500.00),
(3, 3, '2025-03-03', 1, 300.00),
(4, 4, '2025-03-01', 5, 500.00),
(5, 5, '2025-03-05', 2, 400.00),
(6, 6, '2025-03-06', 1, 600.00),
(7, 7, '2025-03-07', 4, 320.00),
(8, 8, '2025-03-08', 3, 750.00),
(9, 9, '2025-03-09', 2, 1800.00),
(10, 10, '2025-03-10', 3, 450.00),
(11, 1, '2025-03-11', 1, 800.00),
(12, 2, '2025-03-12', 2, 1000.00),
(13, 3, '2025-03-13', 4, 1200.00),
(14, 4, '2025-03-14', 3, 300.00),
(15, 5, '2025-03-15', 1, 200.00);


create database group_by;
use group_by;
show tables;
select * from sale;


with salesSummary as(
select 
product_id,sum(total_amount) as total_sale
from sale
group by product_id),
sales_q as (select * from salesSummary where total_sale > 1500),
more as (select * from sales_q where product_id =1),
productdetails as (select p.product_name,s.total_sale from product p join salesSummary s on p.product_id= s.product_id)

select * from more;



