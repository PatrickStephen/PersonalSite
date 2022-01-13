--===========================--
--===Module 2 - SQL Syntax===--
--===========================--

-- Single line comment

/*
	Multi-line comment

	SQL Notes

	-- Not case sensitive

	-- String literals use ' instead of ", BUT if you need a single quote inside a string, we can use
		single quotes like this: --Select * (all) from authors where city = 'Lee''s Summit'
		('' inside of single ticks is for a astric on a word)

		--Semi-colon is a statement closer, is largely optional

		--SQL is the standardized version of the language.
			We are using MS SQL Server's version of that standard, call T-SQL

		--Date literals in T-SQL use the single ticks and a variety of standard datetime formats
		--Ex: SELECT * FROM titles WHERE datepublished = '2012-01-23'

		-- Booleans are stored as bits.
			--When referencing their values in code, we use 0 for false and 1 for true
			--Ex: SELECT * FROM titles WHERE isSiteFeature = 1
			--Note if you use the SSMS feature "Edit Top 200 Rows", it will handle bit colomns
				with their booleans/bit values translated to True or False

		--Intellisense/Error Highlighting is less helpful than in Visual Studio
			- Edit > Intellisense > Refresh Local Cache, can be helpful if Intellisense is acting up

		--Writen order for a SQL Statement is:

		-SELECT
		-FROM
		-JOIN
		-WHERE
		-GROUP BY
		-HAVING
		-ORDER BY

		(Some Friends Just Want Good Happy Options)

		Suggestion: Write FROM/JOIN clauses prior to assembling your SELECT

		Make sure the database dropdown list is pointed to the correct database for the query		
*/

USE Northwind;  --(ctrl + r) hides the pop up window when running


SELECT ProductId, ProductName
FROM Products

SELECT OrderID, OrderDate, CustomerID
FROM Orders

SELECT SupplierID, CompanyName, ContactName, Country
FROM Suppliers

--SELECT * -- means ALL fields from the tables
--FROM Shippers

--or

SELECT * FROM Shippers
-- * is NOT good for production code....
	--It is not good for performance (slow)
	--It is not self-documenting (does not describe what we are asking for,
		--it is not easily readable later)

SELECT ShipperID, CompanyName, Phone
FROM Shippers

--We can use [] around a column or table name to specify that it is, indeed, a column/table name
SELECT [Address], City, Region
FROM Suppliers

SELECT OrderID, ProductID
FROM [Order Details]

--We can "alias" a field name with a temp name.
--There are several ways to do this, most common is []

SELECT FirstName [First Name], 
		LastName AS 'Last Name',
		PostalCode Zip -- No AS or [] required since there are no spaces.
		-- HOWEVER, I STRONGLY recommend using [] since they help us easily
		-- identify when we are aliasing.
FROM Employees

-- ALiases are most commonly used to rename a calculated/derived column

SELECT OrderID,UnitPrice, Quantity, UnitPrice * Quantity[Revenue]
FROM [Order Details]

-- To sort a result set, we can use ORDER BY

SELECT City
FROM Employees
ORDER BY City

--Only want to show unique cities? Use DISTINCT

SELECT DISTINCT City
FROM Employees
ORDER BY City

--You can also use Distinct with more than 1 field -- it looks at Combined Uniqueness
SELECT DISTINCT City, Region
FROM Employees
ORDER BY City

--You can also sort by one column, then by another column
SELECT OrderID, CustomerID, OrderDate
FROM Orders
ORDER BY CustomerID, OrderDate

--MINI LAB!

-- 1) List the name and location data for all suppliers
SELECT CompanyName, ContactName, [Address], City, Region, PostalCode AS [Zip]
FROM Suppliers

-- 2) List all Categories
SELECT *
FROM Categories


-- 3) List the name, price, and in-stock value (price * units in stock) for products
-- and rename the columns as such
SELECT ProductName AS [Name], UnitPrice AS [Price], UnitPrice * UnitsInStock AS [In-Stock Value]
FROM Products

-- 4) List the productid and quantity of all order details and sort them
-- from lowest quantity to highest quantity
SELECT ProductID, Quantity
FROM [Order Details]
ORDER BY Quantity


-- 5) List all products from highest to lowest price
SELECT *
FROM Products
ORDER BY UnitPrice --Default ORDER BY sorts form small to large (ASC).
				   -- for large to small use (DESC)


