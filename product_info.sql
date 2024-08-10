CREATE DATABASE product_info;
CREATE TABLE product_info (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT CHECK (stock_quantity >= 0),
    supplier VARCHAR(100),
    manufacture_date DATE
);

SELECT * FROM product_info;
INSERT INTO product_info (product_id, product_name, category, price, stock_quantity, supplier, manufacture_date) VALUES
(1, 'Laptop', 'Electronics', 999.99, 50, 'TechSupplier', '2024-01-15'),
(2, 'Smartphone', 'Electronics', 499.99, 100, 'MobileMakers', '2024-02-20'),
(3, 'Coffee Maker', 'Appliances', 89.99, 30, 'HomeGoods', '2024-03-10'),
(4, 'Headphones', 'Electronics', 59.99, 200, 'SoundPro', '2024-04-05'),
(5, 'Blender', 'Appliances', 29.99, 75, 'KitchenEssentials', '2024-05-25'),
(6, 'Watch', 'Accessories', 199.99, 60, 'TimeKeepers', '2024-06-15'),
(7, 'Keyboard', 'Electronics', 49.99, 120, 'TechSupplier', '2024-07-20'),
(8, 'Mouse', 'Electronics', 29.99, 150, 'TechSupplier', '2024-08-10'),
(9, 'Desk Chair', 'Furniture', 149.99, 40, 'OfficeWorks', '2024-09-05'),
(10, 'Table Lamp', 'Furniture', 39.99, 90, 'LightingWorld', '2024-10-15'),
(11, 'Air Purifier', 'Appliances', 119.99, 25, 'CleanAir', '2024-11-01'),
(12, 'Toaster', 'Appliances', 24.99, 80, 'HomeGoods', '2024-12-10'),
(13, 'Microwave', 'Appliances', 89.99, 50, 'HomeGoods', '2024-01-05'),
(14, 'Refrigerator', 'Appliances', 799.99, 20, 'AppliancePros', '2024-02-25'),
(15, 'Washing Machine', 'Appliances', 499.99, 15, 'AppliancePros', '2024-03-15');

SELECT * FROM product_info;
ALTER TABLE product_info
MODIFY COLUMN product_name VARCHAR(100) NOT NULL;

SELECT * FROM product_info;
ALTER TABLE product_info
ADD CONSTRAINT unique_product_name UNIQUE (prodproduct_iduct_name);

SELECT * FROM product_info;