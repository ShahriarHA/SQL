SELECT ei.employee_id, ei.name
FROM employee_information ei
JOIN last_quarter_bonus lqb ON ei.employee_id = lqb.employee_id
WHERE ei.division = 'HR' AND lqb.bonus >= 5000;