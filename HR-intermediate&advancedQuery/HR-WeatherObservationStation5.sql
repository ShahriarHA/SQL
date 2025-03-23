-- smallest city name
select city, length(city) from station
order by length(city), city
limit 1;

-- largest city name
select city, length(city) from station
order by length(city) desc, city desc
limit 1;