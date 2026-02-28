---> yoy_growth_analysis

-- CTE: Aggregate total revenue per year
with yearly_sales as (
	select
		year(d.FullDateAlternateKey) as order_year,
		sum(fis.SalesAmount) as total_revenue
	from FactInternetSales fis
	join DimDate d
		on fis.OrderDateKey = d.DateKey
	group by
		year(d.FullDateAlternateKey)
),

-- CTE: Fetch previous year's revenue using LAG window function
prev_year_sales as (
	select
		order_year,
		total_revenue,
		lag(total_revenue) over(
			order by order_year
		) as prev_year_revenue
	from yearly_sales
)

-- Final Select: Calculate revenue difference and YoY growth percentage
select
	*,
	total_revenue - prev_year_revenue as revenue_change,
	round(
		(total_revenue - prev_year_revenue) * 100.0
		/ nullif(prev_year_revenue, 0),
	2) as yoy_growth_percent
from prev_year_sales
order by order_year;
