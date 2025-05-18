-- 1. Top 5 Products by Revenue
SELECT 
    p.name AS product,
    SUM(oi.quantity * p.price) AS total_revenue
FROM 
    order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_revenue DESC
LIMIT 5;

-- 2. Monthly Sales by Category
SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    p.category,
    SUM(oi.quantity * p.price) AS revenue
FROM 
    orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month, p.category
ORDER BY month, revenue DESC;

-- 3. Average Basket Size per Customer
SELECT 
    c.name AS customer,
    ROUND(AVG(oi.quantity), 2) AS avg_basket_size
FROM 
    customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.name;

-- 4. Revenue by Region
SELECT 
    c.region,
    SUM(oi.quantity * p.price) AS total_revenue
FROM 
    customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.region
ORDER BY total_revenue DESC;

-- 5. Most Sold Product in Each Category
SELECT category, name, total_quantity FROM (
    SELECT 
        p.category,
        p.name,
        SUM(oi.quantity) AS total_quantity,
        RANK() OVER (PARTITION BY p.category ORDER BY SUM(oi.quantity) DESC) AS rnk
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.category, p.name
) ranked
WHERE rnk = 1;
