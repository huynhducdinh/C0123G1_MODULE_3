CREATE DATABASE ss5_products;
USE ss5_products;

CREATE TABLE products(
	id INT PRIMARY KEY AUTO_INCREMENT,
	product_code VARCHAR(10) NOT NULL UNIQUE,
	product_name VARCHAR(50) NOT NULL,
    product_price DOUBLE NOT NULL,
    product_amount INT NOT NULL,
    product_description VARCHAR(50) NOT NULL,
    product_status BIT
);
INSERT INTO products(product_code,product_name,product_price,product_amount,product_description,product_status) VALUES  ('p01','may tinh',20,1,'Pink',1),
																														('p02','may tinh',15,1,'Black',0),
																														('p03','dien thoai',20,1,'Red',1);
SELECT * FROM products;
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
 CREATE UNIQUE INDEX i_product_code ON products(product_code);	
 EXPLAIN SELECT * FROM products WHERE product_code ='p02';
 -- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
 CREATE INDEX i_product_name_price ON products(product_name,product_price);
 EXPLAIN SELECT * FROM products WHERE product_name ='may tinh' AND product_price=20;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW v_products AS
SELECT product_code,product_name,product_price,product_status
FROM  products;
-- Tiến hành sửa đổi view
UPDATE v_products SET product_code= '=p003' WHERE product_code='p03';
-- Tiến hành xoá view
SET SQL_SAFE_UPDATES=0;
DELETE FROM v_products WHERE product_code ='=p003';
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE get_all_products()
BEGIN
SELECT * FROM products;
END //
DELIMITER ;
CALL get_all_products();

-- Tạo store procedure thêm một sản phẩm mới

DELIMITER //
CREATE PROCEDURE add_products(IN id INT  ,IN p_code VARCHAR(40),IN p_name VARCHAR(45), IN p_price DOUBLE,IN p_amount INT,IN p_description VARCHAR(45),IN p_status BIT)
BEGIN
INSERT INTO products VALUES(id,p_code, p_name,p_price ,p_amount, p_description,p_status);
END //
DELIMITER ;
CALL add_products(6,'P003','dien thoai',20,1,'Pink',0);
CALL get_all_products();
-- Tạo store procedure sửa thông tin sản phẩm theo id

DELIMITER //
CREATE PROCEDURE update_products(IN p_id INT,IN p_code VARCHAR(40))
BEGIN
UPDATE products SET product_code=p_code WHERE id=p_id;
END //
DELIMITER ;
CALL update_products(6,'p002');
CALL get_all_products();
-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE delete_products(IN p_id INT)
BEGIN
DELETE from products WHERE id=p_id;
END //
DELIMITER ;
CALL delete_products(5);
CALL get_all_products();
 