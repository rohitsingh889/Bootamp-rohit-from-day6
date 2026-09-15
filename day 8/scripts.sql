CREATE TABLE department (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);     

CREATE TABLE designation (
    designation_id SERIAL PRIMARY KEY,
    designation_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE manager (
    manager_id SERIAL PRIMARY KEY,
    manager_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);



CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    age INT CHECK (age >= 18),
    salary DECIMAL(10,2) CHECK (salary > 0),
    department_id INT NOT NULL,
    designation_id INT NOT NULL,
    manager_id INT,

    FOREIGN KEY (department_id)
        REFERENCES department(department_id),

    FOREIGN KEY (designation_id)
        REFERENCES designation(designation_id),

    FOREIGN KEY (manager_id)
        REFERENCES manager(manager_id)
);