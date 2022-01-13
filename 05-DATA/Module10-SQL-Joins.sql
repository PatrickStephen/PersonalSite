--============================--
--======Module 10: Joins======--
--============================--

--JOINS allow us to add additional, related tables to our queries
--to pull related info across multiple talbes in the database
--FROM is our 1st table in a query
--Each JOIN clause allows us to pull another table into the query.
--1 FROM + 3 JOINS = 4 tables
--There are multiple types of joins
	-- Default Type: INNER JOIN (just type JOIN)
		-- ONLY returns related records from both tables
	-- RIGHT and LEFT JOINS
		-- Return all records from one table and only the related table (right or left)
		-- from the other table
	-- FULL OUTER JOIN
		-- Returns all data from both tables (rarely needed)
	-- SELF JOIN
		-- Connects records in one table back to a record in the same table (rarely needed)
			-- Ex: Employees table where an employee reports back a single, other
			-- employee to their boss
	-- CROSS JOIN
		-- Results in a "Cartesian Product" which in "nonsense" data
		-- can be the result of a syntax error
			-- Extremely rare - but can be userful for testing server performance

use Northwind;

--INNER JOIN--
select ProductName, p.CategoryID, CategoryName
from Products p
Join Categories c ON c.CategoryID = p.CategoryID

--Right JOIN
-- Show all categories and related products
-- Below, we use table aliases in our select to fully qualify the fields
-- we are selecting. This query will execute faster with the aliases.

select p.ProductName, c.CategoryName
from Products p right join Categories c ON c.CategoryID = p.CategoryID

--LEFT JOIN
-- Show all products and related categories

select p.ProductName, c.CategoryName
from Products p left join Categories c ON c.CategoryID = p.CategoryID

insert Categories (CategoryName, [Description])
values ('Exotics', 'Fantasy Foods like ButterBeer')

-- FULL JOIN (FULL OUTER JOIN)
-- Return all products and all categories
select p.ProductName, c.CategoryName
from Products p
full join Categories c ON c.CategoryID = p.CategoryID

--JOIN without table aliases
select ProductName, CompanyName
from Suppliers right join Products ON Suppliers.SupplierID = Products.SupplierID

-- SHOW Productname CategoryName, and the supplier's CompanyName
-- Products, Categories, Suppliers tables are needed here
select p.ProductName, c.CategoryName, s.CompanyName AS [Supplier]
from Products p
join Categories c ON c.CategoryID = p.CategoryID
join Suppliers s ON s.SupplierID = p.SupplierID


--MINI-LAB!
use BookStore;
-- 1) List the ISBN and Publisher for each book
select ISBN, PublisherName [Publisher]
from Books b join Publishers p ON p.PublisherID = b.PublisherID

select ISBN, PublisherName [Publisher]
from Publishers p right join Books ON p.PublisherID = Books.PublisherID 


-- 2) List the book title, author, and author order for each book
select b.BookTitle, a.FirstName + '' + a.LastName [Author], ba.AuthorOrder
from Authors a 
join BookAuthors ba ON a.AuthorID = ba.AuthorID
join Books b ON ba.BookID = b.BookID


-- 3) List all book titles, genres, and publishers sorted by genre and book title
select BookTitle, PublisherName, GenreName
from Books b
join Genres g ON g.GenreID = b.GenreID
join Publishers p ON p.PublisherID = b.PublisherID
Order by GenreName, BookTitle


-- 4) List all book titles, authors, publishers, and genres
select b.BookTitle, a.FirstName + ' ' + a.LastName, p.PublisherName, g.GenreName
from Books b
join Genres g ON b.GenreID = g.GenreID
join Publishers p ON p.PublisherID = b.PublisherID
join BookAuthors ba ON ba.BookID = b.BookID
join Authors a ON a.AuthorID = ba.AuthorID

-- 5) List all book titles and genres for books less than $10
select b.BookTitle, g.GenreName, b.Price
from Books b
left join Genres g ON g.GenreID = b.GenreID
where b.Price < 10
order by b.Price ASC --optional

