-- => Topic one [SELECT, FROM]
---- Example 1: Show all products
SELECT * FROM production.products;

---- Example 2: Show all customers (first 10 only)
SELECT TOP 10 * FROM sales.customers;

-- => Topic 2: WHERE Clause (Filtering)
---- Example 1: Products with price greater than 1000
SELECT P.product_name, P.list_price FROM production.products AS P
WHERE P.list_price > 1000;

---- Example 2: Customers from California (CA)
SELECT C.first_name, C.last_name, C.city FROM sales.customers AS C
WHERE C.state = 'CA';

-- => Topic 3: ORDER BY(SORTING)
---- Example
SELECT P.product_id,P.product_name,P.list_price
FROM production.products AS P
ORDER BY P.list_price DESC;

-- => Topic 4: DISTINCT
---- Example
SELECT DISTINCT C.city
FROM sales.customers AS C;

-- => Topic 5: Basic Operators (=, >, <, >=, <=,BETWEEN,IN,LIKE)
---- Example — LIKE (Pattern Matching)
SELECT c.first_name,c.email,c.email
FROM sales.customers as c
WHERE c.first_name LIKE 'A%'; -- starts with A

---- Example
SELECT *
FROM [production].[products] AS P
WHERE P.product_name LIKE '%Bicycles%'; -- contain Bicycles

---- Example
SELECT *
FROM [production].[products] AS P
WHERE P.product_id LIKE '__5'; -- For any single Character

---- Range and List Operators:
---- Example - Between (Inclusive Range) Selects values within a specified inclusive range.
SELECT * 
FROM sales.customers as C
WHERE C.customer_id BETWEEN 1 AND 50;

---- Example - IN (List Membership): Checks if a value matches any value in a provided list.
SELECT * 
FROM sales.customers as C
WHERE C.state IN ('NY','CA','TX');

-- => Topic 6: JOINS
---- Example - INNER JOIN
SELECT P.product_id, P.product_name, B.brand_name
FROM [production].[products] AS P
JOIN [production].[brands] AS B
ON P.product_id = B.brand_id;

---- Example - LEFT JOIN
SELECT C.first_name, O.order_id
FROM [sales].[customers] AS C
LEFT JOIN [sales].[orders] AS O
ON C.customer_id = O.customer_id;

-- => Topic 7: GROUP BY + Aggregates
---- Functions: COUNT(), SUM(), AVG(), MIN(), MAX()
SELECT * FROM [sales].[customers];
---- Example: number of customers in each city
SELECT C.city, COUNT(*) AS Total_Customers
FROM [sales].[customers] AS C
GROUP BY C.city
ORDER BY C.city;

---- Example: total stock quantity per product
SELECT * FROM [production].[stocks] WHERE product_id = 1;-- analysis
SELECT * FROM [production].[products]; -- analysis
-- SQL QUERY
SELECT P.product_id,P.product_name,SUM(S.quantity) AS Total_stock_quantity
FROM [production].[products] AS P
JOIN [production].[stocks] AS S
ON P.product_id = S.product_id
GROUP BY P.product_name,P.product_id;






