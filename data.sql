-- Customers
INSERT INTO customers VALUES
(1, 'Alice', 'North'),
(2, 'Bob', 'East'),
(3, 'Charlie', 'West');

-- Products
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 900.00),
(102, 'Headphones', 'Electronics', 150.00),
(103, 'Desk Chair', 'Furniture', 200.00),
(104, 'Notebook', 'Stationery', 5.00);

-- Orders
INSERT INTO orders VALUES
(1001, 1, '2024-12-01'),
(1002, 2, '2024-12-02'),
(1003, 1, '2024-12-10'),
(1004, 3, '2024-12-15');

-- Order Items
INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 102, 2),
(3, 1002, 103, 1),
(4, 1003, 104, 10),
(5, 1004, 101, 1),
(6, 1004, 103, 1);
