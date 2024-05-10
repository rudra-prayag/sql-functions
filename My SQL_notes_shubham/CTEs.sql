WITH OrderTotals AS (
    SELECT
        o.orderNumber,
        SUM(od.priceEach * od.quantityOrdered) AS total
    FROM
        orderdetails od
    INNER JOIN
        orders o USING (orderNumber)
    GROUP BY
        o.orderNumber
    HAVING
        SUM(od.priceEach * od.quantityOrdered) > 60000
)
SELECT
    c.customerNumber,
    c.customerName
FROM
    customers c
WHERE
    EXISTS (
        SELECT 1
        FROM OrderTotals ot
    );