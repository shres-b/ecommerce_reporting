SELECT 
    p.Name AS ProductName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * od.Price) AS TotalSales
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    od.ProductID, p.Name
ORDER BY 
    TotalQuantitySold DESC
LIMIT 10;
