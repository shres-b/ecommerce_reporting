SELECT 
    VendorID,
    AVG(CASE WHEN DeliveryOnTime THEN 1 ELSE 0 END) AS ReliabilityScore
FROM 
    VendorDeliveries
GROUP BY 
    VendorID
