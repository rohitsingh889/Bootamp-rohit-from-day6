


CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE
);



CREATE TABLE designation (
    designation_id INT PRIMARY KEY,
    designation_name VARCHAR(100) UNIQUE
);


CREATE TABLE manager (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);



CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    age INT,
    salary DECIMAL,
    department_id INT,
    designation_id INT,
    manager_id INT,

    FOREIGN KEY (department_id)
        REFERENCES department(department_id),

    FOREIGN KEY (designation_id)
        REFERENCES designation(designation_id),

    FOREIGN KEY (manager_id)
        REFERENCES manager(manager_id)
);
