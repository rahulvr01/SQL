-- Write a CTE to calculate the total salary (base salary + bonus - deductions) for each employee in the payroll table. Return employee name, department, and total salary.
with get_total_salary as 
(select e.first_name,e.last_name,p.base_salary+p.bonus-p.deductions,d.department_name from employees e
inner join payroll p using (emp_id) 
inner join departments d using(department_id))
select * from get_total_salary;

	

-- Write a CTE to find employees who joined after 2021 and calculate the number of months they have worked in the company.
with month_count
(select e.first_name,e.last_name,year(hire_date)-year(pay_period);



with month_count as (select e.first_Name,e.last_name,timestampdiff(month,hire_date,curdate()) as month_count,
p.base_salary+p.bonus-p.deductions from employees e
join payroll p 
using(emp_id) where hire_date > "2021-01-01")
select * from month_count;



-- Using a CTE, calculate the average salary of employees in each department.

with avg_salary as (select e.emp_id,e.first_name,e.last_name,avg(base_salary) as avg_salary,d.department_id,d.department_name from employees e 
join payroll p using(emp_id) 
join departments d using(department_id)
group by department_name)
select * from avg_salary;




-- Write a CTE to rank employees based on their total salary in descending order. Display employee name, department, total salary, and rank.





-- Create a CTE to list employees who earn more than the average salary of their department.