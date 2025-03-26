select * from world.country;
-- find length of each string 
select length('sky') as skyLength;
select Name,length(name) as length_Of_Each_Country_Name from world.country;
-- convert lower to upper case
select upper('sky');
select Name,upper(name) from world.country;
-- convert upper to lower case
select lower("HellO");
select CountryCode, lower(countrycode) from world.city group by CountryCode;
-- remove white spacess
select trim("sky ");
select ' I Love You ', ltrim(' I Love You');
-- there is another trim function called rtrim which removes white spaces from right side

-- left function
select 'Alexendar' as fullname,left("Alexendar",4);  
-- right function
select 'Shahriar' as fullname, right("Shahriar",4);

-- substring
select "shahriar", substring("shahriar",1,4);
select payment_date, substring(payment_date,1,4) as payment_Year from sakila.payment;

-- replace function
select replace("hello","e","a");

-- locate function
select locate("o","hello");
select locate("ria","shahriar");  

-- concatenate function
select first_name, last_name, concat(first_name,' ',last_name) as full_Name from sakila.actor; 

