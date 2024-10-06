create database ct;
use ct;
CREATE TABLE dept (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);
INSERT INTO dept (dept_id, dept_name) VALUES
(04, 'ETE'),
(00, 'Civil'),
(01, 'EEE'),
(02, 'ME'),
(03, 'CSE');
INSERT INTO dept (dept_id, dept_name) VALUES
(05, 'IPE'),
(09, 'CFPE');
INSERT INTO dept (dept_id, dept_name) VALUES
(06, 'URP'),
(10, 'Archi');

CREATE TABLE manager (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(255) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(dept_id)
);
INSERT INTO manager (manager_id, manager_name, dept_id) VALUES
(101, 'Shoisob', 01),  
(102, 'Antu', 02), 
(103, 'Mamun', 03), 
(104, 'Ayon', 00), 
(105, 'Mehedi', 04); 


CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(255),
    salary DECIMAL(10, 2),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(dept_id),
    FOREIGN KEY (manager_id) REFERENCES manager(manager_id)
    
);
INSERT INTO employee (emp_id, emp_name, salary, dept_id, manager_id) VALUES
(201, 'John', 50000.00, 01, 101), 
(202, 'Green', 60000.00, 02, 102), 
(203, 'Maxwell', 55000.00, 03, 103),  
(204, 'Warner', 48000.00, 00, 104), 
(205, 'Head', 52000.00, 04, 105);

CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    team_member_id INT,
    FOREIGN KEY (team_member_id) REFERENCES employee(emp_id)
);
INSERT INTO project (project_id, project_name, team_member_id) VALUES
(301, 'Website Redesign', 201),  
(302, 'Product Launch', 202),    
(303, 'Database Migration', 203), 
(304, 'Infrastructure Upgrade', 204), 
(305, 'Mobile App Development', 205);
-- 1 
SELECT *FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);
-- 2 
SELECT
    d.dept_name,
    e.emp_name,
    e.salary
FROM
    dept d
JOIN
    employee e ON d.dept_id = e.dept_id
LEFT JOIN
    employee e2 ON d.dept_id = e2.dept_id AND e.salary < e2.salary
WHERE
    e2.emp_id IS NULL;

-- 3
SELECT d.dept_id, d.dept_name
FROM dept d
LEFT JOIN employee e ON d.dept_id = e.dept_id
WHERE e.dept_id IS NULL;

-- 4

SELECT
    emp_id,emp_name,salary,dept_id
FROM
    employee e
WHERE
    salary>=(
        SELECT
            AVG(salary)
        FROM
            employee
        WHERE
            dept_id = e.dept_id
);






