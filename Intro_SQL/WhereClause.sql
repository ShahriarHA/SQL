select * from employee.employee;
select * from employee.employee where City = "Pune";
select Education,City,Age,Gender from employee.employee where City = "Pune" and Gender = "Male";

-- LIKE statement
-- % it means anything and _ it means specific value 
select * from sys.sys_config;
select * from sys.sys_config where variable like "%ement%";
select * from employee.employee;
select * from employee.employee where Gender like "Fe____" and Age >30;

