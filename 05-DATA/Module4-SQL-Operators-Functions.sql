--======================================--
--===Module 4 - Operators / Functions===--
--======================================--

USE Northwind;

-- Show ProductName, price, UnitsInStock, and total in-stock value
Select ProductName, UnitPrice AS [Price], UnitsInStock, UnitPrice * UnitsInStock AS [Total In-Stock Value]
From Products

--Show ProductName, Price, and the price with a 10% discount
Select ProductName AS [Name], UnitPrice AS [Price], UnitPrice * .9 AS [Discounted Price]
From Products

-- SQL FUNCTIONS

-- We can make the result more readable by
-- translating numbers to currency format, using FORMAT()
Select ProductName AS [Product], Format (UnitPrice, 'c') AS [Price],
Format (UnitPrice * .9, 'c') AS [Discounted Price]
From Products

--Concatenate with + in SQL Server
Select TitleOfCourtesy + ' ' + FirstName + ' ' + LastName + ' (' + Title + ')' AS [Employee]
From Employees

-- UPPER() and LOWER() change the casing (similar to ToUpper() and ToLower() in C#
Select Upper(FirstName) AS [Upper FName], Lower(LastName) AS [Lower LName]
From Employees

--SUBSTRING() is used to retrieve a portion of a string value
-- SYNTAX: SUBSTRING(stringToExtractFrom, tartingCharacter#, #OfCharacters)

--Generate a suggested email address for the Employees of Northwind
Select FirstName, LastName, 
	   Lower (Substring (FirstName, 1, 1) + LastName + '@northwind.com') AS [Suggested Email]
From Employees

Select FirstName, LastName, 
	   Lower (Substring (FirstName, 1, 1) + Substring (LastName, 1, 5) + '1' + '@college.edu') AS [Student Email]
From Employees

-- LEN() returns the LENTH of a string
-- SYNTAX: Len(StringToBeTested)
Select FirstName, Len(FirstName) AS [Nbr of Chars]
FROM Employees

-- LTRIM() and RTRIM()
-- Prior to starting our example of LTRIM() and RTRIM(), we entered a new employee in the
-- Employee table using "Edit Top 200 Rows". The new employee has extra spaces in their name.

Select '|' + FirstName + '|' + ' ' + '|' + LastName + '|' AS [Full Name],
	   '|' + LTRIM(FirstName) + '|' AS [LTRIM FName],
	   '|' + LTRIM(LastName) + '|' AS [LTRIM LName],
	   '|' + RTRIM(FirstName) + '|' AS [RTRIM FName],
	   '|' + RTRIM(LastName) + '|' AS [RTRIM LName],
	   '|' + Ltrim(Rtrim(FirstName)) + '|' AS [Trim FName],
	   '|' + Ltrim(Rtrim(LastName)) + '|' AS [Trim LName]
From Employees


-- DATE Functions --
-- DATEPART() pulls a specific portion of a date (month, day, year, quarter, etc.)
-- SYNTAX: DATEPART(partOfDateToCompare, valueToBeComparedAgainst)

-- Show employees hired in Oct
Select * from Employees
Where DatePart(m, HireDate) = 10

-- Show employees hired in Q2
Select * from Employees
Where DATEPART(q, HireDate) = 2

--Current Date/Time -- Can be retrieved with GETDATE() or CURRENT_TIMESTAMP
-- No FROM clause required
Select GETDATE() AS [GetDate], CURRENT_TIMESTAMP AS [Current_Timestamp]

--DATEDIFF() - Returns an int for the diff between two datetime values
-- SYNTAX: DATEDIFF(partOfDateToCompare, Date1ToBeCompared, date2ToBeCompared

Select ShippedDate, RequiredDate, Datediff(d, ShippedDate, RequiredDate) AS [Shipping Target]
From Orders
Where DATEDIFF(d, ShippedDate, RequiredDate) IS NOT NULL 
Order BY DATEDIFF(d, ShippedDate, RequiredDate)

-- CASTING in SQL is a wider term than in C#
	-- used to move data between different data types
	-- SQL does not have ToString() like C# does, instead we often use Casting
	--SYNTAX: CAST(valueToChange AS [DataTypeToChangeTo])

Select FirstName + ' was born in ' + datepart(YY, BirthDate) AS [Birthday Info]
From Employees
--This doesn't work

Select FirstName + ' was born in ' + Cast(datepart(YY, BirthDate) AS Char(4)) AS [Birthday Info]
From Employees


-- CASE... END allows for conditional within a SELECT clause (similar to a Switch in C#)

--Show a shipping company based on the country for an order

select OrderID, ShipCountry, 
	   CASE ShipCountry -- Field to be evaluated
			When 'Mexico' -- Condition
				Then 'TransMexAir' -- Result
			When 'USA'
				Then 'Pony Express'
			When 'UK'
				Then 'TeaTime Airlines'
			When 'France'
				Then'Fromage Express'
			Else 'FedEx' -- Like the default in a switch
		End AS [Shipping Company]
from Orders

-- Use a specific Condition in the Case (similar to an if statement in C#)
Select OrderID, ShipCountry, OrderDate, Freight,
	   case 
			When OrderDate >= '1998' AND ShipCountry = 'USA'
				Then Format (Freight * 1.5 * .75, 'c')
			When OrderDate >= '1998'
				Then Format (Freight * 1.5, 'c')
			When ShipCountry = 'USA'
				Then Format (Freight * .75, 'c')
			Else Freight
		End AS [Adjusted Frieght]
From Orders


--NULLIF() allows us to replace a given value with NULL

-- If the discount is 0, replace with a null value
-- SYNTAX: NULLIF(fieldToBeEvaluated, the ValueToReplaceWithNull)

select OrderID, UnitPrice, Quantity, Discount, NULLIF(Discount, 0) AS [Nullified Discount]
from [Order Details]


-- COALESCE() allows us to use the value in a field if it has one.
-- But, if it doesn't we can specify a value to use instead
-- SYNTAX: COALESCE(FieldToBeEvaluated, the ValueToUseIfNull)

-- If a customer does not have a fax number, replace that value with 'No Fax'

select CustomerID, CompanyName, ContactName, Phone, coalesce(Fax, 'No Fax') AS [Fax]
from Customers

-- coalesce can also be used in calculations
select ProductName, UnitsInStock, UnitPrice,
	   UnitPrice * coalesce(UnitsInStock, 0) [In-Stock Value]
from Products


-- MINI-LAB!
use Books;

-- 1) List the title name, price, and sale price for each book if all books are 15% off
select title_name AS [Title], price, Format (price * .85, 'c') AS [Sale Price]
from titles

-- 2) List all publishers name and location data in a single column called 'Publishers Complete'
select (pub_name + ', ' + city + ', ' + coalesce([state],'') + ', ' + country) AS [Publisher Complete]
from publishers

-- 3) List all authors with the first letter of the first name and last name swapped
select au_fname AS [First Name], au_lname AS [Last Name], au_lname + ' ' + SUBSTRING(au_fname, 1, 1) AS [Name]
from authors

select au_fname AS [First Name], au_lname AS [Last Name],
	   SUBSTRING(au_lname, 1, 1) + SUBSTRING(au_fname, 2, LEN(au_fname)) AS [Swapped First Name],
	   SUBSTRING(au_fname, 1, 1) + SUBSTRING(au_lname, 2, LEN(au_lname)) AS [Swapped Last Name]
from authors

-- 4) List all title names from the shortest title to the longest title
Select title_name [Titles]
FROM titles
order by Len(title_name)

-- 5) List title names and publish dates with the date '12/31/9999' for those 
-- with null publish dates
select title_name AS [Title], coalesce(pubdate, '12/31/9999') AS [Published Date]
from titles
 