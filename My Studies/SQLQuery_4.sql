select ProductID, ProductName, CategoryID, UnitPrice
from Products
order by 1, 4 DESC

SELECT Country
from Suppliers
ORDER by Country

SELECT DISTINCT Country
from Suppliers
ORDER by Country
-- iki defa sayılanları engeller, her biri bir defa sayılır

select OrderID, unitprice * 1.05 as newunitprice
from [Order Details]

select FirstName, LastName 
,'identification number:', EmployeeID, city
from Employees

select *
from Products
where QuantityPerUnit like '%bottle%'

SELECT ProductID, ProductName, SupplierID, UnitPrice
from Products
where (ProductName LIKE 'T%' OR ProductID = 46)
AND (UnitPrice > 16.00)

SELECT ProductID, ProductName, SupplierID, UnitPrice
from Products
where (ProductName LIKE 'T%') OR ProductID = 46
AND (UnitPrice > 16.00)

select ProductID, ProductName, SupplierID, UnitPrice
from Products where (UnitPrice > 16.00)

select FirstName + ' ' + LastName as imie_nazwisko
from Employees

select top 1 OrderID, ProductID, Quantity
from [Order Details]
ORDER by Quantity DESC

select top 1 with ties OrderID, ProductID, Quantity
from [Order Details]
ORDER by Quantity DESC

select productid, orderid, quantity
from orderhist

select productid, sum(quantity) as total_quantity
from orderhist
GROUP BY productid
-- tüm listeyi productid ye göre gösteriyor

select productid, sum(quantity) as total_quantity
from orderhist
where productid = 3
GROUP BY productid
-- sadece productid = 3 olan satırı gösteriyor

select ProductID, sum(Quantity) as total_quantity
from [Order Details]
GROUP by ProductID
HAVING sum(Quantity) > 1200

select productid, orderid, sum(quantity) AS total_quantity
from orderhist
GROUP by productid, orderid
with ROLLUP
ORDER BY productid, orderid
-- rollup olunca tüm ayrıntılarıyla gösteriyor,
-- null olan yerde toplamı hesaplamış oluyor, hepsi dahil
-- örneğin orderid null olursa tüm orderid leri toplamış oluyor,
-- sadece belli birini değil.

select (firstname + ' ' + lastname) as name,
city, postalcode
from Employees
UNION
select companyname, city, postalcode
from Customers
-- direkt tek tabloya dönüştürüyor




-------------------------------------------------------------------

-- cloud computing notlar

-- %40 kısmı exam (?)
-- iki labı da tamamlayarsak projeye gerek yok.
-- veya bir labı tamamlayıp bir de proje yapabiliriz.
-- ikisi de aynı puan (5)
-- hem exam hem labdan bir puan almış olmak gerekiyor

-- 23 feb e kadar sınav notlarını değiştirebiliyor
-- normalde dersler bitene kadar deadline (son lab 11 dec)
-- exam son derste olacak (fail olursak 2 tane daha hakkımız var)
