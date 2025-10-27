USE adv;
#ESERCIZIO 1
#Implementa una vista denominata Product al fine di creare unʼanagrafica (dimensione) prodotto completa.
# La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome prodotto,
# il nome della sottocategoria associata e il nome della categoria associata.

CREATE VIEW Product AS (
SELECT 
p.EnglishProductName AS nomeprodotto,
c.EnglishProductCategoryName AS nomecategoria,
sc.EnglishProductSubcategoryName AS nomesottocategoria
FROM
dimproduct AS p inner join
dimproductsubcategory AS sc
ON p.ProductSubcategoryKey=sc.ProductSubcategoryKey
INNER JOIN dimproductcategory AS c
ON c.ProductCategoryKey=sc.ProductCategoryKey
);

#ESERCIZIO 2
#Implementa una vista denominata Reseller al fine di creare unʼanagrafica (dimensione) reseller completa
#La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome del reseller, 
#il nome della città e il nome della regione.
CREATE VIEW Reseller AS (
SELECT
r.ResellerName AS nomerivenditore,
g.City AS nomecitta,
g.EnglishCountryRegionName AS nomeregione
FROM dimreseller AS r
INNER JOIN dimgeography AS g
ON r.GeographyKey=g.GeographyKey
);

#ESERCIZIO 3
#Crea una vista denominata Sales che deve restituire la data dellʼordine, il codice documento,
#la riga di corpo del documento, la quantità venduta, lʼimporto totale e il profitto.

CREATE VIEW sales AS (
SELECT
OrderDate,
SalesOrderNumber,
SalesOrderLineNumber,
OrderQuantity,
SalesAmount,
(SalesAmount-TotalProductCost) AS profitto
FROM factresellersales
);

SELECT * FROM adv.Product;
DROP VIEW Product;
DROP VIEW Reseller;
DROP VIEW sales;

USE adv;
#ESERCIZIO 1
#Implementa una vista denominata Product al fine di creare unʼanagrafica (dimensione) prodotto completa.
# La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome prodotto,
# il nome della sottocategoria associata e il nome della categoria associata.

CREATE VIEW Product AS (
SELECT 
p.EnglishProductName AS nomeprodotto,
p.ProductKey AS idprodotto,
c.EnglishProductCategoryName AS nomecategoria,
sc.EnglishProductSubcategoryName AS nomesottocategoria
FROM
dimproduct AS p inner join
dimproductsubcategory AS sc
ON p.ProductSubcategoryKey=sc.ProductSubcategoryKey
INNER JOIN dimproductcategory AS c
ON c.ProductCategoryKey=sc.ProductCategoryKey
);

#ESERCIZIO 2
#Implementa una vista denominata Reseller al fine di creare unʼanagrafica (dimensione) reseller completa
#La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome del reseller, 
#il nome della città e il nome della regione.
CREATE VIEW Reseller AS (
SELECT
r.ResellerName AS nomerivenditore,
r.ResellerKey AS idreseller,
g.City AS nomecitta,
g.EnglishCountryRegionName AS nomeregione
FROM dimreseller AS r
INNER JOIN dimgeography AS g
ON r.GeographyKey=g.GeographyKey
);

#ESERCIZIO 3
#Crea una vista denominata Sales che deve restituire la data dellʼordine, il codice documento,
#la riga di corpo del documento, la quantità venduta, lʼimporto totale e il profitto.

CREATE VIEW sales AS (
SELECT
OrderDate,
SalesOrderNumber,
SalesOrderLineNumber,
ResellerKey,
OrderQuantity,
SalesAmount,
(SalesAmount-TotalProductCost) AS profitto
FROM factresellersales
);

DROP VIEW sales;

CREATE VIEW sales AS (
SELECT
OrderDate,
SalesOrderNumber,
SalesOrderLineNumber,
ResellerKey AS idreseller,
ProductKey AS idprodotto,
OrderQuantity,
SalesAmount,
(SalesAmount-TotalProductCost) AS profitto
FROM factresellersales
);