-- Exercise 1

--1. Which shippers do we have?
select *
from Shippers

--2. Retrieve all columns in the region table
select *
from Region

--3. Select the firstname and lastname columns from the employees table.
SELECT firstname, LastName
from Employees

select employeeid, lastname, firstname, title 
from Employees

--4. Select the firstname and lastname columns from the employees table. Sort by lastname.
select FirstName, LastName
from Employees
ORDER by LastName

select employeeid, lastname, firstname, title 
from Employees 
order by LastName

--5. Select name and unitprice of all products
select ProductName, UnitPrice
from Products

--------------------------------------------------------------------------------
-- Exercise 2

--1. Find the companies (the customerid) that placed orders in 1997
select Distinct CustomerID
from Orders
where YEAR(OrderDate) = 1997

select customerid, OrderDate
from Orders
where orderdate >= '1997-01-01' and orderdate < '1998-01-01'

--2. Show all the orders placed by a specific employee on Mondays in 1997. The employeeid for this
--employee (Steven Buchanan) is 5.
select OrderID
from Orders
where DATENAME(WEEKDAY,OrderDate) = 'Monday' AND YEAR(OrderDate) = 1997 AND EmployeeID = 5

select OrderID, OrderDate
from Orders
where DATENAME(WEEKDAY,OrderDate) = 'Monday' AND YEAR(OrderDate) = 1997 AND EmployeeID = 5

--3. Select names and addresses of customers from London
select CustomerID, ContactName, Address
from Customers
where City = 'London'

--4. Select names and addresses of customers from Spain and from France
Select CustomerID, ContactName, Address
from Customers
where Country = 'France' or Country = 'Spain'

--5. Select names of products with a price less than 10 or greater than 20
select ProductID, ProductName
from Products
where UnitPrice < 10 or UnitPrice > 20

--6. Select names of products with a price between 20.00 a 30.00
select ProductID, ProductName
from Products
where UnitPrice BETWEEN 20 And 30

--------------------------------------------------------------------------------
--Exercise 3

--1. Select names of products from the 'Meat/Poultry' category
select CategoryID, CategoryName
from Categories
where CategoryName = 'Meat/Poultry'

SELECT ProductName, CategoryID
from Products
where CategoryID = 6

--2. Select names of products supplied by 'Tokyo Traders'
select SupplierID, CompanyName
from Suppliers
where CompanyName = 'Tokyo Traders'

select ProductName, SupplierID
from Products
where SupplierID = 4

--joinli çözüm
select p.ProductName, s.SupplierID, s.CompanyName
from Suppliers as s
INNER join Products as p
on s.SupplierID = p.SupplierID
where s.CompanyName = 'Tokyo Traders'

--3. Write a query showing orders sorted by freight from most expensive to cheapest. Show orderid, 
--orderdate, shippeddate, customerid, and freight.
select orderid, orderdate, shippeddate, customerid, freight
from Orders
order by Freight Desc

--4. Write a query showing the title and the first and lastname of all sales representatives.
-- (sales representative is a "Title")
select title, FirstName, LastName
from Employees
where title = 'Sales Representative'

--5. Show the supplierid, contactname, and contacttitle for those suppliers whose contacttitle is not 
--Marketing Manager. 
SELECT supplierid, contactname, contacttitle
from Suppliers
where ContactTitle <> 'Marketing Manager'

--6. Write a query showing the first and last names of all employees who have a region specified.
select FirstName, LastName
from Employees
where Region is not null

--------------------------------------------------------------------------------
--Exercise 4

--1. Write a query showing the first and last names of all employees who have a region specified, showing
--the title of courtesy and the first and last name. Show only employees whose title of courtesy begins
--with "M".
select FirstName, LastName, TitleOfCourtesy
from Employees
where Region is not null and TitleOfCourtesy LIKE 'M%'

--2. Write a query showing the first and last names of all employees who have a region specified. showing
--the first and last name of all sales representatives who are from Seattle or Redmond.
select FirstName, LastName
from Employees
where region is not null
and title = 'Sales Representative'
and (city = 'Seattle' or city = 'Redmond')

--3. Write a query showing the first and last names of all employees who have a region specified.t that
--shows the company name, contact title, city and country of all customers in Mexico or in any city in 
--Spain except Madrid.
select FirstName, LastName
from Employees
where Region is not null

select CompanyName, ContactTitle, City, Country
from Customers
where (country = 'Mexico') or (Country = 'Spain' and city <> 'Madrid')

--4. Write a query that shows the orderid, customerid, and shipcountry for the orders where the 
--shipcountry is either France or Belgium.
SELECT OrderID, CustomerID, ShipCountry
from Orders
where ShipCountry = 'France' or ShipCountry = 'Belgium'

--5. Show orders shipping to any country in Latin America
select *
from Orders
where ShipCountry = ''

--------------------------------------------------------------------------------
--Exercise 5

--1. Search for information about products packed in bottles
select *
from Products
where QuantityPerUnit like '%bottles%'

--2. In the products table, we’d like to see the productid and ProductName for those products where the 
--productname includes the string 'queso'.
select ProductID, ProductName
from Products
where ProductName like '%queso%'

--3. Search for the names and positions of employees whose names start with the letter range "from B to L"
select FirstName, LastName, Title
from Employees
where FirstName like '[B-L]%'

--4. Search for the position of employees whose names start with the letter "B or L"
select FirstName, LastName, Title
from Employees
where FirstName like '[BL]%'

--5. Show products with product names that begin with the letter T or have a product identification
--number of 46, and that have a price greater than $16.00
select *
from Products
where (ProductName like 'T%' or ProductID = 46)
and UnitPrice > 16.00
order by UnitPrice

--6. Show products with product names that begin with the letter T or that have a product identification
--number of 46 and a price greater than $16.00
select *
from Products
where ProductName like 'T%'
or ProductID = 46 
and UnitPrice > 16.00
order by UnitPrice

select *
from Products
where
(ProductName LIKE 'T%')
OR
((ProductID = 46) AND (UnitPrice > 16.00))

-- bu ikisi aynı, yani en üstteki gibi parantezsiz yazarsak, otomatik olarak and kısmını paranteze almış gibi davranacak.
-- ama ((ProductID = 46) AND (UnitPrice > 16.00)) productid 46 bu şartı sağlamadığı için yalnızca ismi t ile başlayanları
-- gösteriyor. yani bu kısmı silsek de sonuç değişmiyor, ama örneğin unitprice ı 10 diye değiştirirsek:

select *
from Products
where
(ProductName LIKE 'T%')
OR
((ProductID = 46) AND (UnitPrice > 10.00))

-- işte o zaman 46 ı yı da gösterecektir, T ile başlamadığı halde. çünkü iki şartı da sağlıyor.

--------------------------------------------------------------------------------
--Exercise 6

--1. If the cost of freight is greater than or equal to $500.00, it will now be taxed by 10%. Create a report 
--that shows the order id, freight cost, freight cost with this tax for all orders of $500 or more.
select OrderID, Freight as 'Freight Cost',
Freight + Freight * 0.10 as 'Freight Cost With Tax'
from Orders
where Freight >= 500.00

--2. Select the order number, order date, and customer number for all unsent orders for which the 
--recipient's country is Argentina
select OrderID, OrderDate, CustomerID
from Orders
where ShippedDate is null
and ShipCountry = 'Argentina' 

--3. Incorporate these fields: unitsinstock, unitsonorder, reorderlevel, discontinued, into calculation. We’ll
--define “products that need reordering” with the following: unitsinstock plus unitsonorder are less 
--than or equal to reorderlevel. The discontinued flag is false (0).
SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products
WHERE (UnitsInStock + UnitsOnOrder) <= ReorderLevel AND Discontinued = 0;
-- bot böyle yaptı

--4. Write a command that calculates the value of each order item for order number 10250
select OrderID, ProductID, UnitPrice, Quantity, (UnitPrice * Quantity) AS OrderItemValue
from [Order Details]
where orderId = 10250

--5. Show the firstname and LastName columns from the employees table, and then create a new column
--called fullname, showing firstname and lastname joined together in one column, with a space in between.
select firstname, lastname, (firstname + ' ' + lastname) as fullname
from Employees

--6. Write a querty that for each supplier will show a single column containing the phone number and fax 
--number separated with a comma
select SupplierID, ContactName, (Phone + ', ' + Fax) as 'Phone and Fax Number'
from Suppliers
--bunda fax olmayınca null diyor

SELECT SupplierID, ContactName, CONCAT(Phone, ', ', Fax) AS PhoneFax
FROM Suppliers;


--------------------------------------------------------------------------------
--Exercise 7

--1. Select all orders shipped in May 1997. Calculate the number of days from the date of order to the 
--shipment
SELECT OrderID, OrderDate, ShippedDate, 
DATEDIFF(day, OrderDate, ShippedDate) AS DaysToShipment
FROM Orders
WHERE ShippedDate >= '1997-05-01' AND ShippedDate < '1997-06-01';

--2. For each employee, display the first name, last name, year of birth, year of employment, the age at
--the time of employment
select FirstName, LastName, 
YEAR(birthDate) as BirthYear, 
Year(HireDate) as HireYear, 
(Year(HireDate) - YEAR(birthDate)) as HireAge
from Employees

--3. Show how many years have passed since January 1, 1990.
SELECT DATEDIFF(YEAR, '1990-01-01', GETDATE()) AS YearsPassedSince1990;

--4. Show how many days have passed since January 1, 1990.
SELECT DATEDIFF(day, '1990-01-01', GETDATE()) AS DaysPassedSince1990;