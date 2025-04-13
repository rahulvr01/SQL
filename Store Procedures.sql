# store procedures 

create database store;
use store;
CREATE TABLE Employeesss (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
    
);



INSERT INTO Employeesss VALUES
(1, 'John', 'Doe', 1, 5000.00),
(2, 'Jane', 'Smith', 2, 6500.00),
(3, 'Alice', 'Brown', 1, 7200.00),
(4, 'Bob', 'Johnson', 3, 4800.00),
(5, 'Emma', 'Davis', 2, 7000.00);

select * from employeesss;
Delimiter //
create procedure getdeptinfo(in deptid int) 
begin 
select first_name,last_name,salary
from employeesss where department_id =deptid;
end //
delimiter ;

call getdeptinfo(1);



select * from employeesss;
Delimiter //
create procedure getempid(in employee_id int) 
begin 
select first_name,last_name,salary 
from employeesss where emp_id=employee_id;
end //
delimiter ;

call getempid(2);



select * from Employeesss;
delimiter //
create procedure getcountinfo(out total int)
begin 
select count(emp_id) as total from Employeesss;
end //
delimiter ;

call getcountinfo (@total);


use store;
delimiter //
create procedure addbonus(in empid int,inout newsalary decimal(10,2)) 
begin 
select salary*1.10 into newsalary from employeesss
where emp_id = empid;

update employeesss set salary = newsalary
where emp_id=empid;
end //

delimiter //
set @salary = 0;
call addbonus (3,@salary);
select @salary as newsalary;


