-- Create table sales_orders
CREATE TABLE IF NOT EXISTS sales_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255),
    order_date DATETIME
);

-- Insert data
INSERT INTO sales_orders (customer_name, order_date) VALUES
('Alice', '2025-04-20 14:22:00'),
('Bob', '2025-04-20 16:10:23'),
('Charlie', '2025-04-21 09:45:12'),
('Diana', '2025-04-21 12:10:11'),
('Evan', '2025-04-21 20:00:55');

-- The query solution
SELECT DATE(order_date) AS thedate,
       COUNT(*) AS count
  FROM sales_orders
 GROUP BY thedate
 ORDER BY thedate ASC;
