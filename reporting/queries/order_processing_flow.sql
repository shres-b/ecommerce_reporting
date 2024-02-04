SELECT 
    os.StatusDescription AS OrderStatus,
    COUNT(o.OrderID) AS NumberOfOrders
FROM 
    Orders o
JOIN 
    OrderStatus os ON o.OrderStatusID = os.OrderStatusID
WHERE 
    os.StatusDescription IN ('Pending', 'Shipped', 'Returned')
GROUP BY 
    os.StatusDescription
ORDER BY 
    FIELD(os.StatusDescription, 'Pending', 'Shipped', 'Returned');
