create database windows;
use windows;
CREATE TABLE saless(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);

INSERT INTO saless(sales_employee,fiscal_year,sale)
VALUES
('Bob',2016,100),
('Bob',2017,150),
('Bob',2018,200),
('Alice',2016,150),
('Alice',2017,100),
('Alice',2018,200),
('John',2016,200),
('John',2017,150),
('John',2018,250);


select * from saless;

select sales_employee,fiscal_year,sale,
row_number() over (order by sale desc) 
as no from saless;

select sales_employee,fiscal_year,sale,
dense_rank() over (partition by sales_employee order by sale)
as no from saless;

select sales_employee,fiscal_year,sale,
sum(sale) over (partition by sales_employee order by sale desc)
as no from saless;

select sales_employee,sale,
sum(sale) over(partition by sales_employee order by sale desc)
as total_sales from saless;


select sales_employee,fiscal_year,sale,
first_value(sale) over (partition by sales_employee order by sale desc) 
as total_sales from saless;

# first_value() gives the co parative function that gives the highest value in every group (comparative analysis) 

select sales_employee,fiscal_year,sale,
cume_dist() over (partition by sales_employee order by sale desc) 
as total_sales from saless;





      
      