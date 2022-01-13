--=====================--
--===Module 6 - CRUD===--
--=====================--

--CRUD - CREATE READ/RETRIEVE UPDATE DELETE
--If we say our app has CRUD functionality, we mean "we're using a db.
--and not only can we select info for use, we can make changes to records."

--CODE TEMPLATES
/*
-------CREATE A RECORD------
INSERTS can be written 2 ways - By column position, or by column name

-- COLUMN NAME --
INSERT Tablename
(field1, field2, ...)--optional but advised
VALUES
(value1, value2, ...)--record 1
,(value1, value2, ...)--record 2

OR (shorcut syntax for smaller tables)
-- COLUMN POSITION --
INSERT Tablename
VALUES
(value1, value2, ...)--must account for all fields that don't auto-populate
--in order of table design


-------DELETE A RECORD------
DELETE FROM TableName
WHERE (condition that targets only desired records)

-------UPDATE/EDIT A RECORD------
UPDATE TableName
SET field1 = value1, field2 = value2 ...
WHERE (condition that targets only desired records)
*/

use Northwind;

-- Create a new category using the Column Position method
--insert Categories
--values('FAKE CATEGORY', 'TOTALLY FAKE DESCRIPTION', NULL);
-- We inserted [CategoryName], [Descritption], and NULL for [Picture]
-- We did NOT insert a CategoryID -- that value is auto-incremented

select * from Categories

-- Best practice version of INSERT - list the fields first (Inserting by Colmn Name)
Insert Products
(ProductName, UnitPrice, Discontinued)
values('Chicken Zangers del Adam', 199, 0); --bits: 0 == false, 1 == true

select * from Products;

-- Update our new category -- best practice with updates and deletes -- TEST YOUR WHERE CLAUSE WITH A SELECT!
--select * from Categories
update Categories set CategoryName = 'Still Fake', Description = 'Alas, this is still not a real category.'
where CategoryID = 9;

select * from Categories

-- Delete our new category - USE A WHERE CLAUSE!
--select * from Categories
delete from Categories
where CategoryID = 9;

select * from Categories

-- When removing records from a table, the best way to clear an ENTIRE table (aka DELETE ALL OF THE ROWS)
-- is with TRUNCATE[TableName]

--MINI-LAB
use Books;
-- 1) Add the following record to publishers - insert by column position
-- pub_id=P05
-- pub_name=Fake House
-- city=El Paso
-- state=tx
-- country=usa
insert publishers
values('P05','Fake House','El Paso','TX','USA')

-- 2) Add the following record to authors - insert by column name
-- au_id=A08
-- au_fname=Georgio
-- au_lname=Williams
-- phone=555-867-5309
-- address=123 S Circle Dr
-- city=Grand Rapids
-- state=MI
-- zip=49501
insert authors
(au_id,au_fname, au_lname, phone, [address], city, [state], zip)
values('A08','Georgio','Williams','555-867-5309','123 S Circle Dr','Grand Rapids','MI','49501')

-- 3) Update the publisher name in publishers from 'Fake House' to 'Real House'
update publishers set pub_name = 'Real House'
where pub_id = 'P05'
