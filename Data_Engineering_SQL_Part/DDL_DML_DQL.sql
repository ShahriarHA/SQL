USE test_db;
DROP DATABASE test_db;


------ Creating a database --------
CREATE DATABASE database_1;
USE database_1;

------ droping test_db database -----
DROP DATABASE test_db;


--- create a table in default schema ---
CREATE TABLE test_table(
	product_id int,
	item_name varchar(100),
	item_price int
);

--- creating a schema ---
CREATE SCHEMA schema_1;

--- DDL commands ---
--- creat a tabel in schema_1
CREATE TABLE schema_1.table_1(
	Salesperson varchar(100),
	Product varchar(30),
	Month varchar(30),
	Sales int
);

-- ALTER TABLE
ALTER TABLE schema_1.table_1
ADD year int;

-- DROP TABLE
DROP TABLE schema_1.table_1;

-- TRUNCATE TABLE
TRUNCATE TABLE schema_1.table_1;

--- DQL command ---
SELECT * FROM schema_1.table_1;

--- DML commands ---
--- Insert data 
INSERT INTO schema_1.table_1
VALUES ('Bob','Mango','FEB',200,2012);

INSERT INTO schema_1.table_1
(Salesperson,Product,Sales,year)
VALUES('Alice','Orange',400,2020)

-- UPDATE
UPDATE schema_1.table_1
set Month = 'JULy'
WHERE Product = 'Orange'

-- DELETE
DELETE FROM schema_1.table_1
WHERE Product = 'Orange';




