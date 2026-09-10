INSERT INTO department (department_name)
VALUES
('Software Development'),
('Data Engineering'),
('Human Resources'),
('Finance'),
('Marketing'),
('Sales'),
('Operations'),
('Information Technology'),
('Cyber Security'),
('Quality Assurance');





INSERT INTO designation (designation_name)
VALUES
('Software Engineer'),
('Data Engineer'),
('HR Manager'),
('Finance Manager'),
('Marketing Executive'),
('Sales Executive'),
('Operations Manager'),
('DevOps Engineer'),
('Security Engineer'),
('QA Engineer');



INSERT INTO manager (manager_name, email)
VALUES
('Amit Sharma', 'amit@company.com'),
('Priya Singh', 'priya@company.com'),
('Rahul Verma', 'rahul@company.com'),
('Neeraj Kumar', 'neeraj@company.com'),
('Anjali Gupta', 'anjali@company.com'),
('Vivek Sharma', 'vivek@company.com'),
('Pooja Verma', 'pooja@company.com'),
('Rakesh Singh', 'rakesh@company.com'),
('Karan Mehta', 'karan@company.com'),
('Sneha Kapoor', 'sneha@company.com');


INSERT INTO employee
(employee_name, email, age, salary, department_id, designation_id, manager_id)
VALUES
('Rohit Singh', 'rohit@company.com', 22, 60000, 2, 2, 1),
('Neha Gupta', 'neha@company.com', 24, 55000, 1, 1, 1),
('Arjun Kumar', 'arjun@company.com', 25, 58000, 2, 2, 1),
('Kavya Sharma', 'kavya@company.com', 28, 65000, 3, 3, 2),
('Vikas Verma', 'vikas@company.com', 30, 70000, 4, 4, 3),
('Ankit Yadav', 'ankit@company.com', 23, 50000, 5, 5, 4),
('Simran Kaur', 'simran@company.com', 26, 52000, 6, 6, 5),
('Aditya Mehta', 'aditya@company.com', 27, 68000, 8, 8, 6),
('Nisha Patel', 'nisha@company.com', 29, 72000, 9, 9, 7),
('Manish Gupta', 'manish@company.com', 31, 62000, 10, 10, 8);



SELECT * FROM department;

SELECT * FROM designation;

SELECT * FROM manager;

SELECT * FROM employee;