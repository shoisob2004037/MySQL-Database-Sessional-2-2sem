CREATE DATABASE project;
use project;

CREATE TABLE Student (
    Student_Id INT PRIMARY KEY,
    Student_Name VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address_Door VARCHAR(255),
    Address_City VARCHAR(255),
    Address_Pin VARCHAR(10),
    Address_Street VARCHAR(255)
);
INSERT INTO Student (Student_Id, Student_Name, DateOfBirth, Address_Door, Address_City, Address_Pin, Address_Street)
VALUES
    (9, 'Jahid', '1990-05-15','123', 'CityA', '12345', 'Main Road'),
    (19, 'Utsob', '1995-02-28',  '456', 'CityB', '67890', 'Shahid Road'),
    (37, 'Shoisob', '1988-09-10',  '789', 'CityC', '54321', 'Beily Road'),
    (45, 'Sraboni', '1992-12-03', '101', 'CityD', '98765', 'Maple Street'),
    (24, 'Shihab', '1998-07-22',  '202', 'CityE', '24680', 'Oak Avenue');
select *from student;
select Student_Id,Student_Name,DateOfBirth,Address_Door,Address_City,Address_Pin,Address_Street, (YEAR(CURDATE())-YEAR(DateofBirth)) as Age from student;

drop table Subject;
CREATE TABLE Subject (
    Subject_Id INT PRIMARY KEY,
    Subject_Name VARCHAR(255) NOT NULL,
    Teacher VARCHAR(255) NOT NULL
);
CREATE TABLE StudentSubject (
    Student_Id INT,
    Subject_Id INT,
    PRIMARY KEY (Student_Id, Subject_Id),
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_Id),
    FOREIGN KEY (Subject_Id) REFERENCES Subject(Subject_Id)
);
INSERT INTO Subject (Subject_Id, Subject_Name, Teacher)
VALUES
    (2210, 'Simulation lab', 'Mr. Johnson'),
    (2211, 'Power', 'Mrs. Smith'),
    (2212, 'Power lab', 'Mrs. Smith'),(2213, 'EM Field', 'Mr. Saif'),(2214, 'CSE', 'Mr. Abu Ismail'),
    (2215, 'CSE lab', 'Mrs. Smith'),(2216, 'Math', 'Mrs. Smith'),
    (2217, 'Physics', 'Dr. Williams');
INSERT INTO StudentSubject(Student_Id, Subject_Id)
VALUES
    (9, 2210),  
    (9, 2211), 
    (19, 2212), 
    (37, 2213),
    (37, 2214),
    (45, 2215), 
    (24, 2216),
    (24, 2217); 
select *from StudentSubject;
select *from Subject;


CREATE TABLE Class(
    Class_Id INT PRIMARY KEY,
    Class_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Attends (
    Student_Id INT PRIMARY KEY,
    Class_Id INT,
    DateOfJoin DATE NOT NULL,
    Hours INT,
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_Id),
    FOREIGN KEY (Class_Id) REFERENCES Class(Class_Id)
);

INSERT INTO Class(Class_Id, Class_Name)
VALUES
    (301, 'Class A'),
    (302, 'Class B'),
    (303, 'Class C');
INSERT INTO Class(Class_Id, Class_Name)
VALUES
    (304, 'Class D'),
    (305, 'Class E');
INSERT INTO Attends (Student_Id, Class_Id, DateOfJoin, Hours)
VALUES
    (9, 301, '2023-01-01', 40), 
    (19, 302, '2022-08-15', 35), 
    (37, 303, '2023-03-10', 38), 
    (45, 304, '2022-12-01', 42), 
    (24, 305, '2023-02-28', 37); 
select *from class

CREATE TABLE Section(
    Section_Id INT,
    Section_Name VARCHAR(255) NOT NULL,
    Class_Id INT,
    PRIMARY KEY (Section_Id, Class_Id),
    FOREIGN KEY (Class_Id) REFERENCES Class(Class_Id)
);
INSERT INTO Section (Section_Id, Section_Name, Class_Id)
VALUES
    (10, 'Section A', 301),
    (11, 'Section B', 301),
    (12, 'Section C', 302),
    (13, 'Section D', 302),
    (14, 'Section E', 303),
    (15, 'Section F', 303),
    (16, 'Section G', 304),
    (17, 'Section H', 305);
SELECT * FROM Section;



