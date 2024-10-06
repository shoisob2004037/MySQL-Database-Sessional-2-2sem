
CREATE TABLE Employee (
    employee_name VARCHAR(255),
    city VARCHAR(255),
    street VARCHAR(255),
    PRIMARY KEY (employee_name)
);

CREATE TABLE Works(
    employee_id INT,
    employee_name VARCHAR(255),
    company_name VARCHAR(255),
    salary DECIMAL(10, 2),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_name) REFERENCES Employee(employee_name)
);

CREATE TABLE Company (
    company_name VARCHAR(255),
    city VARCHAR(255),
    PRIMARY KEY (company_name)
);

CREATE TABLE Manages (
    employee_id INT,
    employee_name VARCHAR(255),
    manager_name VARCHAR(255),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_name) REFERENCES Employee(employee_name)
);

-- i. Give all managers of ABC bank a 10% raise
-- ii. Give all managers of ABC bank a 10% raise unless the salary becomes greater than BDT 100,000; in such case give only three percent raise
ALTER TABLE Works
ADD CONSTRAINT CHK_Managers_Raise
CHECK (
    (employee_name, company_name) IN (
        SELECT M.employee_name, W.company_name
        FROM Manages M
        JOIN Works W ON M.employee_name = W.employee_name
        WHERE W.company_name = 'ABC Bank'
    )
    AND
    (
        (salary * 1.1 <= 100000 AND company_name = 'ABC Bank') OR
        (salary * 1.03 <= 100000 AND company_name = 'ABC Bank')
    )
);

-- iii. Check conditions to ensure that every employee works for a company located in the same city as the city in which the employee lives
ALTER TABLE Works
ADD CONSTRAINT CHK_Same_City
CHECK (
    EXISTS (
        SELECT 1
        FROM Employee E
        JOIN Works W ON E.employee_name = W.employee_name
        JOIN Company C ON W.company_name = C.company_name
        WHERE E.city = C.city
    )
);

-- iv. Check conditions to ensure that no employee earns a salary higher than that of his manager
ALTER TABLE Works
ADD CONSTRAINT CHK_Salary_Limit
CHECK (
    NOT EXISTS (
        SELECT 1
        FROM Works W1
        JOIN Works W2 ON W1.manager_name = W2.employee_name
        WHERE W1.salary > W2.salary
    )
);