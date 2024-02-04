SELECT 
v.Name,
sv.SalesVolume,
rd.ReliabilityScore,
cs.SatisfactionScore,
(sv.SalesVolume + rd.ReliabilityScore + cs.SatisfactionScore) / 3 AS OverallScore
FROM 
Vendors v
JOIN 
(/* Sales Volume Subquery */...) sv ON v.VendorID = sv.VendorID
JOIN 
(/* Reliability Score Subquery */...) rd ON v.VendorID = rd.VendorID
JOIN 
(/* Satisfaction Score Subquery */...) cs ON v.VendorID = cs.VendorID
ORDER BY 
    OverallScore DESC
LIMIT 3;
