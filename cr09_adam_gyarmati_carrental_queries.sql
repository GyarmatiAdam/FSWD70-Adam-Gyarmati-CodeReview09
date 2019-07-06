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

/*-----------------------------insert datas into tables from here------------------------*/

INSERT INTO customers(first_name, last_name, c_email, dob) VALUES 
('Oliver', 'Johnson', 'oliver@gmail.com','1982-05-13'),
('George ', 'Williams','gerorge@gmail.com','1982-03-18'),
('Harry', 'Jones  ','harry@gmail.com','1982-09-16'),
('Noah ', 'Brown  ', 'noah@gmail.com','1974-03-15'),
('Jack ', 'Davis  ', 'jack@gmail.com','1982-07-23'),
('Charlie', 'Miller  ','charlie@gmail.com','1987-05-11'),
('Leo', 'Wilson  ', 'leo@gmail.com','1989-05-24'),
('Jacob ', 'Moore  ','jacob@gmail.com','1952-03-10'),
('Freddie', 'Taylor  ','fredddie@gmail.com','1982-03-13');

INSERT INTO bookings(pick_point, drop_point, pick_date, drop_date) VALUES 
('Fo utca 8 Budapest ', 'Budai ut 89 Debrecen ','2019-07-23' , '2019-08-06'),
('Soproni ut Gyor 12', 'Budai ut 89 Debrecen ', '2019-08-01', '2019-08-13'),
('Fo utca 8 Budapest ', 'Gyori ut 98 Sopron', '2019-05-19', '2019-05-28'),
('Vamhaz ut 43 Pecs ' , 'Gyori ut 98 Sopron', '2019-07-23','2019-08-13'),
('Vamhaz ut 43 Pecs ', 'Budai ut 89 Debrecen ','2019-07-13' , '2019-08-13'),
('Gyori ut 98 Sopron', 'Gyori ut 98 Sopron','2019-05-23' ,'2019-07-02' ),
('Soproni ut Gyor 12', 'Petofi ut 46 Siofok ','2019-06-13' , '2018-06-21'),
('Fo utca 8 Budapest ', 'Vamhaz ut 43 Pecs ', '2019-08-13', '2019-08-23'),
('Soproni ut Gyor 12','Budai ut 89 Debrecen ' , '2019-07-23', '2019-07-30');

INSERT INTO car_rental(fk_book_id, address, city, r_email) VALUES 
(1, 'Fo utca 8  ', 'Budapest',  'buda@gmail.com'),
(2, 'Soproni ut  12','Gyor' ,  'gyor@gmail.com'),
(3,'Fo utca 8  ' ,'Budapest' , 'buda@gmail.com' ),
(4, 'Vamhaz ut 43  ', 'Pecs', 'pecs@gmail.com' ),
(5, 'Vamhaz ut 43  ','Pecs' , 'pecs@gmail.com' ),
(6, 'Gyori ut 98', ' Sopron', 'sopron@gmail.com' ),
(7, 'Soproni ut  12', 'Gyor',  'gyor@gmail.com'),
(8, 'Fo utca 8  ','Budapest' ,  'buda@gmail.com'),
(9, 'Soproni ut  12','Gyor' , 'gyor@gmail.com' );

INSERT INTO manufacturer(man_name) VALUES 
('BMW'),
('MAZDA'),
('FORD'),
('OPEL');

INSERT INTO model(fk_manuf_id, mo_name, mo_year) VALUES 
(1, '520E', '2016-01-01'),
(1,'420E' , '2017-01-01'),
(1,'34E' ,'2018-01-01' ),
(1,'335E' , '2016-01-01'),
(1, '116E','2017-01-01'),
(2, '34E', '2018-01-01'),
(2,'3E' , '2016-01-01'),
(2,'4E' , '2018-01-01'),
(2,'5S' , '2018-01-01'),
(3, 'FORD','2016-01-01' ),
(3, 'FOCUS', '2018-01-01'),
(3,'CMAX' , '2017-01-01'),
(3,'ESCORT' , '2016-01-01'),
(4, 'ADAM', '2017-01-01'),
(4,'CORSA' ,'2016-01-01' ),
(4,'ASTRA' ,'2016-01-01' );

INSERT INTO cars (fk_book_id, fk_rental_id, price, fk_model_id) VALUES 
(1, 1, 220, 2),
(2, 2, 420, 4),
(3, 3, 130, 7),
(4, 4, 240, 9),
(5, 5, 150, 9),
(6, 6, 150, 6),
(7, 7, 160, 11),
(8, 8, 670, 14),
(9, 9, 180, 16);


INSERT INTO payment_type (pay_description) VALUES 
('Cash'),
('Card'),
('PayPal'),
('AMEX');

INSERT INTO invoices (fk_book_id, inv_date, inv_status) VALUES 
(1, '2019-06-09','Ready' ),
(2, '2019-07-13', 'Ready'),
(3, '2019-09-23', 'Pending'),
(4,'2019-08-13' , 'Pending'),
(5, '2019-01-24', 'Ready'),
(6,'2019-02-19', 'Ready'),
(7, '2019-06-17', 'Ready'),
(8, '2019-07-13', 'Ready'),
(9,'2019-05-24' , 'Ready');


INSERT INTO payments (fk_inv_id, fk_type_id, pay_status) VALUES 
(1,1,'Payed'),
(2,2,'Payed'),
(3,3,'Unpayed'),
(4,4,'Unpayed'),
(5,4,'Payed'),
(6,3,'Payed'),
(7,2,'Payed'),
(8,3,'Payed'),
(9,1,'Payed');

INSERT INTO discount (fk_car_id, dis_description) VALUES 
(1,'30%'),
(2,'None'),
(3,'None'),
(4,'30%'),
(5,'10%'),
(6,'None'),
(7,'None'),
(8,'None'),
(9,'30%');

INSERT INTO availability (fk_car_id, av_date, av_description) VALUES 
(1,'2019-01-01','Available'),
(2,'2019-01-01','Available'),
(3,'2019-01-01','Available'),
(4,'2019-01-01','Available'),
(5,'2019-01-01','Available'),
(6,'2019-01-01','Available'),
(7,'2019-01-01','Available'),
(8,'2019-01-01','Available'),
(9,'2019-01-01','Available');