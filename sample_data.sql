-- Run after schema.sql. Five fictional rows per table.
USE DataDigger;

INSERT INTO Customers (Name, Email, Address) VALUES
('Alice Johnson', 'alice.johnson@example.com', '123 Maple Street, Mumbai, MH 400001'),
('Bob Smith', 'bob.smith@example.com', '456 Oak Avenue, Delhi, DL 110001'),
('Charlie Brown', 'charlie.brown@example.com', '789 Pine Road, Bengaluru, KA 560001'),
('Diana Prince', 'diana.prince@example.com', '321 Cedar Lane, Chennai, TN 600001'),
('Ethan Hunt', 'ethan.hunt@example.com', '654 Birch Drive, Kolkata, WB 700001');

INSERT INTO Products (ProductName, Price, Stock) VALUES
('Wireless Mouse', 799.00, 50),
('Mechanical Keyboard', 2499.00, 30),
('USB-C Hub', 1299.00, 0),
('Laptop Stand', 899.00, 75),
('Webcam HD', 1899.00, 20);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, CURDATE() - INTERVAL 5 DAY, 799.00),
(2, CURDATE() - INTERVAL 15 DAY, 2499.00),
(3, CURDATE() - INTERVAL 25 DAY, 2198.00),
(1, CURDATE() - INTERVAL 40 DAY, 899.00),
(4, CURDATE() - INTERVAL 10 DAY, 1899.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 1, 1, 799.00),
(2, 2, 1, 2499.00),
(3, 1, 2, 1598.00),
(3, 4, 1, 600.00),
(5, 5, 1, 1899.00);
