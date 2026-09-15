CREATE DATABASE OrderManagement;
USE OrderManagement;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    total_amount DECIMAL(10,2)
);
CREATE TABLE Order_Details (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
INSERT INTO Orders VALUES
(101, 'Jeeva', '2026-08-17', 900.00),
(102, 'Rahul', '2026-08-17', 500.00),
(103, 'Priya', '2026-08-18', 750.00);
INSERT INTO Order_Details VALUES
(1, 101, 'Keyboard', 1, 500.00),
(2, 101, 'Mouse', 2, 200.00),
(3, 102, 'Headphones', 1, 500.00),
(4, 103, 'Keyboard', 1, 500.00),
(5, 103, 'Mouse', 1, 250.00);
SELECT * FROM Orders;
SELECT * FROM Order_Details;
UPDATE Orders
SET total_amount = 950.00
WHERE order_id = 101;
UPDATE Order_Details
SET quantity = 2
WHERE detail_id = 4;
SELECT 
    o.order_id,
    o.customer_name,
    o.order_date,
    d.product_name,
    d.quantity,
    d.price,
    o.total_amount
FROM Orders o
JOIN Order_Details d
ON o.order_id = d.order_id
ORDER BY o.customer_name, o.order_date;