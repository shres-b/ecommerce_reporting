SELECT 
    YEAR(OrderDate) AS Year,
    QUARTER(OrderDate) AS Quarter,
    SUM(TotalAmount) AS TotalSales
FROM 
    Orders
GROUP BY 
    Year, Quarter
ORDER BY 
    Year, Quarter;
