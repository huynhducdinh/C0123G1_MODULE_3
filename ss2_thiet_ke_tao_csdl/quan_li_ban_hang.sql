CREATE DATABASE quan_li_ban_hang;
USE quan_li_ban_hang;

CREATE TABLE customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
	customer_namese VARCHAR (45) NOT NULL,
	customer_age INT NOT NULL
);

CREATE TABLE orders(
	orders_id INT PRIMARY KEY AUTO_INCREMENT,
	customer_id INT , FOREIGN KEY(customer_id) REFERENCES customer (customer_id),
	orders_data DATE NOT NULL,
	orders_total_price FLOAT 
);

CREATE TABLE product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(45) NOT NULL,
    product_price FLOAT NOT NULL
);

CREATE TABLE order_detail(
	order_id INT NOT NULL,
	product_id INT NOT NULL,
    order_detail_quantity FLOAT NOT NULL,
PRIMARY KEY(order_id,product_id),
FOREIGN KEY (order_id) REFERENCES orders(orders_id),
FOREIGN KEY (product_id) REFERENCES product(product_id)
);
DROP DATABASE quan_li_ban_hang;


