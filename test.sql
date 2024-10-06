create database final;
use final;
create table student(student_id int primary key,student_name varchar(10),age int,gender varchar(10),
grade float);
CREATE TABLE Courses(
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Instructor VARCHAR(100),
    Credits INT
);
create table combined(
enrollments_id int primary key,
student_id int,
Course_ID int,
foreign key (student_id) references student(student_id),
foreign key (Course_ID) references Courses(Course_ID));

select 
student.student_id,
student.student_name,
Courses.Course_ID,
combined.enrollments_id

from combined
join student on student.student_id=combined.student_id
join Courses on Courses.Course_ID=combined.Course_ID;


