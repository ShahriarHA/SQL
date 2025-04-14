select * from world.city;
select * from world.country;

-- INNER JOIN;
select wc.Code,wc.Name,wcl.Language from world.country as wc
inner join world.countrylanguage as wcl
on wc.Code = wcl.CountryCode;

-- LEFT JOIN 
select wci.Name,wci.CountryCode,wcl.Language from world.city as wci
left join world.countrylanguage as wcl
on wci.CountryCode = wcl.CountryCode
order by wci.Name;

-- RIGHT JOIN: he RIGHT JOIN keyword returns all records from the right table, and the matching records from the left table. 
select wci.Name,wci.CountryCode,wcl.Language from world.city as wci
right join world.countrylanguage as wcl
on wci.CountryCode = wcl.CountryCode
order by wci.Name;

-- SELF JOIN
select wc.ID as world_city_id,wc.Name as world_city_name,wc1.ID,wc1.Name,wc1.CountryCode 
from world.city as wc
join world.city as wc1
on wc.ID+1 = wc1.ID

-- cross join: returns all records from both tables.

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders;


 







 