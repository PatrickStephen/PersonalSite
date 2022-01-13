--==========================--
--======Module 13: XML======--
--==========================--

/*

	- XML stands for Extensible Markup Language (like HTML, but more flexible)
	- XML can be used to pass data in a systematic way w/o all of the overhead
		of an RDMBS (Relational Database Management System)
	- It can even be used as a simple text file for systematic data ( but you
		wouldn't want to maintain a big database this way)
	- Can be compared to JSON, altenative flatfile data format

	-- ALSO, if we send XML data to a browser it requires a dedicated parser
		whereas JSON is JS... it can be read by the browser AUTOMATICALLY
	-- We can convert RDBMS data to XML using the FOR XML PATH() in SQL

*/


use Northwind;

--The query below will produce a clickable link to see the
-- result in XML format. ALternatively, we can save the 
-- XML result set once generated
select ProductName, UnitPrice, UnitsInStock
from Products
for XML path('Product') -- The string value is just a name for the XML result set