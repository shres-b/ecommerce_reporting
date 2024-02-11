---- all_queries ----

-- complaint_monitoring

SELECT * from (
SELECT 
    'No',
    'ResolutionDate',
    'ComplaintsRaised',
    'ComplaintsAddressed',
    'ComplaintsUnresolved',
    'ComplaintsResolved'
union all 
SELECT 
    ROW_NUMBER() over ()  No,
    ResolutionDate,
    SUM(CASE WHEN Status = 'Raised' or Status = 'Addressed' or Status = 'Unresolved' or Status = 'Resolved' THEN 1 ELSE 0 END) AS ComplaintsRaised,
    SUM(CASE WHEN Status = 'Addressed' or Status = 'Unresolved' or Status = 'Resolved' THEN 1 ELSE 0 END) AS ComplaintsAddressed,
    SUM(CASE WHEN Status = 'Unresolved' or Status = 'Resolved' THEN 1 ELSE 0 END) AS ComplaintsUnresolved,
    SUM(CASE WHEN Status = 'Resolved' THEN 1 ELSE 0 END) AS ComplaintsResolved
FROM 
    Complaints
GROUP BY 
    ResolutionDate
    
) rst
INTO OUTFILE '/tmp/query_output/complaint_monitoring.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';



-- complaint_segregation

SELECT * from (
SELECT 
    'No',
    'IssueType',
    'NumberOfComplaints'
union all 
SELECT 
    ROW_NUMBER() over ()  No,
    it.TypeName AS IssueType,
    COUNT(c.ComplaintID) AS NumberOfComplaints

FROM 
    Complaints c
JOIN 
    IssueTypes it ON c.IssueTypeID = it.IssueTypeID
GROUP BY 
    it.TypeName

) rst 
INTO OUTFILE '/tmp/query_output/complaint_segregation.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- customer_satisfaction

SELECT * from (
SELECT 
    'No',
    'Date',
    'TotalOrders',
    'TotalComplaints',
    'ComplaintsToOrdersRatio'
union all 
SELECT 
    ROW_NUMBER() over ()  No, 
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
        DATE(ResolutionDate) AS Date,
        COUNT(*) AS TotalComplaints
    FROM 
        Complaints
    GROUP BY 
        DATE(ResolutionDate)) AS complaintData ON orderData.Date = complaintData.Date
) rst 
INTO OUTFILE '/tmp/query_output/customer_satisfaction.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- daily_revenue_monitoring

SELECT * from (
SELECT 
    'No',
    'Date',
    'DailySales',
    'DailyNetRevenue'
union all 
SELECT 
    ROW_NUMBER() over ()  No, 
    Date,
    SUM(TotalSales) AS DailySales,
    SUM(NetRevenue) AS DailyNetRevenue
FROM 
    Revenue
GROUP BY 
    Date
)rst 
INTO OUTFILE '/tmp/query_output/daily_revenue_monitoring.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- daily_effec_ratio_chart

SELECT * from (
SELECT 
    'No',
    'OrderDate',
    'RewardPointsToRevenueRatio'
union all 
SELECT 
    ROW_NUMBER() over ()  No,  
    data.OrderDate,
    data.TotalRewardPoints / data.TotalSales AS RewardPointsToRevenueRatio
FROM
(SELECT
    o.OrderDate,
    SUM(o.RewardPoints) AS TotalRewardPoints,
    sum(r.TotalSales) AS TotalSales
FROM
    Orders o
JOIN
    Revenue r ON o.OrderDate = r.Date
GROUP BY
    o.OrderDate) data
) rst 
INTO OUTFILE '/tmp/query_output/daily_effec_ratio_chart.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- delivery_effic_scatter_plot
SELECT * from (
SELECT 
    'No',
    'OrderID',
    'RewardPoints'
union all 
SELECT 
    ROW_NUMBER() over ()  No,  
    OrderID,
    RewardPoints
FROM
    Orders
where orderstatusid = 4

) rst 
INTO OUTFILE '/tmp/query_output/delivery_effic_scatter_plot.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- in_demand_prod_n_vendors

SELECT * from (
SELECT 
    'No',
    'ProductName',
    'VendorName',
    'TotalQuantitySold'
union all 
SELECT 
    ROW_NUMBER() over ()  No,   
    p.Name AS ProductName,
    v.Name AS VendorName,
    SUM(od.Quantity) AS TotalQuantitySold
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    Vendors v ON p.VendorID = v.VendorID
GROUP BY 
    p.ProductID, v.VendorID
LIMIT 10
) rst 
INTO OUTFILE '/tmp/query_output/in_demand_prod_n_vendors.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- order_processing_flow

SELECT * from (
SELECT 
    'No',
    'OrderStatus',
    'NumberOfOrders'
union all 
SELECT 
    ROW_NUMBER() over ()  No,    
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
) rst 
INTO OUTFILE '/tmp/query_output/order_processing_flow.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- product_inventries


SELECT * from (
SELECT 
    'No',
    'ProductName',
    'AdjustmentDate',
    'CumulativeInventory'
union all 
SELECT 
    ROW_NUMBER() over ()  No,    
    p.Name AS ProductName,
    il.AdjustmentDate,
    SUM(il.QuantityChange) OVER (PARTITION BY il.ProductID ORDER BY il.AdjustmentDate) AS CumulativeInventory
FROM 
    InventoryLog il
JOIN 
    Products p ON il.ProductID = p.ProductID
WHERE 
    p.ProductID IN (SELECT ProductID FROM Products WHERE Name IN ('Organic Carrot', 'Organic Banana', 'Organic Apple')) -- List key products by name

) ast 
INTO OUTFILE '/tmp/query_output/product_inventries.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- revenue_cat_wise_sales

SELECT * from (
SELECT 
    'No',
    'CategoryName',
    'TotalSales'
union all 
SELECT 
    ROW_NUMBER() over ()  No,   
    pc.CategoryName,
    SUM(od.Quantity * p.Price) AS TotalSales

FROM  
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    ProductCategories pc ON p.CategoryID = pc.CategoryID
GROUP BY 
    pc.CategoryName
) ast 
INTO OUTFILE '/tmp/query_output/revenue_cat_wise_sales.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- revenue_sales_agg_daily

SELECT * from (
SELECT 
    'No',
    'Date',
    'TotalSales'
union all 
SELECT 
    ROW_NUMBER() over ()  No,  
    DATE(OrderDate) AS Date,
    SUM(TotalAmount) AS TotalSales
FROM 
    Orders
GROUP BY 
    DATE(OrderDate)
) ast 
INTO OUTFILE '/tmp/query_output/revenue_sales_agg_daily.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- revenue_sales_agg_monthly

SELECT * from (
SELECT 
    'No',
    'Month',
    'TotalSales'
union all 
SELECT 
    ROW_NUMBER() over ()  No,  
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    SUM(TotalAmount) AS TotalSales
FROM  
    Orders
GROUP BY 
    Month
) ast 
INTO OUTFILE '/tmp/query_output/revenue_sales_agg_monthly.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- revenue_sales_agg_quart

SELECT * from (
SELECT 
    'No',
    'Year',
    'Quarter',
    'TotalSales'
union all 
SELECT 
    ROW_NUMBER() over ()  No,   
    YEAR(OrderDate) AS Year,
    QUARTER(OrderDate) AS Quarter,
    SUM(TotalAmount) AS TotalSales
FROM 
    Orders
GROUP BY
    Year, Quarter
) ast 
INTO OUTFILE '/tmp/query_output/revenue_sales_agg_quart.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- revenue_sales_agg_yearly

SELECT * from (
SELECT 
    'No',
    'Year',
    'TotalSales'
union all 
SELECT 
    ROW_NUMBER() over ()  No,   
    YEAR(OrderDate) AS Year,
    SUM(TotalAmount) AS TotalSales
FROM 
    Orders
GROUP BY 
    Year
) ast 
INTO OUTFILE '/tmp/query_output/revenue_sales_agg_yearly.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- revenue_top_selling_items

SELECT * from (
SELECT 
    'No',
    'ProductName',
    'TotalQuantitySold',
    'TotalSales'
union all 
SELECT 
    ROW_NUMBER() over ()  No,    
    p.Name AS ProductName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * p.Price) AS TotalSales
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    od.ProductID, p.Name
LIMIT 10
) rst 
INTO OUTFILE '/tmp/query_output/revenue_top_selling_items.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- top_customer_iden_month

SELECT * from (
SELECT 
    'No',
    'CustomerID',
    'OrderMonth',
    'TotalOrderValue'
union all 
SELECT 
    ROW_NUMBER() over ()  No,  
    CustomerID,
    DATE_FORMAT(OrderDate, '%Y-%m') AS OrderMonth,
    SUM(TotalAmount) AS TotalOrderValue
FROM 
    Orders
GROUP BY 
    CustomerID, DATE_FORMAT(OrderDate, '%Y-%m')
LIMIT 10
) rst 
INTO OUTFILE '/tmp/query_output/top_customer_iden_month.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- top_customer_iden_day

SELECT * from (
SELECT 
    'No',
    'CustomerID',
    'OrderMonth',
    'TotalOrderValue'
union all 
SELECT 
    ROW_NUMBER() over ()  No,  
    CustomerID,
    DATE_FORMAT(OrderDate, '%Y-%m') AS OrderMonth,
    SUM(TotalAmount) AS TotalOrderValue
FROM 
    Orders
GROUP BY 
    CustomerID, DATE_FORMAT(OrderDate, '%Y-%m')
LIMIT 10
) rst 
INTO OUTFILE '/tmp/query_output/top_customer_iden_day.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- vendor_agg_sales_volume

SELECT * from (
SELECT 
    'No',
    'VendorID',
    'SalesVolume'
union all 
SELECT 
    ROW_NUMBER() over ()  No,   
    p.VendorID,
    SUM(od.Quantity * p.Price) AS SalesVolume
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.VendorID
) rst 
INTO OUTFILE '/tmp/query_output/vendor_agg_sales_volume.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- vendor_rating_score_avg

SELECT * from (
SELECT 
    'No',
    'VendorID',
    'SatisfactionScore'
union all 
SELECT 
    ROW_NUMBER() over ()  No,    
    VendorID,
    AVG(Rating) AS SatisfactionScore
FROM 
    Vendors
GROUP BY 
    VendorID
) rst 
INTO OUTFILE '/tmp/query_output/vendor_rating_score_avg.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'; 

