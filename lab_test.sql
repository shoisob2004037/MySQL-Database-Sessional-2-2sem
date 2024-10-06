create database test;
use test;
create table person
(driver_id int primary key,
name varchar(25),address varchar(30));
insert into person values
(1000,"Birol","Rangamati"),(1001,"Antu","Sylhet"),
(1002,"Famin","Dhaka"),(1003,"Shoisob","Noakhali"),
(1004,"Jahid","Cumilla"),(1005,"Utsob","Jamalpur");
select * from person;
create table car
(licence varchar(30) primary key,
model varchar(25), year int);
drop table car;
insert into car values
("abc100","Corolla",2020),("abc200","Mazda",2021),
("acb300","BMW",2023),("xab300","Ferrari",2023),
("xyz100","Corolla",2023),("xyb200","Ferrari",2021),
("mno100","Corolla",2020),("pqr200","Marcedes",2020),
("xyz400","BMW",2020),("xab500","Ferrari",2023),
("xpz100","Corolla",2021),("xyb300","Mazda",2023);
select * from car;
create table accident
(report_no int primary key,
date int,location varchar(30));
insert into accident values
(100,2021,"Rajshahi"),(101,2021,"Dhaka"),
(102,2022,"Khulna"),
(103,2023,"Rangpur"),(104,2021,"Dhaka"),
(105,2021,"Shailkupa");
select * from accident;
CREATE TABLE owner (
    owner_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_id INT,
    licence VARCHAR(30),
    FOREIGN KEY (driver_id) REFERENCES person(driver_id),
    FOREIGN KEY (licence) REFERENCES car(licence)
);
INSERT INTO owner (driver_id, licence) VALUES
(1000, "abc100"), (1001, "abc200"),
(1002, "acb300"), (1003, "xab300"),
(1004, "xyz100"), (1005, "xyb200"),
(1000, "mno100"), (1001, "pqr200"),
(1002, "xyz400"), (1003, "xab500"),
(1004, "xpz100"), (1005, "xyb300");
SELECT * FROM owner;
-- Create the "participated" table
CREATE TABLE participated (
    driver_id INT,
    report_no INT,
    car VARCHAR(25),
    damage_amount DECIMAL(10, 2),
    PRIMARY KEY (driver_id, report_no),
    FOREIGN KEY (driver_id) REFERENCES person(driver_id),
    FOREIGN KEY (report_no) REFERENCES accident(report_no)
    
);
INSERT INTO participated VALUES
(1000, 100, 'Corolla', 500.00),
(1001, 101, 'Mazda', 1000.00),
(1002, 102, 'BMW', 750.00),
(1003, 103, 'Ferrari', 1200.00),
(1004, 104, 'Corolla', 800.00),                                                                         
(1005, 105, 'Mazda', 600.00);
-- Select data from the "participated" table
SELECT * FROM participated;
drop table participated;
-- select * from accident join participated on accident.report_no = participated.report_no where (date=2023);

-- 1
SELECT COUNT(p.driver_id) AS total_owners
FROM Person p
JOIN Owner o ON p.driver_id = o.driver_id
JOIN Participated par ON p.driver_id = par.driver_id
JOIN Accident a ON par.report_no = a.report_no
JOIN Car c ON par.car = c.licence
WHERE date(a.date) = 2023;
-- 2
SELECT p.name, COUNT(*) AS num_accidents
FROM person p
JOIN Participated par ON p.driver_id = par.driver_id
JOIN Accident a ON par.report_no = a.report_no
WHERE p.name = 'Antu';

-- 3
insert into accident values (9, 2023,"Nator");
select *from accident;

-- 4
DELETE FROM Car
WHERE car = 'Mazda'
  AND licence IN (SELECT licence FROM person WHERE name = 'Antu');

-- 5
UPDATE Participated
SET damage_amount = 10000
WHERE report_no = 10
  AND car = (SELECT licence FROM Car WHERE licence = 'xyz100');
  select * from participated;
