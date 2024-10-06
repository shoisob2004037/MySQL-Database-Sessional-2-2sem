CREATE DATABASE school;

USE school;

CREATE TABLE student (
  student_id INT NOT NULL AUTO_INCREMENT,
  student_name VARCHAR(255) NOT NULL,
  student_name VARCHAR(255) NOT NULL,
  dob DATE NOT NULL,
  address VARCHAR(255) NOT NULL,
  PRIMARY KEY (student_id)
);

CREATE TABLE teacher (
  teacher_id INT NOT NULL AUTO_INCREMENT,
  teacher_name VARCHAR(255) NOT NULL,
  subject VARCHAR(255) NOT NULL,
  section VARCHAR(255) NOT NULL,
  PRIMARY KEY (teacher_id)
);

CREATE TABLE class (
  class_id INT NOT NULL AUTO_INCREMENT,
  class_name VARCHAR(255) NOT NULL,
  section_id INT NOT NULL,
  PRIMARY KEY (class_id),
  FOREIGN KEY (section_id) REFERENCES section(section_id)
);

CREATE TABLE section (
  section_id INT NOT NULL AUTO_INCREMENT,
  section_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (section_id)
);

CREATE TABLE subject (
  subject_id INT NOT NULL AUTO_INCREMENT,
  subject_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (subject_id)
);

CREATE
 
TABLE student_class (
  student_id INT
 
NOT
 
NULL,
  class_id INT
 
NOT
 
NULL,
  PRIMARY
 
KEY (student_id, class_id),
  FOREIGN KEY (student_id)
 
REFERENCES student(student_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE
 
TABLE teacher_subject (
  teacher_id INT
 
NOT
 
NULL,
  subject_id INT
 
NOT
 
NULL,
  PRIMARY KEY (teacher_id, subject_id),
  FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id),
  FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);
INSERT INTO student (student_name, student_name, dob, address)
VALUES ('John Doe', 'Male', '1990-01-01', '123 Main Street');

INSERT INTO teacher (teacher_name, subject, section)
VALUES ('Jane Doe', 'Math', '1A');

INSERT INTO class (class_name, section_id)
VALUES ('Math', 1);

INSERT INTO section (section_name)
VALUES ('1A');

INSERT INTO subject (subject_name)
VALUES ('Math');

INSERT INTO student_class (student_id, class_id)
VALUES (1, 1);

INSERT INTO teacher_subject (teacher_id, subject_id)
VALUES (1, 1);
SELECT * FROM student;

SELECT * FROM teacher;

SELECT * FROM class;

SELECT * FROM section;

SELECT * FROM subject;

SELECT * FROM student_class;

SELECT * FROM teacher_subject;