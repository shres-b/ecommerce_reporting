SELECT 
    CustomerID,
    DATE(OrderDate) AS OrderDate,
    SUM(TotalAmount) AS TotalOrderValue
FROM 
    Orders
GROUP BY 
    CustomerID, DATE(OrderDate)
ORDER BY 
    TotalOrderValue DESC
LIMIT 10;

SELECT 
    CustomerID,
    DATE_FORMAT(OrderDate, '%Y-%m') AS OrderMonth,
    SUM(TotalAmount) AS TotalOrderValue
FROM 
    Orders
GROUP BY 
    CustomerID, DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY 
    TotalOrderValue DESC
LIMIT 10;
