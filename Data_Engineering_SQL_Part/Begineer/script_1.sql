-- Topic one [SELECT, FROM]
---- Example 1: Show all products
SELECT * FROM production.products;

---- Example 2: Show all customers (first 10 only)
SELECT TOP 10 * FROM sales.customers;

-- Topic 2: WHERE Clause (Filtering)
---- Example 1: Products with price greater than 1000
SELECT P.product_name, P.list_price FROM production.products AS P
WHERE P.list_price > 1000;

---- Example 2: Customers from California (CA)
SELECT C.first_name, C.last_name, C.city FROM sales.customers AS C
WHERE C.state = 'CA';

-- Topic 3: ORDER BY(SORTING)
---- Example
SELECT P.product_id,P.product_name,P.list_price
FROM production.products AS P
ORDER BY P.list_price DESC;

-- Topic 4: DISTINCT
---- Example
SELECT DISTINCT C.city
FROM sales.customers AS C;



