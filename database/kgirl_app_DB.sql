CREATE DATABASE kgirl_app;

USE kgirl_app;

CREATE TABLE users(
user_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(150) NOT NULL,
last_name VARCHAR(150) NOT NULL,
email VARCHAR(400) NOT NULL,
password VARCHAR(400) NOT NULL,
rol_id INT NOT NULL,
created_at DATE NOT NULL,
updated_at DATE NOT NULL,
status VARCHAR(150) NOT NULL,
PRIMARY KEY(user_id));

CREATE TABLE clients(
client_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(150) NOT NULL,
last_name VARCHAR(150) NOT NULL,
address VARCHAR(150) NOT NULL,
phone_number VARCHAR(100),
birth_date DATE NOT NULL,
created_at DATE NOT NULL,
updated_at DATE NOT NULL,
status VARCHAR(150) NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY(client_id));

CREATE TABLE products(
product_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(150) NOT NULL,
brand VARCHAR(150) NOT NULL,
category_id INT NOT NULL,
description VARCHAR(150) NOT NULL,
public_price FLOAT NOT NULL,
suplier_price FLOAT NOT NULL,
stock INT NOT NULL,
image_url VARCHAR(300) NOT NULL,
suplier_id INT NOT NULL,
created_at DATE NOT NULL,
updated_at DATE NOT NULL,
status VARCHAR(150) NOT NULL,
PRIMARY KEY(product_id));

CREATE TABLE supliers(
suplier_id INT NOT NULL AUTO_INCREMENT,
company_name VARCHAR(150) NOT NULL,
category VARCHAR(150) NOT NULL,
email VARCHAR(400) NOT NULL,
address VARCHAR(150) NOT NULL,
contact_number VARCHAR(100),
score FLOAT,
created_at DATE NOT NULL,
updated_at DATE NOT NULL,
status VARCHAR(150) NOT NULL,
PRIMARY KEY(suplier_id));

CREATE TABLE delivery(
delivery_id INT NOT NULL AUTO_INCREMENT,
company_name VARCHAR(150) NOT NULL,
email VARCHAR(400) NOT NULL,
address VARCHAR(150) NOT NULL,
contact_number VARCHAR(100),
charge FLOAT NOT NULL,
created_at DATE NOT NULL,
updated_at DATE NOT NULL,
status VARCHAR(150) NOT NULL,
PRIMARY KEY(delivery_id));

CREATE TABLE orders(
order_id INT NOT NULL AUTO_INCREMENT,
client_id INT NOT NULL,
total_items INT NOT NULL,
total_charge FLOAT NOT NULL,
delivery_id INT NOT NULL,
created_at DATE NOT NULL,
updated_at DATE NOT NULL,
status VARCHAR(150) NOT NULL,
PRIMARY KEY(order_id));

CREATE TABLE order_details(
order_id INT NOT NULL,
product_id INT NOT NULL,
amount INT NOT NULL,
charge FLOAT NOT NULL,
created_at DATE NOT NULL,
updated_at DATE NOT NULL);

CREATE TABLE category(
category_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (category_id));

CREATE TABLE rol(
rol_id INT NOT NULL AUTO_INCREMENT,
name varchar(100) NOT NULL,
PRIMARY KEY (rol_id));

CREATE TABLE links_temp(
id INT NOT NULL AUTO_INCREMENT,
title varchar(150) NOT NULL,
url VARCHAR(255) NOT NULL,
description TEXT,
user_id INT NOT NULL,
created_at timestamp NOT NULL DEFAULT current_timestamp,
CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id),
PRIMARY KEY (id));

ALTER TABLE users
ADD CONSTRAINT FK_rol_id
FOREIGN KEY (rol_id) REFERENCES rol(rol_id);

ALTER TABLE clients
ADD CONSTRAINT FK_user_id
FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE products
ADD CONSTRAINT FK_suplier_id
FOREIGN KEY (suplier_id) REFERENCES supliers(suplier_id);

ALTER TABLE products
ADD CONSTRAINT FK_category_id
FOREIGN KEY (category_id) REFERENCES category(category_id);

ALTER TABLE orders
ADD CONSTRAINT FK_client_id
FOREIGN KEY (client_id) REFERENCES clients(client_id);

ALTER TABLE orders
ADD CONSTRAINT FK_delivery_id
FOREIGN KEY (delivery_id) REFERENCES delivery(delivery_id);

ALTER TABLE order_details
ADD CONSTRAINT FK_order_id
FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_details
ADD CONSTRAINT FK_product_id
FOREIGN KEY (product_id) REFERENCES products(product_id);