SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    SUM(TotalAmount) AS TotalSales
FROM 
    Orders
GROUP BY 
    Month
ORDER BY 
    Month;
