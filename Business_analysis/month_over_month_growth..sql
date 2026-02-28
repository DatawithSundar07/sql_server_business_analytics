---> month_over_month_growth

WITH monthly_sales as (
	SELECT
		d.CalendarYear,
		d.MonthNumberOfYear,
		DATENAME(MONTH,d.FullDateAlternateKey) AS Month_Name,
		SUM(fis.SalesAmount) AS TotalRevenue
	FROM FactInternetSales fis
	JOIN DimDate d
		ON fis.OrderDateKey = d.DateKey
	GROUP BY 
		d.CalendarYear,
		d.MonthNumberOfYear,
		DATENAME(MONTH,d.FullDateAlternateKey)
),
sales_with_lag as (
	SELECT
		CalendarYear,
		MonthNumberOfYear,
		Month_Name,
		TotalRevenue,
		LAG(TotalRevenue) OVER(
			ORDER BY CalendarYear,MonthNumberOfYear
			) AS PrevMonthRevenue
	FROM monthly_sales
)
SELECT
	CalendarYear,
	Month_Name,
	TotalRevenue,
	PrevMonthRevenue,
	TotalRevenue - PrevMonthRevenue AS RevenueChange,
	CASE
		WHEN PrevMonthRevenue = 0 OR PrevMonthRevenue is null
		THEN null
		ELSE
		((TotalRevenue - PrevMonthRevenue) * 100.0
		/ PrevMonthRevenue 
		) END AS MoM_Growth_percentage
FROM sales_with_lag
ORDER BY CalendarYear,MonthNumberOfYear
