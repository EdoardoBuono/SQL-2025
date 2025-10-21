USE AdventureWorksDW;
#ESERCIZIO 1
#Scrivi una query per verificare che il campo ProductKey nella tabella DimProduct sia una chiave primaria.
# Quali considerazioni/ragionamenti è necessario che tu faccia?
#OGNI VALORE DELLA PRIMARY KEY DEVE ESSERE UNIVOCO E NON NULLO

DESCRIBE dimproduct; #verifico tipo ogni colonna 
SELECT * FROM dimproduct;

SELECT 
COUNT(*) AS totalerighe,
COUNT(DISTINCT ProductKey) AS numeroproductkey,
COUNT(ProductKey) AS non_null,
SUM(ProductKey IS NULL) AS prodottinulli
FROM dimproduct;

#ESERCIZIO 2
#Scrivi una query per verificare che la combinazione dei campi SalesOrderNumber e
#SalesOrderLineNumber sia una PK.
#DEVO FAR VEDERE CHE LE 2 CHIAVI SONO UNIVOCHE E NON NULLE
SELECT * FROM factresellersales;

SELECT
COUNT(*) AS totalerighe,
COUNT(DISTINCT CONCAT( SalesOrderNumber,'-',SalesOrderLineNumber)) AS unioneprimary,
SUM(SalesOrderNumber IS NULL OR SalesOrderLineNumber IS NULL) AS prodottinulli
FROM factresellersales;

#ESERCIZIO 3
#Conta il numero transazioni SalesOrderLineNumber realizzate ogni giorno a partire dal 1 Gennaio 2020.
SELECT * FROM factresellersales;

SELECT
OrderDate,
COUNT(SalesOrderLineNumber) AS numerotransazioni
FROM factresellersales
WHERE OrderDate>='2020-01-01'
GROUP BY OrderDate;

#ESERCIZIO 4
#Calcola il fatturato totale FactResellerSales.SalesAmount), la quantità totale venduta
 #FactResellerSales.OrderQuantity) e il prezzo medio di vendita FactResellerSales.UnitPrice)
# per prodotto DimProduct) a partire dal 1 Gennaio 2020. Il result 
 #set deve esporre pertanto il nome del prodotto, il fatturato totale, la quantità totale venduta e
# il prezzo medio di vendita. I campi in output devono essere parlanti!

SELECT
OrderDate,
p.EnglishProductName AS nome_prodotto,
SUM(f.SalesAmount) AS fatturato_totale,
SUM(f.OrderQuantity) AS quantita_venduta,
AVG(f.UnitPrice) AS prezzo_medio_vendita
FROM factresellersales AS f 
INNER JOIN dimproduct AS p
ON p.ProductKey=f.ProductKey
WHERE OrderDate>='2020-01-01'
GROUP BY p.EnglishProductName;

#foglio 2-esercizio 1
#Calcola il fatturato totale FactResellerSales.SalesAmount) e la quantità totale venduta 
#FactResellerSales.OrderQuantity) per Categoria prodotto DimProductCategory). Il result set
#deve esporre pertanto il nome della categoria prodotto, 
#il fatturato totale e la quantità totale venduta. I campi in output devono essere parlanti!

SELECT
c.EnglishProductCategoryName AS NOMEPRODOTTO,
c.ProductCategoryKey,
SUM(f.SalesAmount) AS fatturato_totale,
SUM(f.OrderQuantity) AS quantita_venduta
FROM factresellersales AS f
INNER JOIN dimproduct AS p
ON f.ProductKey=p.ProductKey
INNER JOIN dimproductsubcategory AS ps
ON ps.ProductSubcategoryKey=p.ProductSubcategoryKey
INNER JOIN dimproductcategory AS c
ON c.ProductCategoryKey=ps.ProductCategoryKey
GROUP BY c.EnglishProductCategoryName;

#Calcola il fatturato totale per area città DimGeography.City) 
#realizzato a partire dal 1 Gennaio 2020. Il result set deve esporre 
#lʼelenco delle città con fatturato realizzato superiore a 60K.
SELECT 
G.City as Città,
SUM(F.SalesAmount) as TotaleFatturato
FROM factresellersales as F
INNER JOIN dimreseller as R                  
ON F.ResellerKey = R.ResellerKey
INNER JOIN dimgeography as G                  
ON R.GeographyKey = G.GeographyKey
WHERE OrderDate > '2020-01-01'
group by G.CITY
Having SUM(SalesAmount) > 60000;






















