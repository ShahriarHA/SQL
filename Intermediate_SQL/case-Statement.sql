select * from employee.employee;
select City,Gender,
case
	when Age < 25 then "New employee!"
    when Age > 35 then "experienced employee!"
end as status
from employee.employee;


SELECT first_name, last_name, salary,
CASE
	WHEN salary > 45000 THEN salary + (salary * 0.05)
    WHEN salary < 45000 THEN salary + (salary * 0.07)
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM employee_salary;