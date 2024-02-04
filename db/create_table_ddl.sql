-- Create Tables in ecommerce_db in mysql

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Address TEXT
);

CREATE TABLE Vendors (
    VendorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Rating DECIMAL(3,2),
    ContactInfo VARCHAR(255)
);

CREATE TABLE ProductCategories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    VendorID INT,
    Name VARCHAR(255),
    CategoryID INT,
    Price DECIMAL(10,2),
    StockQuantity INT,
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID),
    FOREIGN KEY (CategoryID) REFERENCES ProductCategories(CategoryID)
);

CREATE TABLE OrderStatus (
    OrderStatusID INT AUTO_INCREMENT PRIMARY KEY,
    StatusDescription VARCHAR(255)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderStatusID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(OrderStatusID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE IssueTypes (
    IssueTypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(255)
);

CREATE TABLE Complaints (
    ComplaintID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    CustomerID INT,
    IssueTypeID INT,
    Description TEXT,
    Status VARCHAR(50),
    ResolutionDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (IssueTypeID) REFERENCES IssueTypes(IssueTypeID)
);

CREATE TABLE Revenue (
    RevenueID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE,
    TotalSales DECIMAL(10,2),
    TotalRefunds DECIMAL(10,2),
    NetRevenue DECIMAL(10,2)
);




