SELECT 
    VendorID,
    AVG(CustomerSatisfactionRating) AS SatisfactionScore
FROM 
    VendorRatings
GROUP BY 
    VendorID
