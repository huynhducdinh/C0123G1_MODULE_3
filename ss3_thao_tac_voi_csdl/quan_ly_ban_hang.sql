CREATE DATABASE quan_li_ban_hang;
USE quan_li_ban_hang;

CREATE TABLE customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
	customer_namese VARCHAR (45) NOT NULL,
	customer_age INT NOT NULL
);
INSERT INTO customer (customer_namese, customer_age)
VALUES ("Minh Quan",10),
	   ("Ngoc Anh",20),
	   ("Hong Ha",30);
SELECT * FROM customer;

CREATE TABLE orders(
	orders_id INT PRIMARY KEY AUTO_INCREMENT,
	orders_data DATE NOT NULL,
	orders_total_price FLOAT ,
    customer_id INT , FOREIGN KEY(customer_id) REFERENCES customer (customer_id)
);
INSERT INTO orders (customer_id, orders_data,orders_total_price)
VALUES  (1,'2006-03-21',null),
		(2,'2006-03-23',null),
		(1,'2006-03-16',null);
SELECT * FROM orders;


CREATE TABLE product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(45) NOT NULL,
    product_price FLOAT NOT NULL
);
INSERT INTO product ( product_name, product_price)
VALUES ("May Giat", 3),
	   ("Tu Lanh", 5),
	   ("Dieu Hoa", 7),
	   ("Quat", 1),
	   ("Bep Dien", 2);
    SELECT * FROM product;

CREATE TABLE order_detail(
	order_id INT NOT NULL,
	product_id INT NOT NULL,
    order_detail_quantity FLOAT,
PRIMARY KEY(order_id,product_id),
FOREIGN KEY (order_id) REFERENCES orders(orders_id),
FOREIGN KEY (product_id) REFERENCES product(product_id)
);
INSERT INTO order_detail (order_id,product_id,order_detail_quantity)
VALUES  (1,1,3),
		(1,3,7),
		(1,4,2),
		(2,1,1),
		(3,1,8),
		(2,5,4),
		(2,3,3);
SELECT * FROM order_detail;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
 SELECT o.orders_id,o.orders_data,o.orders_total_price
 FROM orders AS o;
 
 -- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
 SELECT p.product_name,COUNT(p.product_name) AS san_pham_duoc_mua_boi_khach_hang
FROM product AS p
INNER JOIN order_detail AS od ON p.product_id = od.product_id
GROUP BY p.product_name;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.customer_namese
FROM customer c
WHERE c.customer_id NOT IN (
SELECT c.customer_id
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_detail od ON o.orders_id = od.order_id
JOIN product p ON od.product_id = p.product_id);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.orders_id, o.orders_data, sum(od.order_detail_quantity * p.product_price) as total_price
from orders o
JOIN order_detail od ON o.orders_id = od.order_id
JOIN product p ON od.product_id = p.product_id
group by o.orders_id;
DROP DATABASE quan_li_ban_hang;