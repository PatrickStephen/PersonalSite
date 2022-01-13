--=========================================--
--===Module 5 - Grouping and Summarizing===--
--=========================================--

-- Aggregate functions aren't applied to give a result for each row like the other functions we've seen.
-- Instead they are applied against a group of value to return a single result
-- ********** EACH AGGREGATE FUNCTION RETURNS 1 RESULT **********
-- Nulls are ignored by all aggregate functions EXCEPT for COUNT(*)


/*
	Aggregate Functions Include:
	- MIN() - returns the lowest value in the column
	- MAX() - returns the Highest value in the column
	- SUM() - adds all values in a column and returns the result
	- AVG() - calculates the avg of all values in the column and returns the result
	- COUNT(ColumnName) - returns the total number of non-null values in a column
	- COUNT(*) - returns the total number of records in a date set
*/

USE Northwind;

-- Aggregates for units in stock

select avg(UnitsInStock) AS [Average],
	   max(UnitsInStock) AS [Max],
	   min(UnitsInStock) AS [Min],
	   sum(UnitsInStock) AS [Sum],
	   count(UnitsInStock) AS [Count/Column],
	   max(*) AS [Count/ All Products]
from Products

-- Count(*) will count all records, regardless if thye have null values or not
-- Show the # of customers vs the total # of customers with a fax#
select Count(*) AS [Nbr of Customers],
	   Count(Fax) AS [Nbr of Customers w/ Fax]
from Customers

-- We CANNOT mix aggregates and non-aggregate without another clause
select Max(UnitPrice) AS [Highest Price], CategoryID
from Products
--above statement causes an error

-- Show the highest price for each category
select Max(UnitPrice) AS [Highest Price], CategoryID
from Products
Group By CategoryID

-- Show the number of customers from each country

select Country, Count(*) AS [Nbr of Custmers]
from Customers
where Country IS NOT NULL -- Remove count for null countries
Group By Country

-- We can also combine multiple aggregates with a GROUP BY
select ShipCountry, AVG(Freight) AS [Avg Freight], Count(*) AS [Nbr of Orders]
from Orders
Group By ShipCountry

--To filter aggregates, we can bring in another clause -- HAVING
-- WHERE is used to filter columns or to filter results BEFORE aggregates are calculated
-- HAVING is used to filter results AFTER aggregates are calculated (after grouping the results)

-- Show the avg freight brken down by city where the avg is over $100
select ShipCity, Format(AVG(Freight), 'c') AS [Avg Freight]
from Orders
Group by ShipCity
Having AVG(Freight) > 100 -- This filters the GROUP BY results
Order by [Avg Freight]

-- Show total number of units in stock by category, only for those with more than 300 units in stock
select CategoryID,sum(UnitsInStock) AS [Sum UIS]
from Products
group by CategoryID
having sum(UnitsInStock) > 300
order by sum(UnitsInStock) DESC

--MINI LAB!
use Books;
-- 1) What is the average price of all titles?
	select Format(AVG(price), 'c') AS [Avg Price]
	from titles


-- 2) What is the total number of books sold?
	select sum(sales) AS [Total Sales]
	from titles


-- 3) What is the estimated gross income (avg price * total units sold)?
	select format((AVG(price) * sum(sales)), 'c') AS [Estimated Gross Income]
	from titles

-- 4) What are the cheapest and most expensive book prices?
	select format(min(price), 'c') AS [Cheapest], Format(MAX(price), 'c') AS [Most Expensive]
	from titles

-- 5) How many titles are listed, and how many are currently published?
	select count(*) AS [Total # of Titles], count(pubdate) AS [Total Published]
	from titles


-- 6) Display the type, average price, cheapest price, and highest price of each type
	select [type], format(avg(price), 'c') AS [Avg Price], Min(price) AS [Cheapest], Max(price) AS [Highest Price]
	from titles
	group by [type]

-- 7) List the pub_id, type, cheapest price, and highest price for each publisher within each type
	select pub_id, [type], Min(price) AS [Cheapest], Max(price) AS [Highest]
	from titles
	group by pub_id, [type]

-- 8) Display the type and average price of all types with an average price greater than $10
	select [type], format(avg(price), 'c') AS [Avg Price]
	from titles
	group by [type]
	having avg(price) > 10

-- 9) Show the pub_id and total units sold for all publishers that have sold less than 30,000 units
	select pub_id, sum(sales) AS [Total Units Sold]
	from titles
	group by pub_id
	having sum(sales) < 30000
