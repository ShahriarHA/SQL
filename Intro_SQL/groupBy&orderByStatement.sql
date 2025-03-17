select * from employee.employee;
select * from sakila.customer;
select * from sys.sys_config;
select * from world.city;
-- Group by statemenat 
select count(Name),CountryCode from world.city group by CountryCode;
select CountryCode,sum(Population) from world.city group by CountryCode;

select Gender,count(Gender) from employee.employee group by gender;
select Gender, max(age), min(Age), avg(age) from employee.employee group by Gender;
-- Aggregate functions------ 
-- Order by statement
select Gender,Age from employee.employee order by Gender desc,Age desc;


