DROP DATABASE IF EXISTS homework_sem2;

CREATE DATABASE IF NOT EXISTS homework_sem2;

USE homework_sem2;

-- 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT INTO sales(order_date, count_product)
VALUES
	(DATE '2022-01-01', 156),
	(DATE '2022-01-02', 180),
	(DATE '2022-01-03', 21),
	(DATE '2022-01-04', 124),
	(DATE '2022-01-05', 341);

/*
2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/

SELECT id,
    CASE
		WHEN count_product < 100 THEN "Маленький заказ"
        WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
        ELSE "Большой заказ"
    END AS "Тип заказа"
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями

CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(20),
    amount FLOAT DEFAULT 0.0,
	order_status VARCHAR(20)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
('s03', 15.00, "OPEN"),
('e01', 25.50, "OPEN"),
('e05', 100.70, "CLOSED"),
('e02', 22.18, "OPEN"),
('e04', 9.50, "CANCELLED");

SELECT
	id,
    employee_id,
    amount,
    order_status,
	CASE
		WHEN order_status = "OPEN" THEN "Order is in open state"
        WHEN order_status = "CLOSED" THEN "Order is closed"
        WHEN order_status = "CANCELLED" THEN "Order is cancelled"
        ELSE ""
    END AS full_order_status
FROM orders;

