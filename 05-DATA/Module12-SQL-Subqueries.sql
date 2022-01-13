--=================================--
--======Module 12: Subqueries======--
--=================================--


/*
	
	- Can be put in SELECT, FROM, WHERE, or HAVING clauses... OR, into other subqueries
	- Max 32 nested subqueries T-SQL, 255 for Oracle
	- Can be put into INSERT, UPDATE, DELETE also

	2 Types of Subqueries

	1. SIMPLE - Can be executed on their own. Will only execute ONCE for an entire result set.

	2. CORRELATED - Are dependent on the base query. Will execute MULTIPLE TIMES, once for EACH
					row in the result set.

*/

use Northwind;

-- Show customers that are in the same city as suppliers
	-- Start with the base query (what we want to see before result set is filtered)

		--Show Customers
		select CompanyName, City
		from Customers

	-- Write the subquery.

		-- Return a list of supplier cities
		select City
		from Suppliers

	-- Combine the queries
	select CompanyName, City
	from Customers
	where City in (select City from Suppliers)

-- Show the name and price of the cheapest product
select ProductName, UnitPrice
from Products
-- WHERE UnitPrice = lowest price in Products

-- Subquery - Find the lowest price in Products
select min(UnitPrice)
from Products

--Combine
select ProductName, UnitPrice
from Products
where UnitPrice = (select min(UnitPrice) from Products)


-- We can also use aggregates in subquery
-- Show all products whose price is above the average price for products

--base
select ProductName, UnitPrice
from Products

--subquery
select Avg(UnitPrice)
from Products

--combine
select ProductName, UnitPrice
from Products
where UnitPrice > (select Avg(UnitPrice) from Products)
order by UnitPrice


-- Show products that are in a category with the longest 3 category names
--base
select ProductName
from Products

--subquery
select top 3 CategoryName, CategoryID
from Categories
order by len(CategoryName) desc

--combine
select ProductName, CategoryID
from Products
where CategoryID in (select top 3 CategoryID from Categories order by len(CategoryName) desc)


-- Show categories with the longest 3 product names

--base
select CategoryName, CategoryID
from Categories

--subquery
select Top 3 ProductName, CategoryID
from Products
order by len(ProductName) desc
-- We CANNOT include ProductName in the SELECT for the subquery because we are only
-- comparing CategoryID -- ProductName in not a field/column in the Categories table

--combine
select CategoryName, CategoryID
from Categories
where CategoryID in (select top 3 CategoryID from Products order by len(ProductName) desc)



--CORRELATED SUBQUERIES
-- These subqueries depend on info from the base query to execute
-- Tables in correlated subqueries must be aliased to work

-- Show products that have a price greater than the avg price for its category

--base
select ProductName, UnitPrice, CategoryID
from Products
-- WHERE UnitPrice > (AVG price for it's category)

--subquery
-- Find the avg price for a specific category
select avg(UnitPrice)
from Products
where CategoryID = 1 -- Hard-coded value... This will be replaced by each
					 -- row's CategoryID when combined

-- Combine
select ProductName, UnitPrice, CategoryID
from Products p1 -- Aliased for use in the subquery
where UnitPrice > (select avg(UnitPrice) 
				   from products p2 --Aliased to refer back to and compare against the base query.
				   where p2.CategoryID = p1.CategoryID)

-- If we want to show the avg price in the result as well, we can take the query from above
-- and adapt it to include the avg price per category in the select

select ProductName, FORMAT(UnitPrice, 'c') AS [UnitPrice], CategoryID,
		Format((select avg(UnitPrice) from Products p2 where p2.CategoryID = p1.CategoryID), 'c') [Avg Category Price]
from Products p1
where UnitPrice > (select avg(UnitPrice)
				   from Products p2
				   where p2.CategoryID = p1.CategoryID)


							--MINI-LAB!
use BookStore;

--Simple 
-- 1) List the title and price of books that were published by publishers
-- in NY or CA
--base
select BookTitle, Price, PublisherID
from Books
-- WHERE PublisherID IN (subquery that finds publishers from NNY and CA)

--subquery
select PublisherID
from Publishers
Where [State] IN ('NY', 'CA')

--combine
select BookTitle, Format(Price, 'C') AS [Price], PublisherID
from Books
where PublisherID IN (select PublisherID 
					  from Publishers 
					  where [State] in ('NY', 'CA'))


-- 2) List the title and price of books that have a price greater than
-- the average price of all books

--base
select BookTitle, Format(Price, 'C') AS [Price]
from Books

--subquery
select avg(Price)
from Books

--combine
select BookTitle, Format(Price, 'C') AS [Price]
from Books
where Price > (select avg(Price) from Books)
order by Price asc

			
			--Correlated
-- 3) List the title and price of books that have a price greater than
-- the average price of books in their genre
select BookTitle, Price
from Books b1
where Price > (select avg(Price)
			   from Books b2
			   where b2.GenreID = b1.GenreID)


-- 4) List the title, price, and total revenue (price * unitssold) for books
-- with a total revenue greater than the average total revenue

select BookTitle, format(Price, 'C')[Price], format((Price * UnitsSold), 'C') [Total Revenue]
from Books
where (Price * UnitsSold) > (select avg(Price * UnitsSold) from Books)

select avg(Price * UnitsSold) from Books

