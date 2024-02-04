-- insert sample data

INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('John Doe', 'johndoe@example.com', '123-456-7890', '123 Maple Street'),
('Jane Smith', 'janesmith@example.com', '987-654-3210', '456 Oak Avenue'),
('Alice Johnson', 'alicej@example.com', '555-666-7777', '789 Pine Road'),
('Bob Brown', 'bobb@example.com', '222-333-4444', '1012 Cedar Lane');

INSERT INTO Vendors (Name, Rating, ContactInfo) VALUES
('Green Farms', 4.5, 'greenfarms@farm.com'),
('Orchard Inc.', 4.7, 'contact@orchard.com'),
('Fresh Veggies Co.', 4.6, 'info@freshveggies.co'),
('Tropical Fruits Ltd.', 4.8, 'sales@tropicalfruits.com');

INSERT INTO ProductCategories (CategoryName) VALUES
('Vegetables'),
('Fruits'),
('Groceries');

INSERT INTO Products (VendorID, Name, CategoryID, Price, StockQuantity) VALUES
(1, 'Organic Carrot', 1, 50, 100),
(2, 'Organic Apple', 2, 80, 150),
(1, 'Organic Tomato', 1, 60, 90),
(2, 'Organic Banana', 2, 30, 200);

INSERT INTO OrderStatus (StatusDescription) VALUES
('Pending'),
('Shipped'),
('Returned'),
('Delivered');


INSERT INTO Orders (CustomerID, OrderStatusID, OrderDate, TotalAmount) VALUES
(1, 1, '2022-01-01', 130),
(2, 2, '2022-01-02', 80),
(3, 1, '2022-01-03', 210),
(4, 3, '2022-01-04', 110);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 2, 100),
(1, 2, 1, 80),
(2, 2, 1, 80),
(2, 3, 3, 180);

INSERT INTO IssueTypes (TypeName) VALUES
('Delivery delays'),
('Quality issues'),
('Billing issues'),
('Pricing issues');

INSERT INTO Complaints (OrderID, CustomerID, IssueTypeID, Description, Status, ResolutionDate) VALUES
(1, 1, 1, 'Late delivery', 'Resolved', '2022-01-05'),
(2, 2, 2, 'Damaged product', 'Unresolved', NULL),
(3, 3, 3, 'Incorrect item', 'Resolved', '2022-01-06'),
(4, 4, 4, 'Missing product', 'Resolved', '2022-01-07');

INSERT INTO Revenue (Date, TotalSales, TotalRefunds, NetRevenue) VALUES
('2022-01-01', 1000, 100, 900),
('2022-01-02', 1500, 50, 1450),
('2022-01-03', 2000, 0, 2000),
('2022-01-04', 1800, 150, 1650);

