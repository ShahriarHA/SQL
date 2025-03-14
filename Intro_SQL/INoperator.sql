SELECT DISTINCT CITY
FROM STATION 
WHERE LEFT(CITY,1) IN ('a','e','i','o','u') AND RIGHT(CITY,1) IN ('a','e','i','o','u');

-- Note: LEFT(city, 1): Extracts the first character of the string in the city column

-- inthe following querry a string that do not start with vowels.
select distinct city
from station 
where left(city,1) not in ('a','e','i','o','u');

-- a string that do not end with vowels
select distinct city 
from station
where right(city,1) not in ('a','e','i','o','u');