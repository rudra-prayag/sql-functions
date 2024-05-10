WITH OrderCounts AS (
    SELECT
        YEAR(orderDate) AS year,
        COUNT(*) AS orderCount
    FROM
        orders
    GROUP BY
        YEAR(orderDate)
)
SELECT
    year,
    orderCount,
    CONCAT(FORMAT((orderCount - LAG(orderCount) OVER (ORDER BY year)) / 
    LAG(orderCount) OVER (ORDER BY year) * 100, 0), '%') AS YoYPercentageChange
FROM
    OrderCounts
ORDER BY
    year;
