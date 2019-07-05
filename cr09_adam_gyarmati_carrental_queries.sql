/*create database*/
CREATE DATABASE cr09_adam_gyarmati_carrental
DEFAULT CHARACTER utf8;

/*create tables*/
CREATE TABLE bookings (
book_id INT NOT NULL AUTO_INCREMENT,
fk_inv_id INT,
pick_point VARCHAR(100),
drop_point VARCHAR(100),
pick_date DATE,
drop_date DATE,
PRIMARY KEY (book_id)
);

CREATE TABLE customers (
cust_id INT NOT NULL AUTO_INCREMENT,
fk_book_id INT,
first_name VARCHAR(50),
last_name VARCHAR (70),
c_email VARCHAR (50),
dob DATE,
PRIMARY KEY (cust_id),
FOREIGN KEY (fk_book_id) REFERENCES bookings(book_id)
);


CREATE TABLE invoices (
inv_id INT NOT NULL AUTO_INCREMENT,
fk_book_id INT,
inv_date DATE,
inv_status TEXT,
PRIMARY KEY (inv_id),
FOREIGN KEY (fk_book_id) REFERENCES bookings(book_id)
);


CREATE TABLE payment_type (
type_id INT NOT NULL AUTO_INCREMENT,
pay_description TEXT,
PRIMARY KEY (type_id)
);


CREATE TABLE payments (
pay_id INT NOT NULL AUTO_INCREMENT,
fk_inv_id INT,
fk_type_id INT,
pay_status VARCHAR(30),
PRIMARY KEY (pay_id),
FOREIGN KEY (fk_inv_id) REFERENCES invoices(inv_id),
FOREIGN KEY (fk_type_id) REFERENCES payment_type(type_id)
);

ALTER TABLE bookings ADD 
FOREIGN KEY (fk_inv_id) REFERENCES invoices(inv_id);

/*---------------------------left side tables until here-----------------------------------------*/

CREATE TABLE car_rental (
rental_id INT NOT NULL AUTO_INCREMENT,
fk_book_id INT,
address VARCHAR (155),
city VARCHAR (50),
r_email VARCHAR (100),
PRIMARY KEY (rental_id),
FOREIGN KEY (fk_book_id) REFERENCES bookings(book_id)
);


CREATE TABLE cars (
car_id INT NOT NULL AUTO_INCREMENT,
fk_book_id INT,
fk_rental_id INT,
price FLOAT,
PRIMARY KEY (car_id),
FOREIGN KEY (fk_book_id) REFERENCES bookings(book_id),
FOREIGN KEY (fk_rental_id) REFERENCES car_rental(rental_id)
);


CREATE TABLE manufacturer (
manuf_id INT NOT NULL AUTO_INCREMENT,
man_name VARCHAR (100),
PRIMARY KEY (manuf_id)
);


CREATE TABLE model (
model_id INT NOT NULL AUTO_INCREMENT,
fk_manuf_id INT,
mo_name VARCHAR(155),
mo_year DATE,
PRIMARY KEY (model_id),
FOREIGN KEY (fk_manuf_id) REFERENCES manufacturer(manuf_id)
);

ALTER TABLE cars
ADD fk_model_id INT;

ALTER TABLE cars ADD 
FOREIGN KEY (fk_model_id) REFERENCES model(model_id);


CREATE TABLE availability (
av_id INT NOT NULL AUTO_INCREMENT,
fk_car_id INT,
av_date DATE,
av_description TEXT,
PRIMARY KEY (av_id),
FOREIGN KEY (fk_car_id) REFERENCES cars(car_id)
);


CREATE TABLE discount (
dis_id INT NOT NULL AUTO_INCREMENT,
fk_car_id INT,
dis_description TEXT,
PRIMARY KEY (dis_id),
FOREIGN KEY (fk_car_id) REFERENCES cars(car_id)
);

/*-----------------------------right side tables until here------------------------------*/

