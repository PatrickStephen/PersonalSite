--=================================--
--======Module 11: Set Theory======--
--=================================--

/*
	TOP: returns the first X number (or percent) of records

	UNION (all): Combines 2 or more datasets that have the same number of column
				 and the same data types in those columns
				 -Removes duplicates unless you use the ALL keyword

	EXCEPT: Combines 2 or more datasets but ONLY KEEPS the rows from the 1st set 
			that were NOT duplicated in the 2nd set

	INTERSECT: Returns all records that are common/shared between compared sets
*/

use Northwind;

--Show all company names in Northwind
select CompanyName
from Customers
union
select CompanyName
from Shippers
union
select CompanyName
from Suppliers

-- Show cities of customers and suppliers
select City
from Customers
union -- UNION ALL would have included duplicates in the result
select City
from Suppliers


-- Show cities for customers that aren't in the same city as supplier
select City
from Customers
except
Select City
From Suppliers

--Show cities for suppliers that aren't in the same city as customers
select City
from Suppliers
except
Select City
From Customers


--TOP will return a number or percentage of records
-- With TOP, we typically use an ORDER BY, otherwise
	--we just receive the first rows that appear in the dataset

-- Show the top 5 most expensive products
select top 5 ProductName, UnitPrice
from Products
order by UnitPrice desc

-- Show the top 10% most expensive products
select top 10 percent ProductName, UnitPrice
from Products
order by UnitPrice desc

-- Show the 10 most recent orders
select top 10 *
from Orders
order by OrderDate desc

--If there is a tie when performing a TOP selection,
-- they are automatically filtered out. To include any ties,
-- we can simply type with ties.
select top 9 with ties ProductName, UnitPrice
from products
order by UnitPrice

--INTERSECT
-- Show cities that have both a customer and a supplier
select city
from suppliers
Intersect
select City
from Customers


								--MINI-LAB!
use BookStore;

-- 1) List all book titles and magazine titles
select BookTitle
from Books
union
select MagazineTitle
from Magazines

-- 2) Show the name, city, and state of authors and publishers
select FirstName + ' ' + LastName [Name], City, [State]
from Authors
union
select PublisherName, City, [State]
from Publishers


-- 3) Show book genres and magazine categories
select GenreName [Classification]
from Genres
union
select Category
from Magazines

-- 4) Show states that have both an author and a publisher
select [State]
from Authors
intersect
select [State]
from Publishers

-- 5) Show the three worst-selling books that have been published
select top 3 BookTitle, UnitsSold
from Books
where PublishDate is not null
order by UnitsSold asc

-- 6) Show the top 50% best-selling books
select top 50 percent BookTitle, UnitsSold
from Books
order by UnitsSold desc
