/*
Host: {host}
Username: {username}
Password: {password}
*/

-- 01
-- SELECT all columns and rows from the Customers table
SELECT * 
FROM Customers; 

-- 02
-- How do we know which columns are available?
DESCRIBE Customers;

-- 03
-- SELECT specific columns - CustomerID, CustFirstName, CustZipCode
SELECT CustomerID, CustFirstName, CustZipCode
 FROM Customers;

-- 04
-- Filter for customers from CA
SELECT CustomerID, CustFirstName, CustZipCode, CustState
FROM Customers
WHERE CustState = 'CA';

-- 05
-- Filter for customers from CA in the 92199 zip code
SELECT CustomerID, CustFirstName, CustZipCode, CustState
FROM Customers
WHERE CustState = 'CA' 
	AND CustZipCode = 92199;

-- 06
-- Filter for customers from CA or WA
SELECT CustomerID, CustFirstName, CustZipCode, CustState
FROM Customers
WHERE CustState = 'CA' 
	OR CustState = 'WA';

-- 07
-- Find orders from CustomerID 1001 handled by EmployeeID 703 or 701
SELECT OrderNumber , CustomerID, EmployeeID
FROM Orders 
Where CustomerID = 1001
	AND (EmployeeID = 703
    OR EMployeeID = 701);

-- 08
-- Filter for orders with a quoted price greater than $100.00
SELECT OrderNumber , QuotedPrice
FROM Order_Details 
Where QuotedPrice > 100.0;

-- 09
-- Alias QuotedPrice to SalePrice
SELECT OrderNumber , QuotedPrice AS SalePrice
FROM Order_Details 
Where QuotedPrice > 100.0;

-- 10
-- How would you calculate total revenue?
SELECT
	OrderNumber , 
    QuotedPrice AS SalePrice,
    QuantityOrdered,
    QuotedPrice * QuantityOrdered AS Revenue
FROM Order_Details 
Where QuotedPrice > 100.0;

-- 11
-- Select 5 rows from the Orders table that were handled by EmployeeID 702
SELECT * 
FROM Orders
WHERE EmployeeID = 702
LIMIT 5;

-- 12
-- SELECT the 3 orders following the first 10 orders
SELECT * 
FROM Orders
WHERE EmployeeID = 702
LIMIT 10,3;

-- 13
-- Sort orders by EmployeeID
SELECT * 
FROM Orders
ORDER BY EmployeeID;

-- 14
-- Sort the result set by EmployeeID and LIMIT to 10 orders
SELECT * 
FROM Orders
ORDER BY EmployeeID
LIMIT 10;

-- 15
-- SELECT all orders and all columns sorted by EmployeeID first then CustomerID
SELECT * 
FROM Orders
ORDER BY EmployeeID, CustomerID;

-- 16
-- SELECT all orders and all columns sorted by OrderDate from the most recent date to the oldest date
SELECT * 
FROM Orders
ORDER BY OrderDate DESC;

-- 17
-- What is the total vendor count?
SELECT COUNT(*)
FROM Vendors;

-- 18
-- What if you did a COUNT on a column with NULL values? 
SELECT COUNT(*), COUNT(VendEMailAddress)
FROM Vendors;

-- 19
-- Create a list of vendor names with a NULL email
SELECT VendName, VendEMailAddress
FROM Vendors
WHERE VendEMailAddress IS NULL;

-- 20
-- Create a list of vendor names with an non-null (NOT) email
SELECT VendName, VendEMailAddress
FROM Vendors
WHERE VendEMailAddress IS NOT NULL;

-- 21
-- How many unique states represent the customers?
SELECT DISTINCT(CustState)
FROM Customers;

-- 22
-- Return just the number of unique customer states
SELECT COUNT(DISTINCT(CustState)) AS UniqueStateCount
FROM Customers;

-- 23
-- Give me a unique list of the customer state and zip code combinations
-- Sort the results by CustState
SELECT DISTINCT CustState, CustZipCode
FROM Customers
ORDER BY CustState;

-- 24
-- List the products not in the bike category
SELECT ProductNumber, ProductName, CategoryID
FROM Products
WHERE CategoryID !=2;

-- 25
-- Select all rows and columns for orders with a QuotedPrice greater than or equal to $1746.00
SELECT *
FROM Order_Details
WHERE QuotedPrice >= 1746.0;

-- 26
-- How would you search for customers in Texas, California, or Washington? Include the CustomerID and the state in the results.
SELECT CustomerID, CustState
FROM Customers
WHERE CustState = 'TX'
	OR CustState = 'WA'
    OR CustState = 'CA';

-- 27
-- Using IN, search for customers in Texas, California, or Washington? Include the CustomerID and the state in the results.
SELECT CustomerID, CustState
FROM Customers
WHERE CustState IN( 'CA','TX','WA');

-- 28
-- Search for customers NOT IN Texas, California, or Washington
SELECT CustomerID, CustState
FROM Customers
WHERE CustState NOT IN( 'CA','TX','WA');

-- 29
-- How would you search for orders where the QuotedPrice is between $50 and $100?
SELECT OrderNumber, ProductNumber, QuotedPrice
FROM Order_Details
WHERE QuotedPrice >= 50
	AND QuotedPrice <= 100;

-- 30
-- Using BETWEEN, how would you search for orders where the QuotedPrice is between $50 and $100?
SELECT OrderNumber, ProductNumber, QuotedPrice
FROM Order_Details
WHERE QuotedPrice BETWEEN 50 AND 100;

-- 31
-- Make a list of product names with bike in the name
SELECT ProductName
FROM Products
WHERE ProductName like '%bike%';

-- 32
-- Make a list of product names that start with dog
SELECT ProductName
FROM Products
WHERE ProductName like 'dog%';

-- 33
-- Make a list of product names that end with helmet
SELECT ProductName
FROM Products
WHERE ProductName like '%helmet';

-- 34
-- Make a list of product names that do NOT end with helmet
SELECT ProductName
FROM Products
WHERE ProductName NOT like '%helmet';











