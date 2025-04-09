create database windowss;
use windowss;
CREATE TABLE sales_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sales_rep VARCHAR(50),
    region VARCHAR(50),
    product VARCHAR(50),
    month VARCHAR(20),
    sales_amount DECIMAL(10,2)
);



INSERT INTO sales_data (sales_rep, region, product, month, sales_amount) VALUES
('Alice', 'North', 'Laptop', 'Jan', 1200.00),
('Bob', 'South', 'Tablet', 'Jan', 800.00),
('Charlie', 'East', 'Laptop', 'Jan', 950.00),
('David', 'West', 'Phone', 'Jan', 600.00),
('Eva', 'North', 'Tablet', 'Feb', 1100.00),
('Alice', 'North', 'Laptop', 'Feb', 1300.00),
('Bob', 'South', 'Tablet', 'Feb', 850.00),
('Charlie', 'East', 'Laptop', 'Feb', 1000.00),
('David', 'West', 'Phone', 'Feb', 700.00),
('Eva', 'North', 'Tablet', 'Mar', 1200.00),
('Alice', 'North', 'Laptop', 'Mar', 1250.00),
('Bob', 'South', 'Tablet', 'Mar', 900.00),
('Charlie', 'East', 'Laptop', 'Mar', 1050.00),
('David', 'West', 'Phone', 'Mar', 650.00),
('Eva', 'North', 'Tablet', 'Apr', 1150.00),
('Alice', 'North', 'Laptop', 'Apr', 1400.00),
('Bob', 'South', 'Tablet', 'Apr', 950.00),
('Charlie', 'East', 'Laptop', 'Apr', 1100.00),
('David', 'West', 'Phone', 'Apr', 800.00),
('Eva', 'North', 'Tablet', 'May', 1180.00),
('Alice', 'North', 'Laptop', 'May', 1350.00);

use windowss;



-- Rank sales reps by their total sales within each month.
select sales_rep,sales_amount,month,
rank() over (partition by month order by sales_amount desc) 
as total_sales from sales_data;

-- Show the cumulative (running) total of sales for each sales rep across months.
select sales_rep,sales_amount,
sum(sales_amount) over (partition by month order by sales_rep ) 
as total_sales from sales_data;

-- Find the average monthly sales amount for each region.
select sales_amount,region,month,
avg(sales_amount) over (partition by region order by month) 
as avg_sales from sales_data;




-- Compare each month’s sales amount with the previous month's sales for each sales rep.
-- (Use LAG() window function)
select sales_rep,sales_amount,month,
lag(sales_amount) over (partition by month order by sales_rep) 
as lag_amount from sales_data;


-- Find the sales amount of the next month for each sales rep.
-- (Use LEAD() window function)
select sales_rep,month,sales_amount,
lead(sales_amount) over (partition by month order by sales_rep) 
as lead_amount from sales_data;






-- 🚀 Intermediate Level Questions
-- Find what percentage of the total regional sales is contributed by each record.
-- (Use SUM() in denominator and compute percentage)
select sales_rep,region,sales_amount,
round(sales_amount)*100/sum(sales_amount) over (partition by region ) 
as percent_amt from sales_data;




-- For each sales rep, find their highest monthly sales amount (and display it alongside each row).
-- (Use MAX() as window function)
select sales_rep,region,sales_amount,
max(sales_amount) over (partition by month order by sales_amount desc) 
as max_sales from sales_data;


-- Check whether each sales rep’s sales increased or not compared to their previous month.
-- (Use LAG() with CASE WHEN logic)
select sales_rep,region,sales_amount,
lag(sales_amount) over (partition by month order by sales_amount desc) as max_sales,
case when max_sales > sales_amount "Increased" then "Not Increased" from sales_data;




Assign a row number to each sales rep within their region and month based on sales amount.
(Use ROW_NUMBER() function)
Compare each record’s sales amount with the average sales of that region and month.
