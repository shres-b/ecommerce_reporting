SELECT 
    p.VendorID,
    SUM(od.Quantity * od.Price) AS SalesVolume
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.VendorID
