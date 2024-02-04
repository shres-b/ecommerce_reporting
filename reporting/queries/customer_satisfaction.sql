
SELECT 
    orderData.Date,
    IFNULL(orderData.TotalOrders, 0) AS TotalOrders,
    IFNULL(complaintData.TotalComplaints, 0) AS TotalComplaints,
    IFNULL(complaintData.TotalComplaints, 0) / IFNULL(orderData.TotalOrders, 1) AS ComplaintsToOrdersRatio
FROM
    (SELECT 
        DATE(OrderDate) AS Date,
        COUNT(*) AS TotalOrders
    FROM 
        Orders
    GROUP BY 
        DATE(OrderDate)) AS orderData
LEFT JOIN
    (SELECT 
        DATE(ComplaintDate) AS Date,
        COUNT(*) AS TotalComplaints
    FROM 
        Complaints
    GROUP BY 
        DATE(ComplaintDate)) AS complaintData ON orderData.Date = complaintData.Date
ORDER BY 
    orderData.Date ASC;
