CREATE DATABASE IF NOT EXISTS restoran;
USE restoran;

CREATE TABLE IF NOT EXISTS customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(50),
    phone VARCHAR(15) UNIQUE
);

insert into customers(full_name,phone) VALUES
('Javohir', '+998901234567'),
('Komol', '+998911234567'),
('Jamshid', '+998951234567'),
('Misha', '+998907654321'),
('Ali', '+998917654321');

CREATE TABLE IF NOT EXISTS orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_data DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10,2) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

insert into orders(order_data, total_price, customer_id) VALUES
(('2025-07-01 10:00:00',500000,1),
('2025-07-01 08:15:12', 250000, 1),
('2025-07-01 09:45:25', 300000, 3),
('2025-07-01 11:20:37', 450000, 4),
('2025-07-01 12:05:49', 500000, 5),
('2025-07-01 13:50:05', 600000, 1),
('2025-07-01 15:10:18', 350000, 2),
('2025-07-01 16:25:33', 750000, 3),
('2025-07-01 17:55:41', 820000, 4),
('2025-07-01 19:15:54', 900000, 5),
('2025-07-01 20:40:09', 950000, 1);)

CREATE TABLE IF NOT EXISTS menu(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) UNIQUE,
    price DECIMAL(10,2)
);

insert into menu(name, price) VALUES
('Osh',45000),
('Somsa', 8000),
('Shashlik', 25000),
('Lag`mon', 30000),
('Norin', 35000),
('Manti', 20000),
('Chuchvara', 22000),
('Beshbarmoq', 40000),
('Do`lma', 28000),
('Qozon Kabob', 55000);

CREATE TABLE IF NOT EXISTS order_items(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    menu_id INT,
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(menu_id) REFERENCES menu(id),
    quantity INT
);

insert into order_items(order_id, menu_id, quantity) VALUES
(1,2,3),
(3, 7, 2),
(1, 4, 5),
(10, 10, 1),
(6, 2, 3),
(8, 9, 4),
(2, 5, 2),
(9, 1, 3),
(5, 8, 1),
(7, 3, 5),
(4, 6, 4);

SELECT * FROM customers order by full_name ASC;

SELECT full_name, SUM(quantity) AS total_meals FROM customers
JOIN orders ON customer_id = orders.customer_id
JOIN order_items ON order_id = order_items.order_id
GROUP BY customer_id
ORDER BY total_meals DESC
LIMIT 1;

SELECT * FROM orders ORDER BY order_data DESC
LIMIT 5;

SELECT customers.full_name,SUM(orders.total_price) AS total_spent
FROM customers JOIN orders ON customers.id = orders.customer_id
GROUP BY customer_id;

SELECT customers.full_name,
menu.name AS meal,
menu.price,
order_items, quantity,
(menu.price * order_items.quantity) AS total_cost
FROM customers
JOIN order ON customer_id = orders.customer_id
JOIN order_items ON orders.id = order_items.order_id
JOIN menu ON menu.id = order_items.menu_id;