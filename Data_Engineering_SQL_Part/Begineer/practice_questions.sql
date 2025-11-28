-- BEGINNER PRACTICE QUESTIONS (10 tasks)

---- Q1. Show all brands from production.brands.
SELECT * FROM [production].[brands];

---- Q2. Show all products with model year = 2017
SELECT * 
FROM [production].[products]
WHERE model_year=2017;

---- Q3. Show all customers who live in "NY".
SELECT *
FROM [sales].[customers]
WHERE state='NY';

---- Q4. List top 5 most expensive products.
SELECT TOP 5 *
FROM [production].[products] AS P
ORDER BY P.list_price DESC;

---- Q5. Get distinct states from customers.
SELECT DISTINCT C.state
FROM [sales].[customers] AS C;

---- Q6. Get all stores sorted by city name.
SELECT *
FROM [sales].[stores] AS S
ORDER BY S.city;

---- Q7. Find products priced between 300 and 1000.
SELECT *
FROM [production].[products] AS P
WHERE P.list_price BETWEEN 300 AND 1000;

---- Q8. Find customers whose last name starts with 'S'.
SELECT *
FROM [sales].[customers] AS C
WHERE C.last_name LIKE 'S%';


---- Q9. Count total customers in each state.
SELECT C.state, COUNT(*) AS Total_customers
FROM [sales].[customers] AS C
GROUP BY C.state;

---- Q10. Show products and their brand names (using JOIN).
--SELECT * FROM [production].[products];
--SELECT * FROM [production].[brands];
SELECT P.product_name,B.brand_name
FROM [production].[products] AS P
JOIN [production].[brands] AS B
ON P.brand_id = B.brand_id;