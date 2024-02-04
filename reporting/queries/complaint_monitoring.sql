SELECT 
    ResolutionDate,
    SUM(CASE WHEN Status = 'Raised' THEN 1 ELSE 0 END) AS ComplaintsRaised,
    SUM(CASE WHEN Status = 'Addressed' THEN 1 ELSE 0 END) AS ComplaintsAddressed,
    SUM(CASE WHEN Status = 'Unresolved' THEN 1 ELSE 0 END) AS ComplaintsUnresolved
FROM 
    Complaints
GROUP BY 
    ResolutionDate
ORDER BY 
    ResolutionDate ASC;