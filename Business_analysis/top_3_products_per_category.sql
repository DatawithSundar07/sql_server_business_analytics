---> top_3_products_per_category

WITH Product_Sales AS (
	SELECT 
		pc.EnglishProductCategoryName AS CategoryName,
		p.EnglishProductName AS ProductName,
		SUM(fis.SalesAmount) AS TotalRevenue
	FROM FactInternetSales AS fis
	JOIN DimProduct AS p
		ON fis.ProductKey = p.ProductKey
	JOIN DimProductSubcategory AS ps
		ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
	JOIN DimProductCategory AS pc
		ON ps.ProductCategoryKey = pc.ProductCategoryKey
	GROUP BY
		pc.EnglishProductCategoryName,
		p.EnglishProductName
),

Ranked_Products as (
SELECT
	CategoryName,
	ProductName,
	TotalRevenue,
	DENSE_RANK() over(
		PARTITION BY CategoryName 
		ORDER BY TotalRevenue DESC
		) AS Ranked_in_category
FROM Product_Sales
)

SELECT
	CategoryName,
	ProductName,
	TotalRevenue
FROM Ranked_Products
WHERE Ranked_in_category < = 3
ORDER BY CategoryName, TotalRevenue DESC;
		
