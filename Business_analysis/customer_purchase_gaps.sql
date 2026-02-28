---> customer_purchase_gaps

-- CTE: Retrieves distinct purchase dates per customer and uses LAG to get the previous purchase date within each customer partition.
WITH customer_orders AS (
	SELECT
		fis.CustomerKey,
		d.FullDateAlternateKey AS OrderDate
	FROM FactInternetSales fis
	JOIN DimDate d
		ON fis.OrderDateKey = d.DateKey
	GROUP BY
		fis.CustomerKey,
		d.FullDateAlternateKey
),
order_with_lag AS (
	SELECT
		CustomerKey,
		OrderDate,
		LAG(OrderDate) OVER (
			PARTITION BY CustomerKey
			ORDER BY OrderDate
		) AS PrevOrderDate
	FROM customer_orders
)

-- Final SELECT: Calculates the number of days between consecutive purchases for each customer using DATEDIFF.
SELECT
	CustomerKey,
	OrderDate,
	PrevOrderDate,
	DATEDIFF(DAY, PrevOrderDate, OrderDate) AS DaysBetweenPurchases
FROM order_with_lag
WHERE PrevOrderDate IS NOT NULL
ORDER BY CustomerKey, OrderDate;
