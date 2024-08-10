CREATE DATABASE order_info;
CREATE TABLE order_info (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT NOT NULL,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    total_price DECIMAL(10, 2),
    status VARCHAR(50) CHECK (status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

SELECT * FROM order_info;
INSERT INTO order_info (order_id, order_date, customer_id, product_id, quantity, total_price, status) 
VALUES
(1, '2024-07-01', 101, 1, 1, 999.99, 'Shipped'),
(2, '2024-07-02', 102, 2, 2, 999.98, 'Delivered'),
(3, '2024-07-03', 103, 3, 1, 89.99, 'Pending'),
(4, '2024-07-04', 104, 4, 3, 179.97, 'Cancelled'),
(5, '2024-07-05', 105, 5, 2, 59.98, 'Shipped'),
(6, '2024-07-06', 106, 6, 1, 199.99, 'Delivered'),
(7, '2024-07-07', 107, 7, 1, 49.99, 'Shipped'),
(8, '2024-07-08', 108, 8, 1, 29.99, 'Delivered'),
(9, '2024-07-09', 109, 9, 1, 149.99, 'Pending'),
(10, '2024-07-10', 110, 10, 2, 79.98, 'Shipped'),
(11, '2024-07-11', 111, 11, 1, 119.99, 'Cancelled'),
(12, '2024-07-12', 112, 12, 1, 24.99, 'Shipped'),
(13, '2024-07-13', 113, 13, 1, 89.99, 'Delivered'),
(14, '2024-07-14', 114, 14, 1, 799.99, 'Shipped'),
(15, '2024-07-15', 115, 15, 1, 499.99, 'Delivered');

SELECT * FROM order_info;
ALTER TABLE order_info
MODIFY COLUMN order_date DATE NOT NULL;

SELECT * FROM order_info;
ALTER TABLE order_info
ADD CONSTRAINT unique_order_id UNIQUE (order_id);

SELECT * FROM order_info;