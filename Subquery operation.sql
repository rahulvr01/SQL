CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    manager_id INT
);
INSERT INTO Employee (emp_id, first_name, last_name, department_id, salary, manager_id) VALUES
(1, 'Michael', 'Anderson', 1, 5000, NULL),
(2, 'Sophia', 'Williams', 2, 6000, 1),
(3, 'David', 'Martinez', 1, 4500, 1),
(4, 'Olivia', 'Garcia', 3, 7000, 2),
(5, 'James', 'Rodriguez', 2, 5500, 1);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO Departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

select * from employee;
select * from departments;


# the operation of sub query 
# in a query where sub query is present , it will be running the sub query first and following it , the main query will run. 
select first_name,salary from employee 
where salary > (select avg(salary) from employee);

select avg(salary) from employee;




#  Find employees who earn more than the average salary of their department.
#  List departments with employees earning more than 6000.
#  Find employees working in the same department as 'Jane Smith'.
#  Retrieve the name of employees who don’t have a manager.
#  Find departments with no employees.
#  Get employees whose salary is higher than their manager's salary.
#  List the highest-paid employee in each department.
##  List employees with the same salary as ‘John Doe’.
#  Find the second-highest salary in the Employees table.
#  List employees who are managers.
#  Display the department with the highest average salary.
#  Get employees who work under 'Jane Smith'.
#  Retrieve employee details whose salary is above the company average.
#  Find the department with the most employees.
#  List employees whose salary is below the average of all employees.
#  Find employees in the same department as their manager.
#  Get employee names who are in the IT department but not managed by 'John Doe'.
#  Find employees who have the same manager as 'Bob Brown'.
#  Retrieve employees whose salary is above the salary of any employee in HR.



#1 
# Find employees who earn more than the average salary of their department.


-- select first_name, salary from employee
-- where salary > (select department_name,avg(salary) as avg_salary from employee e join departments d
-- on e.department_id = d.department_id 
-- group by department_name);

-------------------------------------------------------------------------------------------------------------

#1
select first_name, salary, department_name from employee e
inner join departments d 
on e.department_id = d.department_id 
where salary > (select avg(salary) from employee);


#2 
# List departments with employees earning more than 6000.
select department_name,first_name,last_name,salary from employee
inner join departments using(department_id) where department_id in (select department_id from employees where salary > 6000);

select * from employee;
select * from departments;


#3
# Find employees working in the same department as 'Jane Smith'.
select * from employee where department_id = (select department_id from employee where first_name ="James" and last_name ="Rodriguez");

#4 
# Retrieve the name of employees who don’t have a manager.
select first_name, last_name from employee where manager_id is null;


#5 
# Find departments with no employees.
select d.department_name from departments d inner join employee e on d.department_id = e.department_id where e.emp_id is null;

# with sub query 
select department_name from departments where department_id not in(select department_id from employee where department_id is not null);

#6
# Get employees whose salary is higher than their manager's salary.





