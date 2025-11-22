USE BikeStores;

-- Bikestore production schema
SELECT * FROM production.brands;
SELECT * FROM production.categories;
SELECT * FROM production.products;
SELECT * FROM production.stocks;


-- Bikestore sales schema
SELECT * FROM sales.customers;
SELECT * FROM sales.order_items;
SELECT * FROM sales.orders;
SELECT * FROM sales.staffs;
SELECT * FROM sales.stores;

-- 1. Create a Function named as "udfn_cust_full_name" that would return Customer Full Name
CREATE FUNCTION udfn_cust_full_name
(
    @first_name VARCHAR(255),
    @last_name  VARCHAR(255)
)
RETURNS VARCHAR(510)
AS
BEGIN
    RETURN RTRIM(LTRIM(@first_name + ' ' + @last_name));
END;
GO


-- 2. Find out Top 10 products by sales quantity
SELECT TOP 10 
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM sales.order_items as oi
JOIN production.products AS p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;
GO

-- 3. Find out all the Store names and product wise stock quantities where stock 
--    quantities are more than 25
SELECT 
    s.store_name,
    p.product_name,
    st.quantity
FROM production.stocks as st
JOIN sales.stores as s ON st.store_id = s.store_id
JOIN production.products AS p ON st.product_id = p.product_id
WHERE st.quantity > 25;
GO

--4. Create a VIEW named as "vw_product_stock_qty_below15" that would show the Products 
--   that are low (below 15) in stock

CREATE VIEW vw_product_stock_qty_below15
AS
SELECT 
    p.product_name,
    st.store_id,
    st.quantity
FROM production.stocks as st
JOIN production.products as p ON st.product_id = p.product_id
WHERE st.quantity < 15;
GO

SELECT * FROM vw_product_stock_qty_below15;


-- 5. Find out Top 3 performing Stores with the highest number of orders and Total Revenue
SELECT
    s.store_id,
    s.store_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * (oi.list_price - (oi.list_price * oi.discount / 100))) AS total_revenue
FROM sales.orders as o
JOIN sales.stores as s ON o.store_id = s.store_id
JOIN sales.order_items as oi ON o.order_id = oi.order_id
GROUP BY s.store_id,s.store_name
ORDER BY total_revenue DESC, total_orders DESC;


-- 6. List down all customers full name, phone, email and the number of Orders they have 
--    placed along with Total Revenue of their Orders. Use "udfn_cust_full_name" 
--    to get full name.
SELECT 
    dbo.udfn_cust_full_name(c.first_name, c.last_name) AS full_name,
    c.phone,
    c.email,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * (oi.list_price - (oi.list_price * oi.discount / 100))) AS total_revenue
FROM sales.customers as c
LEFT JOIN sales.orders as o ON c.customer_id = o.customer_id
LEFT JOIN sales.order_items as oi ON o.order_id = oi.order_id
GROUP BY 
    dbo.udfn_cust_full_name(c.first_name, c.last_name),
    c.phone,
    c.email
ORDER BY total_revenue DESC;




