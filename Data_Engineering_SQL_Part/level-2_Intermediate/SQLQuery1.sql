-- => 1. SUBQUERIES (Queries inside queries)
---- Type 1: Scalar Subquery (returns one value)
---- Example: Find products priced above the average list price:
SELECT P.product_name, P.list_price
FROM production.products AS P
WHERE P.list_price>(
	SELECT AVG(list_price) FROM production.products
);

select avg(list_price) as avg_of_list_price from production.products;

---- Type 2: Subquery in IN
---- Example: Find customers who have placed orders:
SELECT * FROM sales.customers;
SELECT * FROM sales.orders;
SELECT C.customer_id, C.first_name,C.last_name
FROM sales.customers AS C
WHERE C.customer_id IN (
	SELECT O.customer_id FROM sales.orders AS O
);

---- Type 3: Subquery in EXISTS (faster than IN)
---- Example: Find customers who have at least one order
SELECT C.customer_id, C.first_name,C.last_name
FROM sales.customers AS C
WHERE EXISTS (
	SELECT 1
	FROM sales.orders AS O
	WHERE C.customer_id = O.customer_id
);

-- => 2. CTE (Common Table Expressions): A CTE is a temporary result you can reuse in the 
-- same query.
---- Example 1: Get top-selling products using CTE
SELECT * FROM [sales].[order_items];
SELECT * FROM [sales].[orders];
SELECT * FROM [production].[products];
WITH totat_saled_product AS (
	SELECT OI.product_id, SUM(OI.quantity) AS TOTAL_QUANTITY
	FROM [sales].[order_items] AS OI
	GROUP BY OI.product_id
)
SELECT S.product_id,S.TOTAL_QUANTITY
FROM totat_saled_product AS S
JOIN [production].[products] AS P
ON S.product_id = P.product_id
ORDER BY S.TOTAL_QUANTITY DESC
;

-- => 3. HAVING (Filtering after GROUP BY)
---- Example: Only products with total stock > 50
SELECT * FROM [production].[stocks];

SELECT S.product_id, SUM(S.quantity) AS Total_quantity
FROM [production].[stocks] AS S
GROUP BY S.product_id
HAVING SUM(S.quantity) > 50
ORDER BY S.product_id;








