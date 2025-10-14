USE AdventureWorksDW;
# espoloro la tabella prodotti dim product
#esercizio 2
SELECT * FROM dimproduct;
#ESERCIZIO PARTE 3-4
SELECT ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag
FROM dimproduct
WHERE FinishedGoodsFlag=1;

#ESERCIZIO 5-6
SELECT ProductKey, ProductAlternateKey, EnglishProductName,StandardCost,ListPrice,
ListPrice-StandardCost AS Markup
FROM dimproduct
WHERE ProductAlternateKey LIKE "FR%" OR "BK%";

#esercizio 7 Scrivi unʼaltra query al fine di esporre lʼelenco dei prodotti finiti il cui prezzo di listino 
#è compreso tra 1000 e 2000.

SELECT ProductKey, ProductAlternateKey, EnglishProductName,StandardCost,ListPrice
FROM dimproduct
WHERE Listprice BETWEEN 1000 AND 2000;

#ESERCIZIO 8
SELECT * FROM dimemployee;

#ESERCIZIO 9 
SELECT EmployeeKey,FirstName,LastName,MiddleName,SalesPersonFlag
FROM dimemployee
WHERE SalesPersonFlag=1;

#ESERCIZIO 10
SELECT * FROM factresellersales;


SELECT SalesOrderNumber, SalesOrderLineNumber, OrderDate, DueDate, ShipDate, ProductKey, TotalProductCost, SalesAmount,
SalesAmount-TotalProductCost as Profit
FROM factresellersales
WHERE OrderDate >= 2020-01-01 AND ProductKey IN (597, 598, 477, 214);















