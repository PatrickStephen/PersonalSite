--===========================--
--===Module 3 - SQL FILTERS===--
--===========================--

USE Northwind;

--We can do 'fuzzy searches' aka pattern matching with the LIKE operator.
--Similar to exact matching, but uses LIKE instead of =
--LIKE uses wildcard characters, such as %, which indicates "any number of characters, including 0"

-- Show all products whose name starts with S

SELECT *
FROM Products
WHERE ProductName LIKE 'S%'


--Show all products whose name ends with an E

SELECT *
FROM Products
WHERE ProductName LIKE '%E'

SELECT *
FROM Products
WHERE ProductName LIKE '%sauce%'


--Inclusive ranges, which include the low or high values
--Exclusive ranges, which exclude the low or high values

SELECT *
FROM Products
--WHERE UnitsInStock < 40 --Exclusive (does not include units with 40 in stock
WHERE UnitsInStock <= 40 --Inclusive (does include units with 40 in stock
ORDER BY UnitsInStock DESC


--For Ranges (with both sides specified)
Select * From Products
Where UnitsInStock >= 10 AND UnitsInStock <= 40 --Inclusive ranges
Order By UnitsInStock DESC


--Shortcut Syntax for Ranges -- BETWEEN Operator is Inclusive
Select * From Products
Where UnitsInStock Between 10 AND 40
Order By UnitsInStock DESC


--Show all products whose prductname starts with, a through f
Select ProductName
From Products
Where ProductName Between 'a' AND 'f'

--We can use the OR and AND keywords for various conditions
SELECT *
FROM Employees
Where LastName = 'Peacock' OR FirstName LIKE '%an%'

-- NOT key -- Resembles the ! in C#. It lets you "flip" the statement
Select *
From Employees
Where NOT (LastName = 'Peacock' OR FirstName LIKE '%an%')

Select * From Suppliers

-- Show all suppliers in the UK, USA, or France

Select *
From Suppliers
Where Country = 'UK' OR Country = 'USA' OR Country = 'France'

--Shortcut Syntax for Exact matches: IN keyword

Select *
From Suppliers
Where Country IN ('UK','USA','France')

Select *
From Suppliers
Where Country NOT IN ('UK','USA','France')

		-- ALT Method
		Select *
		From Suppliers
		Where Country <> 'UK' AND Country <> 'USA' AND Country <> 'France'


-- We can handle dates in siilar ways as well
Select OrderID, ShippedDate
From Orders
Where ShippedDate < '1997'
-- The above date is looking for any date before 1/1/1997 00:00:00

Select OrderID, ShippedDate
From Orders
Where ShippedDate Between '8/1/1996' AND '8/30/1996'

-- Order of OP between AND & OR
Select * From Products
Where CategoryID = 1 OR CategoryID = 2 AND UnitsInStock < 20
-- The AND operator executes FIRST in the Order of OP, so we will
-- need to make sure our queries are constructed to give us the results we want

Select * From Products
Where (CategoryID = 1 OR CategoryID = 2) AND UnitsInStock < 20

--Concatenation (in T-SQL uses +)
-- Note: Standard/ other flavors of SQL use | to concatenate

Select FirstName + ' ' + LastName AS [Full Name] 
From Employees

-- IS NULL and IS NOT NULL
-- In SQL, we can use these statements to isolate null/non/null values

Select * From Suppliers
Where Region IS NULL

Select * From Suppliers
Where Region IS NOT NULL


--MINI LAB!
use Books;
-- 1) List all history titles
Select * From Titles
Where [type] = 'history'

-- 2) List all titles that are NOT history titles
Select * From Titles
Where NOT [type] = 'history'

-- 3) List all titles with over 5000 in sales
Select * From Titles
Where Sales > 5000

-- 4) List all titles that cost $10.00 or less
Select * From Titles
Where Price <= 10

-- 5) List all titles that cost $12.99, $19.95, or $21.99
Select * From Titles
--Where Price = 12.99 or Price = 19.95 or Price = 21.99
Where price IN (12.99, 19.95, 21.99)

-- 6) List all titles that have an '!' or a '?' in the title
Select * From Titles
Where title_name Like '%!%' or title_name Like '%?%'

-- 7) List all history titles that cost more than $20
Select * From Titles
Where Price > 20 AND [type] = 'history'

-- 8) List all titles with sales between 500 and 5000
Select * From Titles
Where sales between 500 and 5000