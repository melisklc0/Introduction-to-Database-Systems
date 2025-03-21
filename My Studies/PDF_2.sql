select employeeid, lastname, firstname, title
from employees
where employeeid = 5

select lastname, city
from employees
where country = 'USA'

select orderid, customerid, orderdate
from orders
where orderdate < '1996-08-01'

select orderid, customerid, orderdate
from orders
where orderdate < '8/1/96'3

select companyname
from customers
where companyname like '%Restaurant%'

-------------------------------
-- Conditional operators
-- =,>,<,>=,<=,<>
-- LIKE, NOT LIKE
-- AND, OR
-- NOT
-- BETWEEN, NOT BETWEEN
-- IN, NOT IN
-- IS NULL, IS NOT NULL
-- ( )

select productname, unitprice
from products
where unitprice BETWEEN 10 and 15
order by UnitPrice

-- between diyince aralık da dahil oluyor. bunla aynı
-- anlama gelir:

SELECT ProductName, UnitPrice
From Products
where UnitPrice >= 10 and UnitPrice <= 15
ORDER by UnitPrice

------------------------

select CompanyName, Country
from Suppliers
where Country in ('Japan','Italy')

select CompanyName, Country
from Suppliers
where Country = 'Japan' or Country = 'Italy'
----------------------------------

SELECT productid, productname, categoryid, unitprice
FROM products
ORDER BY categoryid, unitprice DESC
-- ana sıralama etkeni categoryid, o sırada unitprice
-- ı da kendi içinde sıralıyor

SELECT productid, productname, categoryid, unitprice
FROM products
ORDER BY 3,4 DESC
-- 3. sırada categoryid var, 4 te unitprice

SELECT country
FROM suppliers
ORDER BY country
-- burda aynı ülkeden birden fazla var

SELECT DISTINCT country
FROM suppliers
ORDER BY country
-- artık hepsinden birer kere yazılıyor
----------------------

SELECT firstname AS First, lastname AS Last
,employeeid AS 'Employee ID:' 
FROM employees
-- as ifadesini select kısmına yazarsak column name
-- değiştirmiş oluruz

SELECT firstname, lastname
,'Identification number:', employeeid
FROM employees

SELECT orderid, unitprice * 1.05 as newunitprice
FROM [order details]
----------------------------

SELECT firstname + ' ' + lastname as imie_nazwisko
FROM employees

select firstname, lastname
from Employees

