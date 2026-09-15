CREATE DATABASE ProductManagement;
USE ProductManagement;
CREATE TABLE Category (
 CategoryID INT PRIMARY KEY,
 CategoryName VARCHAR(100)
);
CREATE TABLE Product (
 ProductID INT PRIMARY KEY,
 ProductName VARCHAR(100),
 CategoryID INT,
 Price DECIMAL(10,2),
 Stock INT,
 FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
INSERT INTO Category (CategoryID,CategoryName)
VALUES ('1','Electronics'),('2','Clothing'),('3','Books');
INSERT INTO Product (ProductName,ProductID, CategoryID, Price, Stock)
VALUES
('Laptop','01',1,65000,20),
('Smartphone','02',1,30000,35),
('T-Shirt','03',2,800,100),
('Jeans','04',2,1500,60),
('Java Programming','05',3,700,40);
UPDATE Product SET Price=68000, Stock=18 WHERE ProductID=01;
DELETE FROM Product WHERE ProductID=05;
SHOW tables;
SELECT * from Product;
SELECT * from Category;
SELECT p.ProductID,p.ProductName,c.CategoryName,p.Price,p.Stock
FROM Product p JOIN Category c ON p.CategoryID=c.CategoryID;