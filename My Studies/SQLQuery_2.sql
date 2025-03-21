select ProductID, ProductName, companyname, Suppliers.SupplierID
     from Products
     inner join Suppliers
     on products.SupplierID = Suppliers.SupplierID

     select * from Products where ProductID = 10
     SELECT * FROM Suppliers where SupplierID = 4

     -----------------------------------

     select productname, companyname
     from Products
     inner join Suppliers
     on products.ProductID = Suppliers.SupplierID
     order by ProductID
     -----------  this query is wrong --------------
     -- if we have complex query we have to check the simpler version to be sure


     SELECT companyname, Customers.CustomerID, orderdate
     FROM customers JOIN orders
     ON customers.CustomerID = orders.CustomerID

     SELECT companyname, Customers.CustomerID, orderdate
     FROM customers LEFT JOIN orders
     ON customers.CustomerID = orders.CustomerID
     where OrderDate is NULL
     -------------- very important -----------------

     select * from orders where CustomerID = 'PARIS'
     -- for checking


-------------------- Hocanin ornek cozumleri

-- -- 1. Show the number of orders ordered by each customer
-- SELECT o.CustomerID, COUNT(*) AS OrderCount
-- FROM Orders o
-- GROUP BY o.CustomerID
-- ORDER BY OrderCount DESC;

-- SELECT c.CompanyName, COUNT(*) AS OrderCount
-- FROM Customers c
-- INNER JOIN Orders o ON c.CustomerID = o.CustomerID
-- GROUP BY c.CustomerID, c.CompanyName
-- ORDER BY OrderCount DESC;

-- -- Show the number of books reserved by each library member

-- USE library
-- SELECT member_no, COUNT(*)
-- FROM reservation
-- GROUP BY member_no

-- SELECT reservation.member_no, COUNT(*)
-- FROM reservation JOIN member ON member.member_no = reservation.member_no
-- GROUP BY reservation.member_no

-- SELECT lastname, COUNT(*)
-- FROM reservation JOIN member ON member.member_no = reservation.member_no
-- GROUP BY lastname, member.member_no
----------------------------------------------------------------------


-- Exercise 1
-- 1. Show the number of orders ordered by each customer

-- first ) which table
-- second) group by what

     select c.companyname, COUNT(*) AS Ordercount
     from customers c
     inner join orders o ON c. CustomerID = o.CustomerID
     GROUP BY c.CustomerID, c.CompanyName
     ORDER BY Ordercount DESC


-- 2. Show the number of products in each category

    SELECT c.categoryname, COUNT(*) AS productcount
    from Categories c
    left join Products p on c.CategoryID = p.CategoryID
    GROUP BY c.CategoryName
    ORDER BY productcount DESC

-- 3. Show the average price for products in each category

    SELECT c.categoryname, AVG(P.UnitPrice) AS AvgPrice
    from Categories c
    left join Products p on c.CategoryID = p.CategoryID
    GROUP BY c.CategoryName
    ORDER BY AvgPrice DESC

-- 4. Show the amount of the order 10250

    Select *
    From [Order Details]
    where OrderID = 10250

    SELECT OrderID, ROUND(SUM(UnitPrice * Quantity*(1-Discount)),2) AS OrderAmount
    FROM [Order Details]
    WHERE OrderID = 10250
    GROUP BY OrderID

    SELECT OrderID, Cast(SUM(UnitPrice * Quantity*(1-Discount)) as decimal(10,2)) AS OrderAmount
    FROM [Order Details]
    WHERE OrderID = 10250
    GROUP BY OrderID

-- Exercise 2
-- 1. Calculate the total sale amount for each order in the order details table, and return
-- the results in descending order.

    SELECT OrderID, SUM(UnitPrice*Quantity*(1-Discount)) AS Amount
    FROM [Order Details]
    GROUP BY OrderID
    ORDER BY Amount DESC


    SELECT Orders.OrderID, Customers.CompanyName, SUM(UnitPrice*Quantity*(1-Discount)) AS Amount --bunu biz belirliyoruz (degisken ismi)
    FROM [Order Details]
    JOIN Orders ON [Order Details].OrderID = Orders.OrderID
    JOIN Customers ON Customers.CustomerID = Orders.CustomerID
    GROUP BY Orders.OrderID, Customers.CompanyName -- if you add something to the first line, you also have to add it here.
    ORDER BY Amount DESC

-- 2. Modify the query described in 1) so that the query returns the first ten rows.

    SELECT TOP 10 OrderID , SUM([Order Details].UnitPrice * [Order Details].Quantity * (1-Discount)) as totalsale
    FROM [Order Details]
    GROUP BY OrderID
    ORDER BY totalsale DESC;

-- 3. Modify the query described in 2 to return the top ten products (including ties)
-- having the highest total quantity


-- Exercise 3
-- 1. Show the total amount for each order
-- 2. How many orders was shipped by each shipper in 1997


-- 3. Which shipper was most active in 1997

    select top 1 ShipVia, companyname,COUNT(*) AS TotalSales
    from Orders o join Shippers s on s.ShipperID = o.ShipVia
    where YEAR(ShippedDate) = 1997
    group by ShipVia, companyname
    order by TotalSales desc


-- Exercise 5
-- 1. For each members of the library show the number of reserved books
-- yukarda cozuldu
-- 2. For each members of the library show the number of currently loaned books

-- 3. For each members of the library show the number of books returned in 2001
-- teamste son atilan olmasi lazim