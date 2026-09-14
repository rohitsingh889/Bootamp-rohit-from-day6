SELECT * FROM department;

SELECT * FROM role;

SELECT * FROM employee;

SELECT * FROM leave_type;

SELECT * FROM leave_balance;

SELECT * FROM leave_request;

SELECT * FROM approval_history;





TRUNCATE TABLE approval_history, leave_request, leave_balance,
employee, leave_type, role, department
RESTART IDENTITY CASCADE;

INSERT INTO department (department_name, description)
VALUES
('Human Resources', 'Handles employee relations and HR operations'),
('Engineering', 'Handles software development and technical operations'),
('Finance', 'Handles financial operations and accounting'),
('Marketing', 'Handles marketing and promotional activities'),
('Sales', 'Handles sales and customer acquisition');

INSERT INTO role (role_name, description)
VALUES
('Employee', 'Regular employee'),
('Manager', 'Team or department manager'),
('HR', 'Human Resources personnel'),
('Admin', 'System administrator');

INSERT INTO employee
(employee_name, email, phone, hire_date,
 department_id, role_id, manager_id, employment_status)
VALUES
('Amit Sharma', 'amit.sharma@company.com', '9876500001',
 '2021-01-15', 2, 2, NULL, 'Active'),
('Priya Singh', 'priya.singh@company.com', '9876500002',
 '2021-03-20', 1, 2, NULL, 'Active'),
('Rohit Verma', 'rohit.verma@company.com', '9876500003',
 '2020-07-10', 3, 2, NULL, 'Active'),
('Neha Gupta', 'neha.gupta@company.com', '9876500004',
 '2022-02-05', 4, 2, NULL, 'Active'),
('Vikas Kumar', 'vikas.kumar@company.com', '9876500005',
 '2020-11-18', 5, 2, NULL, 'Active');

INSERT INTO employee
(employee_name, email, phone, hire_date,
 department_id, role_id, manager_id, employment_status)
VALUES
('Rahul Kumar', 'rahul.kumar@company.com', '9876500006',
 '2024-01-10', 2, 1, 1, 'Active'),
('Ankit Singh', 'ankit.singh@company.com', '9876500007',
 '2023-06-15', 2, 1, 1, 'Active'),
('Pooja Sharma', 'pooja.sharma@company.com', '9876500008',
 '2024-03-12', 2, 1, 1, 'Active'),
('Arjun Mehta', 'arjun.mehta@company.com', '9876500009',
 '2023-09-20', 2, 1, 1, 'Active'),
('Sneha Verma', 'sneha.verma@company.com', '9876500010',
 '2024-05-08', 2, 1, 1, 'Active'),

('Karan Patel', 'karan.patel@company.com', '9876500011',
 '2023-02-14', 1, 1, 2, 'Active'),
('Riya Gupta', 'riya.gupta@company.com', '9876500012',
 '2024-04-18', 1, 1, 2, 'Active'),
('Nitin Yadav', 'nitin.yadav@company.com', '9876500013',
 '2022-12-01', 1, 1, 2, 'Active'),
('Simran Kaur', 'simran.kaur@company.com', '9876500014',
 '2023-08-25', 1, 1, 2, 'Active'),
('Manish Kumar', 'manish.kumar@company.com', '9876500015',
 '2024-07-01', 1, 1, 2, 'Active'),

('Aditya Jain', 'aditya.jain@company.com', '9876500016',
 '2023-01-05', 3, 1, 3, 'Active'),
('Kavya Singh', 'kavya.singh@company.com', '9876500017',
 '2024-02-20', 3, 1, 3, 'Active'),
('Deepak Verma', 'deepak.verma@company.com', '9876500018',
 '2022-10-10', 3, 1, 3, 'Active'),
('Nisha Sharma', 'nisha.sharma@company.com', '9876500019',
 '2023-11-15', 3, 1, 3, 'Active'),
('Saurabh Gupta', 'saurabh.gupta@company.com', '9876500020',
 '2024-06-05', 3, 1, 3, 'Active'),

('Ayesha Khan', 'ayesha.khan@company.com', '9876500021',
 '2023-04-10', 4, 1, 4, 'Active'),
('Varun Malhotra', 'varun.malhotra@company.com', '9876500022',
 '2024-01-25', 4, 1, 4, 'Active'),
('Isha Kapoor', 'isha.kapoor@company.com', '9876500023',
 '2022-08-15', 4, 1, 4, 'Active'),
('Mohit Agarwal', 'mohit.agarwal@company.com', '9876500024',
 '2023-12-10', 4, 1, 4, 'Active'),
('Tanvi Mehta', 'tanvi.mehta@company.com', '9876500025',
 '2024-05-20', 4, 1, 4, 'Active'),

('Rakesh Kumar', 'rakesh.kumar@company.com', '9876500026',
 '2022-06-01', 5, 1, 5, 'Active'),
('Divya Sharma', 'divya.sharma@company.com', '9876500027',
 '2023-03-15', 5, 1, 5, 'Active'),
('Akash Verma', 'akash.verma@company.com', '9876500028',
 '2024-02-10', 5, 1, 5, 'Active'),
('Meena Gupta', 'meena.gupta@company.com', '9876500029',
 '2023-07-05', 5, 1, 5, 'Active'),
('Harsh Singh', 'harsh.singh@company.com', '9876500030',
 '2024-08-12', 5, 1, 5, 'Active');

INSERT INTO leave_type
(leave_type_name, description, max_days_per_year, requires_approval)
VALUES
('Casual Leave', 'Leave for personal or casual purposes', 12, TRUE),
('Sick Leave', 'Leave due to illness or medical reasons', 10, TRUE),
('Earned Leave', 'Annual earned leave for employees', 20, TRUE),
('Unpaid Leave', 'Leave without salary', 30, TRUE);



INSERT INTO leave_request
(employee_id, leave_type_id, start_date, end_date,
 total_days, reason, status)
VALUES
(6, 1, '2026-09-15', '2026-09-16', 2,
 'Personal work', 'Pending'),

(7, 2, '2026-09-17', '2026-09-18', 2,
 'Medical appointment', 'Approved'),

(8, 1, '2026-09-20', '2026-09-22', 3,
 'Family function', 'Pending'),

(9, 3, '2026-09-25', '2026-09-29', 5,
 'Annual vacation', 'Approved'),

(10, 2, '2026-09-21', '2026-09-22', 2,
 'Health issue', 'Rejected'),

(11, 1, '2026-10-01', '2026-10-02', 2,
 'Personal work', 'Pending'),

(12, 3, '2026-10-05', '2026-10-09', 5,
 'Family vacation', 'Approved'),

(13, 2, '2026-10-10', '2026-10-11', 2,
 'Medical reason', 'Approved'),

(14, 1, '2026-10-15', '2026-10-16', 2,
 'Personal work', 'Pending'),

(15, 3, '2026-10-20', '2026-10-22', 3,
 'Travel plans', 'Rejected'),

(16, 1, '2026-09-18', '2026-09-19', 2,
 'Personal work', 'Approved'),

(17, 2, '2026-09-23', '2026-09-24', 2,
 'Medical checkup', 'Pending'),

(18, 3, '2026-10-01', '2026-10-03', 3,
 'Family event', 'Approved'),

(19, 1, '2026-10-10', '2026-10-12', 3,
 'Personal work', 'Pending'),

(20, 2, '2026-10-15', '2026-10-17', 3,
 'Sick leave', 'Rejected'),

(21, 3, '2026-11-01', '2026-11-05', 5,
 'Annual vacation', 'Approved'),

(22, 1, '2026-11-10', '2026-11-11', 2,
 'Personal work', 'Pending'),

(23, 2, '2026-11-15', '2026-11-16', 2,
 'Medical reason', 'Approved'),

(24, 3, '2026-11-20', '2026-11-24', 5,
 'Holiday travel', 'Pending'),

(25, 1, '2026-12-01', '2026-12-02', 2,
 'Personal work', 'Cancelled');

INSERT INTO approval_history
(leave_request_id, approver_id, action, comments)
VALUES
(2, 1, 'Approved', 'Leave approved by reporting manager'),
(4, 1, 'Approved', 'Annual leave approved'),
(5, 1, 'Rejected', 'Leave request rejected due to insufficient coverage'),
(7, 2, 'Approved', 'Leave approved by reporting manager'),
(8, 2, 'Approved', 'Medical leave approved'),
(10, 2, 'Rejected', 'Leave request rejected'),
(11, 3, 'Approved', 'Leave approved'),
(13, 3, 'Approved', 'Leave approved by manager'),
(15, 3, 'Rejected', 'Leave request rejected due to project workload'),
(16, 4, 'Approved', 'Annual leave approved'),
(18, 4, 'Approved', 'Medical leave approved'),
(20, 4, 'Cancelled', 'Leave cancelled by employee');

SELECT COUNT(*) AS total_departments FROM department;
SELECT COUNT(*) AS total_roles FROM role;
SELECT COUNT(*) AS total_employees FROM employee;
SELECT COUNT(*) AS total_leave_types FROM leave_type;
SELECT COUNT(*) AS total_leave_balances FROM leave_balance;
SELECT COUNT(*) AS total_leave_requests FROM leave_request;
SELECT COUNT(*) AS total_approval_history FROM approval_history;