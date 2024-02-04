SELECT 
    p.Name AS ProductName,
    v.Name AS VendorName,
    SUM(od.Quantity) AS TotalQuantitySold
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    Vendors v ON p.VendorID = v.VendorID
GROUP BY 
    p.ProductID, v.VendorID
ORDER BY 
    TotalQuantitySold DESC
LIMIT 10;
