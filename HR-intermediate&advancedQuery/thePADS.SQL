-- QUERY 1
select concat(name,'(',left(occupation,1),')')
from occupations 
order by name;
-- QUERY 2
select concat('There are a total of ',count(name),' ',lower(occupation),'s.') 
from OCCUPATIONS 
group by occupation 
order by count(name);
