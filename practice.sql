create database practice;
use practice;
create table student(roll int primary key,name varchar(20),home varchar(20),dob date);
insert into student values(1,"Sh","Dhaka","2000-08-11"),
(2,"Sa","Ctg","2000-08-12"),
(3,"Sb","Khul","2000-09-08"),
(4,"Sc","Syl","2002-04-11"),
(5,"Sk","Cum","2003-11-01"),
(6,"Sz","Raj","2001-02-11");
select *from student;
create table course(num int primary key,name varchar(20),credit decimal(10,2));
insert into course values(10,"C",3.00),
(11,"C++",1.50),(12,"Analog",3.00),(13,"Database",3.00),
(14,"Machine",3.00),
(15,"Power",4.00);
select *from course;
drop table course
create table details(
fig int primary key,
roll int,num int,
foreign key(roll) REFERENCES student(roll),
foreign key(num) REFERENCES course(num)
);
select *from details;
insert into details(fig,roll,num) values(100,1,10),
(200,2,11),(300,3,12),(400,4,13),(500,5,14),(600,6,15);

SELECT
    s.roll,
    s.name AS student_name,
    s.home,
    s.dob,
    c.num,
    c.name AS course_name,
    c.credit,
    d.fig
FROM
    student s
JOIN
    details d ON s.roll = d.roll
JOIN
    course c ON d.num = c.num;
select roll,num,fig from details where (roll<5) or (fig>200);

