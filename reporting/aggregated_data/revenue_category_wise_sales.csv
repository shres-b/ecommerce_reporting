SELECT 
    pc.CategoryName,
    SUM(od.Quantity * od.Price) AS TotalSales
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    ProductCategories pc ON p.CategoryID = pc.CategoryID
GROUP BY 
    pc.CategoryName
ORDER BY 
    TotalSales DESC;
