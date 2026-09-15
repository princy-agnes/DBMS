CREATE DATABASE SellerInventoryDB;
USE SellerInventoryDB;
CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    seller_id INT,
    product_id INT,
    stock_quantity INT,
    status VARCHAR(20),
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
INSERT INTO Seller (seller_id ,seller_name, email, phone)
VALUES
(1,'Ravi Stores', 'ravi@gmail.com', '9876543210'),
(2,'Sri Traders', 'sri@gmail.com', '9876543211'),
(3,'ABC Mart', 'abc@gmail.com', '9876543212');
INSERT INTO Product (product_id,product_name, category, price)
VALUES
(1,'Laptop', 'Electronics', 55000),
(2,'Mouse', 'Accessories', 800),
(3,'Keyboard', 'Accessories', 1500),
(4,'Headphones', 'Electronics', 2500);
INSERT INTO Inventory
(inventory_id,seller_id, product_id, stock_quantity, status)
VALUES
(001,1, 1, 10, 'Available'),
(002,1, 2, 25, 'Available'),
(003,2, 3, 0, 'Unavailable'),
(004,3, 4, 15, 'Available');
SELECT 
    s.seller_name,
    p.product_name,
    p.category,
    p.price,
    i.stock_quantity,
    i.status
FROM Inventory i
JOIN Seller s ON i.seller_id = s.seller_id
JOIN Product p ON i.product_id = p.product_id;
SELECT 
    p.product_name,
    i.stock_quantity,
    i.status
FROM Inventory i
JOIN Product p ON i.product_id = p.product_id
WHERE i.status = 'Available';
SELECT 
    p.product_name,
    i.stock_quantity,
    i.status
FROM Inventory i
JOIN Product p ON i.product_id = p.product_id
WHERE i.status = 'Unavailable';
SELECT 
    s.seller_name,
    p.product_name,
    i.stock_quantity,
    i.status
FROM Inventory i
JOIN Seller s ON i.seller_id = s.seller_id
JOIN Product p ON i.product_id = p.product_id
ORDER BY s.seller_name;
UPDATE Inventory
SET stock_quantity = 30,
    status = 'Available'
WHERE inventory_id = 2;
DELETE FROM Inventory
WHERE inventory_id = 2;
SHOW TABLES;
SELECT * FROM Inventory;
SELECT * FROM Seller;
SELECT * FROM Product;