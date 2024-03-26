SELECT * FROM salesLT.Customer

--1)
SELECT substring(firstname,1,3) FROM saleslt.customer
WHERE customerid =12 
--2)
SELECT upper(lastname) FROM SalesLT.Customer --lower(lastname)
WHERE CustomerID =200
--3)
SELECT REVERSE(firstname), FirstName FROM SalesLT.Customer
WHERE CustomerID= 29780
--4)

SELECT GETDATE()
SELECT year(GETDATE()), month(GETDATE())
GO
SELECT month(GETDATE())
GO
SELECT day(GETDATE())
GO
-- datepart
SELECT datepart(dd,GETDATE())
GO

SELECT datediff(DD,'1979/10/10',GETDATE())

SELECT DATEADD(yy,31,getdate())
--4)
SELECT DATEDIFF(mm,orderdate, GETDATE())
FROM SalesLT.SalesOrderHeader
WHERE SalesOrderID = 71915
GO
--5
SELECT DATEADD(yy,3,sellstartdate)
FROM SalesLT.Product
WHERE ProductID = 775
--6
SELECT DATEPART(dd,shipdate), shipdate
FROM saleslt.salesorderheader
WHERE salesorderid = 71780 

SELECT salesorderid
FROM SalesLT.SalesOrderHeader
WHERE DATEPART(MM,shipdate)=6

--7
SELECT CAST(orderdate as varchar(12)) FROM SalesLT.SalesOrderHeader 

SELECT CONVERT(varchar(12),orderdate,101) FROM SalesLT.SalesOrderHeader

--8
SELECT firstname, middlename, lastname,  firstname + middlename + lastname,
concat_ws(' ', firstname,middlename,lastname)
FROM SalesLt.customer

--9
SELECT firstname, lastname
FROM SalesLT.Customer
WHERE firstname LIKE 'B%'
--10
SELECT * FROM SalesLT.SalesOrderHeader WHERE OrderDate = '2004/06/01'
--11
SELECT productid, unitprice*orderqty valorTotal
FROM SalesLT.SalesOrderDetail
--12
SELECT * FROM saleslt.salesorderheader 
WHERE ModifiedDate < '2006/06/09'
--13
SELECT productid, product.name, product.productcategoryid
FROM saleslt.product,SalesLT.productcategory
WHERE salesLT.product.productcategoryid= SalesLT.productcategory.productcategoryid
 AND
 productcategory.name LIKE 'bikes'

 SELECT productid, product.name, product.productcategoryid
FROM saleslt.product
WHERE productcategoryid = 1

--14
SELECT name, color, size, weight
FROM SalesLT.Product
WHERE StandardCost >= 500

--
SELECT * FROM SalesLT.Product
WHERE Color <>'Black'

SELECT * FROM SalesLT.Product
WHERE Color !='Black'

SELECT * FROM SalesLT.Product
WHERE Color NOT IN ('Black')

SELECT * FROM SalesLT.Product
WHERE Color NOT LIKE 'Black'
--16
SELECT productid, name
FROM SalesLT.Product
WHERE name LIKE 'Ch%' 
--17
SELECT customerid, firstname, lastname
FROM SalesLT.Customer
WHERE FirstName LIKE 'Di_k'
--18
SELECT customerid, CONCAT_WS(firstname, middlename, lastname), phone, EmailAddress
FROM saleslt.customer
--WHERE customerid IN(200,210,220, 230, 240)
--WHERE customerid LIKE '2_0' AND CustomerID between 210 AND 240
WHERE CustomerID between 210 AND 240 AND CustomerID%10=0

SELECT customerid, firstname, lastname
FROM SalesLT.Customer
WHERE FirstName LIKE 'da%'  AND FirstName NOT LIKE '%n%'


--WHERE name LIKE 'Paul[^a|^u]'