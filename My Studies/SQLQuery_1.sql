-- EXERCISE 1

-- 1. Which shippers do we have?

select * from Shippers

-- 2. Retrieve all columns in the region table

select * from Region

-- 3. Select the firstname and lastname columns from the employees table.

select employeeid, lastname, firstname, title from Employees

-- 4. Select the firstname and lastname columns from the employees table. Sort by lastname.

select employeeid, lastname, firstname, title from Employees order by LastName

-- 5. Select name and unitprice of all products

select productname, unitprice from Products


--EXERCISE 2

-- 1. Find the companies (the customerid) that placed orders in 1997

select customerid, OrderDate
from Orders
where orderdate >= '1997-01-01' and orderdate < '1998-01-01'

-- 2. Show all the orders placed by a specific employee on Mondays in 1997. The employeeid for this
-- employee (Steven Buchanan) is 5.

select * from Orders
where EmployeeID = 5 and DATENAME(weekday, orderdate) ='MONDAY' and YEAR(OrderDate) = '1997'

-- 3. Select names and addresses of customers from London

select ContactName, Address, city 
from Customers where City = 'London'

-- 4. Select names and addresses of customers from Spain and from France

select ContactName, Address, Country from Customers
where Country = 'Spain' or Country = 'France'

-- 5. Select names of products with a price less than 10 or greater than 20

select ProductName, UnitPrice from Products
where UnitPrice < 10 or UnitPrice > 20

-- 6. Select names of products with a price between 20.00 a 30.00

select ProductName, UnitPrice from Products
where UnitPrice >= 20 and UnitPrice <= 30
-- or we can use this: 
-- where UnitPrice BETWEEN 20 and 30



-- EXERCISE 3

-- 1. Select names of products from the 'Meat/Poultry' category

-- first solution is: (easiest way)

select * from Categories

select ProductName from Products 
where CategoryID = 6

-- second solution is:

declare @id int

set @id = (select categoryid from categories
where CategoryName = 'Meat/Poultry')

select ProductName from Products
where CategoryID = @id

-- third solution is:

select productName , categoryID from Products 
where CategoryId = (select categoryid from Categories
where CategoryName = 'Meat/Poultry')

-- 2. Select names of products supplied by 'Tokyo Traders'

select * from Suppliers

select ProductName , SupplierID from Products
where SupplierID = 4

-- 3. Write a query showing orders sorted by freight from most expensive to cheapest. Show orderid, 
-- orderdate, shippeddate, customerid, and freight.

select orderid, orderdate, shippeddate, customerid, freight from Orders
order by Freight DESC
-- DESC

-- 4. Write a query showing the title and the first and lastname of all sales representatives.

select Title, EmployeeID, FirstName, LastName from Employees

-- 5. Show the supplierid, contactname, and contacttitle for those suppliers whose contacttitle is not 
-- Marketing Manager.


-- 6. Write a query showing the first and last names of all employees who have a region specified

select companyName, fax from Suppliers
where fax IS NULL 
-- you have to use IS NULL. these ones will not work: 
-- fax = NULL
-- fax <> NULL (<> means not equal)
