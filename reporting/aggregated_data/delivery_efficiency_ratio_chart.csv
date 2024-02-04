
SELECT
    o.OrderDate,
    SUM(o.RewardPoints) AS TotalRewardPoints,
    r.TotalSales,
    (SUM(o.RewardPoints) / r.TotalSales) AS RewardPointsToRevenueRatio
FROM
    Orders o
JOIN
    Revenue r ON o.OrderDate = r.Date
GROUP BY
    o.OrderDate
ORDER BY
    o.OrderDate ASC;
