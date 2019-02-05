-- CREATE DATABASE
DROP DATABASE IF EXISTS mrsdw_project1;
CREATE DATABASE mrsdw_project1;

-- SELECT DATABASE
USE mrsdw_project1;

-- CREATE TABLES
CREATE TABLE customer_info
(
	customer_id					INT					PRIMARY KEY					AUTO_INCREMENT,
    customer_name				VARCHAR(45)			NOT NULL,
    address						VARCHAR(45)			NOT NULL,
    city						VARCHAR(45)			NOT NULL,
    state						VARCHAR(45)			NOT NULL,
    zip							INT					NOT NULL

);

CREATE TABLE recall_notices
(
	notice_id					INT					PRIMARY KEY					AUTO_INCREMENT,
    issue_description			VARCHAR(45)			NOT NULL,
    affected_start_date			DATE				NOT NULL,
    affected_end_date			DATE				NOT NULL
    

);
CREATE TABLE products
(
	serial_number				INT					PRIMARY KEY					AUTO_INCREMENT,
    product_name				VARCHAR(45)			NOT NULL,
    product_description			VARCHAR(45)			NOT NULL
);

CREATE TABLE affected_recalls
(
    customer_id					INT					NOT NULL,
    serial_number				INT					NOT NULL,
    notice_id					INT					NOT NULL,
    
   
    CONSTRAINT affected_recalls_fk_customer_info
		FOREIGN KEY (customer_id)
        REFERENCES customer_info (customer_id),
	CONSTRAINT affected_recalls_fk_products
		FOREIGN KEY (serial_number)
        REFERENCES products (serial_number),
    CONSTRAINT affected_recalls_fk_recall_notices
		FOREIGN KEY (notice_id)
        REFERENCES recall_notices (notice_id)    
);

-- MOVE PRODUCTS CUSTOMER INFORMATION FROM OLTP DATABASE

INSERT INTO customer_info
	(customer_id,customer_name,address,city,state,zip)
    SELECT customer_id,CONCAT(last_name, ", ", first_name),address,city,state,zip
    FROM mrs_project1.customer_info;

-- MOVE PRODUCTS INFORMATION FROM OLTP DATABASE
INSERT INTO products
	(serial_number,product_name,product_description)
SELECT p.serial_number,pt.product_name,pt.product_description
FROM mrs_project1.products p, mrs_project1.product_type pt
WHERE p.product_id= pt.product_id;

-- MOVE RECALL INFORMATION FROM OLTP DATABASE
INSERT INTO recall_notices    
	(notice_id,issue_description,affected_start_date,affected_end_date)
SELECT notice_id,issue_description,affected_start_date,affected_end_date
FROM mrs_project1.recall_notices;

-- MOVE FACT TABLE INFORMATION FROM OLTP DATABASE
INSERT INTO affected_recalls    
	(customer_id,serial_number,notice_id)
SELECT (SELECT customer_id FROM mrs_project1.customer_purchases WHERE serial_number = p.serial_number),  p.serial_number,r.notice_id
FROM mrs_project1.products p, mrs_project1.recall_notices r
WHERE p.manufactured_date BETWEEN affected_start_date AND affected_end_date;

-- Create VIEW
CREATE VIEW customer_recall_info AS 
	SELECT DISTINCT CONCAT(ci.customer_name, " - Customer ID: ", ci.customer_id) AS customer_name,
					CONCAT(ci.address, " ", ci.city, ", ", ci.state, " ", ci.zip) AS customer_address,
                    CONCAT(p.product_name, " - Serial Number: ", ar.serial_number) AS product_info
    FROM customer_info ci, products p, affected_recalls ar
    WHERE ci.customer_id = ar.customer_id AND p.serial_number = ar.serial_number;