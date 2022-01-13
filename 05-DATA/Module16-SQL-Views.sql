--============================--
--======Module 16: Views======--
--============================--

/*

	Views are just stored queries that can be called on like tables (in FROM or JOIN).
	BENEFITS:
		- Reusable code
		- Cacheing (performance boost)
		- Consistency
		- Can help to keep the database secure and limit a user's interaction with the database
	
	LIMITATIONS:
		- Views do not accept parameters
		- Views do not allow full CRUD funtionality -- No INSERT, UPDATE, DELETE (read-only)

	Can be created through code or using the SSMS GUI

*/

-- Pre-existing Views in Northwind

use Northwind;

select *
from [Product Sales for 1997]


select *
from [Product Sales for 1997]
where CategoryName = 'SeaFood'

-- We can look at the code behind the query for the View
	-- Right-Click on the View in the Object Explored
	-- Script View As > Create to > New Query Editor

-- The code below was generated using the instructions above for [Product Sales fro 1997]

	USE [Northwind]
GO

/****** Object:  View [dbo].[Product Sales for 1997]    Script Date: 12/17/2021 12:56:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[Product Sales for 1997] AS
SELECT Categories.CategoryName, Products.ProductName, 
		Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ProductSales
FROM (Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) 
	INNER JOIN (Orders 
		INNER JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID) 
	ON Products.ProductID = "Order Details".ProductID
WHERE (((Orders.ShippedDate) Between '19970101' And '19971231'))
GROUP BY Categories.CategoryName, Products.ProductName
GO


-- The below code was copied from above and updated to create a version of
	-- this Product Sales view for 1998

	USE [Northwind]
GO
--Updated the below comment to reflect the new View
/****** Object:  View [dbo].[Product Sales for 1998]    Script Date: 12/17/2021 13:07:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[Product Sales for 1998] AS
SELECT Categories.CategoryName, Products.ProductName, 
		Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ProductSales
FROM (Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) 
	INNER JOIN (Orders 
		INNER JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID) 
	ON Products.ProductID = "Order Details".ProductID
WHERE (((Orders.ShippedDate) Between '19980101' And '19981231'))
GROUP BY Categories.CategoryName, Products.ProductName
GO

select * from [Product Sales for 1997]

select * from [Product Sales for 1998]

-- ALTER View is also an option
-- Below, we will Alter out [Product Sales for 1998] to remove the WHERE clause

USE [Northwind]
GO

/****** Object:  View [dbo].[Product Sales for 1998]    Script Date: 12/17/2021 1:11:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [dbo].[Product Sales for 1998] AS
SELECT Categories.CategoryName, Products.ProductName, 
		Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ProductSales
FROM (Categories
	  INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) 
	  INNER JOIN 
	  (Orders 
	  INNER JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID) 
	  ON Products.ProductID = "Order Details".ProductID

GROUP BY Categories.CategoryName, Products.ProductName
GO


-- Create a View from scratch using the QueryBuilder
-- Make a view that shows products with their categories

select * from ProductsWIthCategories