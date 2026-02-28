---> rolling_7_day_revenue

-- CTE: Aggregates total sales revenue at the daily level from FactInternetSales joined with DimDate.
WITH daily_sales AS (
	SELECT
		d.FullDateAlternateKey AS order_date,
		SUM(fis.SalesAmount) AS total_revenue
	FROM FactInternetSales fis
	JOIN DimDate d
		ON fis.OrderDateKey = d.DateKey
	GROUP BY
		d.FullDateAlternateKey
)

-- Final SELECT: Computes rolling 7-day revenue using a window function over the last 6 rows plus current row ordered by date.
SELECT
	order_date,
	total_revenue,
	SUM(total_revenue) OVER (
		ORDER BY order_date 
		ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
	) AS rolling_7_days_revenue
FROM daily_sales
ORDER BY order_date;
