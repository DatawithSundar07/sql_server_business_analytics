---> running_totals_and_moving_averages

WITH daily_sales AS (
    -- Aggregate revenue at daily level
    SELECT
        d.FullDateAlternateKey AS OrderDate,
        SUM(fis.SalesAmount) AS DailyRevenue
    FROM FactInternetSales fis
    JOIN DimDate d
        ON fis.OrderDateKey = d.DateKey
    GROUP BY d.FullDateAlternateKey
)

SELECT
    OrderDate,
    DailyRevenue,

    -- Running total (cumulative sum from beginning to current row)
    SUM(DailyRevenue) OVER (
        ORDER BY OrderDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Running_Total,

    -- 7-day moving average (current day + previous 6 days)
    AVG(DailyRevenue) OVER (
        ORDER BY OrderDate
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS Moving_Avg_7_Days

FROM daily_sales
ORDER BY OrderDate;
