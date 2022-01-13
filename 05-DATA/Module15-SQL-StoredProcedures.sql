--========================================--
--======Module 15: Stored Procedures======--
--========================================--

/*

	Sometimes called sprocs or usp (user-stored procedure).
	
	Benefits:
		- Reusable code
		- Cacheing (perfomance boost)
		- Consistency
		- Accepts parameters
		- Allow full CRUD funtionality - Create/Read/Update/Delete
		- Can store sorting logic (Order by)

	Limitations:
		- More work to set them up

*/

use Northwind;

-- CODE Template to CREATE a Stored Procedure
-- CREATE PROCEDURE sprocName
	-- Parameters
	-- AS
	-- BEGIN
		-- //Code Goes Here//
	-- END

-- CODE Template to RUN the Stored Procedure:
	-- EXECUTE sprocName
	--		 OR
	-- EXEC sprocName

-- Created a USP that will list suppliers that have supplied to customers

create procedure sprocsSuppliersToCustomers
-- If there were any parameters, we would list them here
as
begin
	select distinct s.CompanyName [Supplier] , c.CompanyName [Customer]
	from Suppliers s
	inner join Products p ON s.SupplierID = p.SupplierID
	inner join [Order Details] od ON p.ProductID = od.ProductID
	inner join Orders o ON o.OrderID = od.OrderID
	inner join Customers c ON c.CustomerID = o.CustomerID
	order by Customer, Supplier
end

-- Once created, refresh your object explorer and look in the
	--programmability/store procedures forlder for the database
	--in which you have created the procedure.

-- To run the stored procedure, use EXEC/EXECUTE

exec sprocsSuppliersToCustomers

-- You can alter a sproc with ALTER PROCEDURE sprocName
-- Let's add an new parameter that defaults to 'ALFKI' for the targeted customer

alter procedure sprocsSuppliersToCustomers
-- Parameters go here
-- Includes a new parameter for filtering by CustomerID
-- Must use @ for SQL parameter names, Must note the data type
@CustomerID nchar(5) = 'ALFKI'
-- We didn't have to make sure the parameter name the same as the colmn/field, but
-- it is the best practice for ease of reading. Also, defaulting the parameter
-- to a value ('ALFKI' in this case) is purely optional

as
begin
	select distinct s.CompanyName [Supplier] , c.CompanyName [Customer]
	from Suppliers s
	inner join Products p ON s.SupplierID = p.SupplierID
	inner join [Order Details] od ON p.ProductID = od.ProductID
	inner join Orders o ON o.OrderID = od.OrderID
	inner join Customers c ON c.CustomerID = o.CustomerID
	where c.CustomerID = @CustomerID
	order by Customer, Supplier
end

execute sprocsSuppliersToCustomers -- No arguments passed (default parameter value used

execute sprocsSuppliersToCustomers 'BOTTM' -- New value passed as argument

execute sprocsSuppliersToCustomers 'OCEAN' -- New value passed as argument


-- Make and test a sproc that lets us insert new publisher records

use BookStore;

create procedure uspCreatePublisher
-- Parameters
	@PublisherName varchar(50),
	@City varchar(20),
	@State char(2),
	@IsActive bit
as
begin
	insert Publishers(PublisherName, City, [State], IsActive)
	values(@PublisherName, @City, @State, @IsActive)
end

select * from Publishers

execute uspCreatePublisher 'Faker McFakerson and Sons', 'Anywheresville', 'AZ', 1