-- password : SHOISOB2004037@
#lab1_starts_from_here

create database lab;
use lab;

create table stu
(stu_id int primary key,
stu_name varchar(25),
age int,dob date, city varchar(25),gender char(1));



set @var=0;
call lab.new_pro(@var);
select @var;
select lab.new_fun(@var);


select abs(19.29292) as absou;
select mod(100,9);
select power(3,2);
select greatest(10,20,34,38,48,29,9);
select least(10,20,34,38,48,29,9);
select truncate(28.378390293,4);
select round(20.48912,2);

insert into stu values
(37,"Shoisob",32,"2000-08-11","Noakhali","M"),
(09,"Jahid",21,"2001-08-11","Cumilla","M"),
(19,"Utsob",24,"2003-09-11","Jamalpur","M"),
(45,"Sraboni",10,"2000-08-01","Dhaka","F");
select * from stu;
insert into stu values
(15,"Ishrat",22,"2001-08-11","Dhaka","F"),
(24,"Shihab",21,"202-08-11","Dhaka","M"),
(70,"Rahim",24,"1999-08-11","Sylhet","M"),
(75,"Ananya",50,"2003-08-3","Rajshahi","F");
select * from stu;
select stu_id,stu_name,age from stu;
select * from stu where city='DHAKA';

#Group By
Select age, count(age) from stu group by age;
select count(12);
#Having
select age,count(age) as total_students from stu group by age having count(age)<20;
select * from stu order by city;
select * from stu order by city desc;
select * from stu where city='Dhaka' and age<13;
select * from stu where city='Dhaka' or age>33;


#lab2_starts_from_here

select upper("shoisob") as Upper_case;
select lower("ShoIsob") as lower_case;
select lcase("sSSDFGHhoisob") as Lcase;
select upper(stu_name) as upper from stu;
select character_length("Shoisob") as total;
select *,character_length(stu_name) as total from stu;
select *,character_length(stu_name) as total from stu where character_length(stu_name)>=5 and city="Dhaka";
select concat("ETE"," ", "20"  ," ",  "Series" ," ", "RUET") as merged; 
select stu_name,age ,concat(stu_name," ", age ) from stu as merged;
select concat(stu_name ," ", age ) as merged from stu where age>21;
select reverse("SHoisob") as reverse_;
select stu_name, reverse(stu_name) from stu;
select replace("I am a bad boy","bad" ,"good") as replacing;
select ltrim("             Shoisob               ");
select rtrim("             Shoisob               ");
select trim("             Shoisob               ");
select position("am" in "i am shoisob") as pos;
select ascii(")");

create table courses
(course_id int primary key,course_name varchar(20));
insert into courses values
(2210,"Project Design"),(2211,"Power Electronics"),(2213,"EM Field");
select * from courses;
CREATE TABLE enrollments
(
    enrollment_id INT PRIMARY KEY,
    stu_id INT,
    course_id INT,
    FOREIGN KEY(stu_id) REFERENCES stu(stu_id),
    FOREIGN KEY(course_id) REFERENCES courses(course_id)
);
insert into enrollments(enrollment_id, stu_id, course_id) 
VALUES (100,37,2210),(101,09,2211),(102,19,2213),(103,45,2210),(104,15,2213),(105,24,2210),(106,70,2211),(107,75,2210);
SELECT * FROM enrollments;

SELECT
    enrollments.enrollment_id,
    stu.stu_id,
    stu.stu_name,
    courses.course_id,
    courses.course_name
    
FROM enrollments
JOIN stu ON enrollments.stu_id = stu.stu_id
JOIN courses ON enrollments.course_id = courses.course_id;

#lab3_starts_from_here

create table original( 
id int primary key,
name varchar(50), age int);
insert into original values(100,"shoisob",23),(101,"mehedi",24),
(107,"hasan",43),(109,"jahid",67),(105,"antu",98);
select * from original;
drop table original;
create table t1 as select *from original where age<=30;
select * from t1;
create table t2 as select *from original where age>30;
select * from t2;
create table stdn( id int primary key, name varchar(30),age int,mobile varchar(20));
insert into stdn values(10,"fuad",22,"0199,0188"),
(09,"jahid",22,"0193"),(37,"shoisob",22,"0198"),
(50,"antu",22,"018");
select * from stdn;
insert into stdn values(19,"utsob",12,"0199,0188"),(18,"jahid",22,"0393"),
(34,"mehedi",22,"0198");
set @var=0;
call lab.new(@var);
select @var;
select lab.new_function(@var);

select id,name,age from stdn;
#split 1st part

create table n1f as SELECT id, name, age, SUBSTRING_INDEX(mobile,',',1) AS mobile1 from stdn;
drop table n1f,n1f2;
select * from n1f order by id;
#split 2nd part

create table n1f2 as SELECT id, name, age, SUBSTRING_INDEX(mobile, ',', -1)  AS mobile2 from stdn WHERE mobile LIKE '%,%';
select * from n1f2 order by id;

#marge part
SELECT * FROM n1f
UNION ALL
SELECT * FROM n1f2 as final order by id;
