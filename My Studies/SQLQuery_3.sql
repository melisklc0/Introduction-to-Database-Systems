-- Exercise 1 (Northwind)

-- 1. Select he names of products and the companies that supply the products.
-- Products without listed suppliers and suppliers without current products should
-- be not included in the result set.

-- 2. Select the names of customers who placed orders after 1/1/98


-- Exercise 2 (Northwind)
-- 1. Display a list of products ordered each day

-- 2. Display a list of products ordered 7/8/96

SELECT DISTINCT orderdate, productname
from products AS p
JOIN [Order Details] AS od
ON p.ProductID = od.ProductID
JOIN Orders AS o
on  o.OrderID = od.OrderID
WHERE OrderDate = '7/8/96'


-- 3. Display a list of products ordered in 1997

SELECT DISTINCT orderdate, productname
from products AS p
JOIN [Order Details] AS od
ON p.ProductID = od.ProductID
JOIN Orders AS o
on  o.OrderID = od.OrderID
WHERE OrderDate = '7/8/97'


-- Exercise 3 (Northwind)

-- 1. Select customers with order dates. Customers without any order should be not
-- included in the result set

SELECT
FROM Customers AS c
JOIN Order as o
ON c.CustomerID = o.CustomerID


-- 2. Select all customers with order dates
-- 3. Select customers without any order



--Select all customers with an order in 1997

SELECT Distinct CompanyName, c.ContactName
From Customers As c
JOIN Orders As o
On c.CustomerID = o.CustomerID
where o.OrderDate >= '1997-01-01' AND o.OrderDate <= '1997-12-31'

--Select all customers without any order in 1997

SELECT CompanyName, c.ContactName
From Customers As c
LEFT JOIN Orders As o
On c.CustomerID = o.CustomerID
AND o.OrderDate >= '1997-01-01' AND o.OrderDate <= '1997-12-31'
where orderID is NULL

select count(*)
from customers

-- Exercise 5 (Northwind)
-- 1. For each product display its category name and its supplier name

-- 2. Display customers who have bought products from the „confections” category

SELECT Distinct CompanyName
FROM customers as c
JOIN orders as o on c.CustomerID = o.CustomerID
JOIN [Order Details] as oc on o.OrderID = oc.OrderID
JOIN Products as p on oc.ProductID = p.ProductID
JOIN Categories as ca on p.CategoryID = ca.CategoryID
WHERE CategoryName = 'confections'

-- 3. Display customers who have not bought products from the „confections”
-- category
-- 4. Display customers who have not bought products from the „confections”
-- category in may 1997