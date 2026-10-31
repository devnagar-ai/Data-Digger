-- Data Digger: E-Commerce Store Database
-- MySQL 8.0+

CREATE DATABASE IF NOT EXISTS DataDigger;
USE DataDigger;

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Address VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(150) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    CONSTRAINT chk_products_price CHECK (Price >= 0),
    CONSTRAINT chk_products_stock CHECK (Stock >= 0)
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_orders_total CHECK (TotalAmount >= 0),
    CONSTRAINT fk_orders_customer FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    SubTotal DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_orderdetails_quantity CHECK (Quantity > 0),
    CONSTRAINT chk_orderdetails_subtotal CHECK (SubTotal >= 0),
    CONSTRAINT fk_orderdetails_order FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_orderdetails_product FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
