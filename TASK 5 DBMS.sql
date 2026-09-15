CREATE DATABASE PaymentDB;
USE PaymentDB;

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    amount DECIMAL(10,2),
    payment_mode VARCHAR(20),
    payment_date DATE,
    payment_status VARCHAR(20)
);
INSERT INTO Payment
(customer_id, amount, payment_mode, payment_date, payment_status)
VALUES
(101, 2500.00, 'UPI', '2026-09-01', 'Successful'),
(102, 1500.00, 'Card', '2026-09-02', 'Successful'),
(103, 3200.00, 'Cash', '2026-09-03', 'Failed'),
(104, 1800.00, 'UPI', '2026-09-04', 'Successful'),
(105, 2200.00, 'Card', '2026-09-05', 'Failed');
SELECT * FROM Payment;
SELECT * FROM Payment WHERE payment_status = 'Successful';
SELECT * FROM Payment WHERE payment_status = 'Failed';
SELECT payment_mode, COUNT(*) AS total_transactions FROM Payment GROUP BY payment_mode;
SELECT SUM(amount) AS total_successful_amount FROM Payment WHERE payment_status = 'Successful';
SELECT 
    payment_id,
    customer_id,
    amount,
    payment_mode,
    payment_date,
    payment_status
FROM Payment
ORDER BY payment_date;
SELECT payment_status, COUNT(*) AS total FROM Payment GROUP BY payment_status;