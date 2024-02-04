SELECT 
    DATE(OrderDate) AS Date,
    SUM(TotalAmount) AS TotalSales
FROM 
    Orders
GROUP BY 
    DATE(OrderDate)
ORDER BY 
    Date;
