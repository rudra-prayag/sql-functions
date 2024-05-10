SELECT
    YEAR(orderDate) AS year,
    DATE_FORMAT(orderDate, '%b') AS monthName,
    COUNT(*) AS orderCount,
    CONCAT(FORMAT((COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY YEAR(orderDate), MONTH(orderDate))) / 
    LAG(COUNT(*)) OVER (ORDER BY YEAR(orderDate), MONTH(orderDate)) * 100, 0), '%') AS YoYPercentageChange
FROM orders
GROUP BY YEAR(orderDate), monthName, MONTH(orderDate)
ORDER BY YEAR(orderDate), MONTH(orderDate);