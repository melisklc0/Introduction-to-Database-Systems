SELECT TOP 5 orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC

SELECT TOP 5 WITH TIES orderid, productid, quantity
FROM [order details]
ORDER BY quantity DESC



SELECT productname, unitprice
,( SELECT AVG(unitprice) FROM products) AS average
,unitprice-(SELECT AVG(unitprice) FROM products) AS 
difference
FROM products
WHERE unitprice > ( SELECT AVG(unitprice) FROM products) 
