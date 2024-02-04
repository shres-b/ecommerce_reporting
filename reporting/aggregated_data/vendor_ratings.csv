SELECT 
    v.Name AS VendorName,
    AVG(vr.DeliveryTimeRating) AS AvgDeliveryTimeRating,
    AVG(vr.ProductQualityRating) AS AvgProductQualityRating,
    AVG(vr.CustomerFeedbackRating) AS AvgCustomerFeedbackRating
FROM 
    VendorRatings vr
JOIN 
    Vendors v ON vr.VendorID = v.VendorID
GROUP BY 
    v.VendorID, v.Name
ORDER BY 
    AvgDeliveryTimeRating DESC, AvgProductQualityRating DESC, AvgCustomerFeedbackRating DESC;
