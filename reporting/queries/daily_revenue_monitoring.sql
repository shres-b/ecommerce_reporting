SELECT 
    Date,
    SUM(TotalSales) AS DailySales,
    SUM(NetRevenue) AS DailyNetRevenue
FROM 
    Revenue
GROUP BY 
    Date
ORDER BY 
    Date ASC;
