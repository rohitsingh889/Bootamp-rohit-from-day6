CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    department VARCHAR(50) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    salary NUMERIC(12, 2) NOT NULL CHECK (salary > 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);


INSERT INTO employees
(name, email, department, designation, salary, is_active)
VALUES
('Rohit Singh', 'rohit@example.com', 'Engineering', 'Software Engineer', 50000, TRUE),
('Rahul Kumar', 'rahul@example.com', 'IT', 'Backend Developer', 55000, TRUE),
('Amit Sharma', 'amit@example.com', 'HR', 'HR Executive', 40000, TRUE),
('Priya Singh', 'priya@example.com', 'Engineering', 'Software Developer', 60000, TRUE);