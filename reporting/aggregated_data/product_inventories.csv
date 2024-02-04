SELECT 
    p.Name AS ProductName,
    il.AdjustmentDate,
    SUM(il.QuantityChange) OVER (PARTITION BY il.ProductID ORDER BY il.AdjustmentDate) AS CumulativeInventory
FROM 
    InventoryLog il
JOIN 
    Products p ON il.ProductID = p.ProductID
WHERE 
    p.ProductID IN (SELECT ProductID FROM Products WHERE Name IN ('Key Product 1', 'Key Product 2')) -- List key products by name
ORDER BY 
    il.ProductID, il.AdjustmentDate;
