create database dead;
use dead;
create table example
(p_id int primary key,
p_name varchar(25));
insert into example values
(1,'Shoisob'),
(2,'Mehedi');
select * from example;
drop table example;
set autocommit=0;
start transaction;
update example set p_name='saiful' where p_id=1;

CREATE TABLE booking (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(255),
    check_in DATE,
    check_out DATE,
    rent DECIMAL(10,2)
);
select *from booking;


CREATE TABLE booking2(
    check_in DATE PRIMARY KEY,
    money DECIMAL(10,2)
   --  FOREIGN KEY (check_in) REFERENCES booking(check_in)
);
insert into booking2(check_in,money) values
('2020-1-1',10000.00),
('2020-2-1',5000.00), 
('2020-3-1',20000.00),
('2020-4-1',10000.00),
('2020-5-1',5000.00),
('2020-6-1',20000.00),
('2020-7-1',10000.00),
('2020-8-1',5000.00), 
('2020-9-1',20000.00),
('2020-10-1',10000.00),
('2020-11-1',5000.00), 
('2020-12-1',20000.00);



INSERT INTO booking (p_id, p_name, check_in, check_out,rent) VALUES
(1, 'Shoisob', '2023-01-01', '2023-01-05',2000.00),
(2, 'Shawon', '2023-02-10', '2023-02-15',3000.00),
(3, 'Mamun', '2023-03-20', '2023-03-25',4000.00);
update booking set p_name='Mehedi' where p_id=1;


