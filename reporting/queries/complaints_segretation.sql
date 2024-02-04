SELECT 
    it.TypeName AS IssueType,
    COUNT(c.ComplaintID) AS NumberOfComplaints
FROM 
    Complaints c
JOIN 
    IssueTypes it ON c.IssueTypeID = it.IssueTypeID
GROUP BY 
    it.TypeName
ORDER BY 
    NumberOfComplaints DESC;
