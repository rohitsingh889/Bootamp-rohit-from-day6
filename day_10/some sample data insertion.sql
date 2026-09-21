BEGIN;


INSERT INTO department (department_name, description) VALUES
('Engineering', 'Software and product engineering'),
('Human Resources', 'Employee and HR operations'),
('Finance', 'Financial management and accounting'),
('Marketing', 'Marketing and brand management'),
('Sales', 'Sales and business development'),
('Operations', 'Business operations'),
('Information Technology', 'IT infrastructure and support'),
('Legal', 'Legal and compliance'),
('Product', 'Product management and strategy'),
('Customer Support', 'Customer service and support'),
('Data Science', 'Data analytics and machine learning'),
('Quality Assurance', 'Software and product testing'),
('Research', 'Research and innovation'),
('Administration', 'Administrative operations'),
('Procurement', 'Purchasing and vendor management'),
('Security', 'Information and physical security'),
('Design', 'UI UX and visual design'),
('Business Development', 'Partnerships and growth'),
('Training', 'Employee learning and development'),
('Public Relations', 'Corporate communication and PR');


-- =========================================================
-- 2. ROLE — 20 rows
-- =========================================================

INSERT INTO role (role_name, description) VALUES
('Software Engineer', 'Develops software applications'),
('HR Manager', 'Manages human resource activities'),
('Accountant', 'Handles accounting operations'),
('Marketing Executive', 'Handles marketing activities'),
('Sales Executive', 'Manages sales activities'),
('Operations Manager', 'Manages business operations'),
('IT Administrator', 'Manages IT infrastructure'),
('Legal Advisor', 'Provides legal guidance'),
('Product Manager', 'Manages product development'),
('Support Executive', 'Handles customer support'),
('Data Scientist', 'Performs data analysis and modeling'),
('QA Engineer', 'Tests software applications'),
('Research Analyst', 'Performs research activities'),
('Admin Executive', 'Handles administration'),
('Procurement Officer', 'Manages procurement activities'),
('Security Analyst', 'Handles security operations'),
('UI UX Designer', 'Designs user interfaces'),
('Business Analyst', 'Analyzes business requirements'),
('Trainer', 'Conducts employee training'),
('PR Executive', 'Handles public relations');



INSERT INTO employee
(employee_name, email, phone, hire_date, department_id, role_id, manager_id, employment_status)
VALUES
('Rohit Singh', 'rohit.singh@example.com', '9876500001', '2023-07-10', 1, 1, NULL, 'Active'),
('Amit Kumar', 'amit.kumar@example.com', '9876500002', '2022-05-15', 2, 2, NULL, 'Active'),
('Priya Sharma', 'priya.sharma@example.com', '9876500003', '2021-03-20', 3, 3, NULL, 'Active'),
('Neha Verma', 'neha.verma@example.com', '9876500004', '2020-08-12', 4, 4, NULL, 'Active'),
('Rahul Gupta', 'rahul.gupta@example.com', '9876500005', '2019-11-05', 5, 5, NULL, 'Active'),

('Ankit Raj', 'ankit.raj@example.com', '9876500006', '2024-01-10', 1, 1, 1, 'Active'),
('Sneha Das', 'sneha.das@example.com', '9876500007', '2024-02-15', 2, 2, 1, 'Active'),
('Vikas Yadav', 'vikas.yadav@example.com', '9876500008', '2023-09-18', 3, 3, 2, 'Active'),
('Pooja Singh', 'pooja.singh@example.com', '9876500009', '2024-03-12', 4, 4, 2, 'Onboarding'),
('Karan Mehta', 'karan.mehta@example.com', '9876500010', '2022-10-21', 5, 5, 3, 'Active'),

('Nisha Patel', 'nisha.patel@example.com', '9876500011', '2023-04-11', 6, 6, 3, 'Active'),
('Arjun Kapoor', 'arjun.kapoor@example.com', '9876500012', '2024-05-09', 7, 7, 4, 'Active'),
('Simran Kaur', 'simran.kaur@example.com', '9876500013', '2023-06-17', 8, 8, 4, 'Active'),
('Manish Jain', 'manish.jain@example.com', '9876500014', '2021-12-01', 9, 9, 5, 'Active'),
('Kavita Rao', 'kavita.rao@example.com', '9876500015', '2022-07-25', 10, 10, 5, 'Inactive'),

('Deepak Sinha', 'deepak.sinha@example.com', '9876500016', '2024-06-10', 11, 11, 1, 'Active'),
('Anjali Mishra', 'anjali.mishra@example.com', '9876500017', '2024-07-01', 12, 12, 2, 'Onboarding'),
('Mohit Agarwal', 'mohit.agarwal@example.com', '9876500018', '2020-02-14', 13, 13, 3, 'Resigned'),
('Riya Malhotra', 'riya.malhotra@example.com', '9876500019', '2023-10-30', 14, 14, 4, 'Active'),
('Saurabh Tiwari', 'saurabh.tiwari@example.com', '9876500020', '2021-09-09', 15, 15, 5, 'Terminated');



INSERT INTO leave_type
(leave_type_name, description, max_days_per_year, requires_approval)
VALUES
('Annual Leave', 'Regular annual vacation leave', 30, TRUE),
('Sick Leave', 'Leave due to illness', 15, FALSE),
('Casual Leave', 'Short personal leave', 12, TRUE),
('Maternity Leave', 'Maternity related leave', 180, TRUE),
('Paternity Leave', 'Paternity related leave', 15, TRUE),
('Bereavement Leave', 'Leave due to family bereavement', 10, TRUE),
('Emergency Leave', 'Emergency personal leave', 7, TRUE),
('Study Leave', 'Leave for educational purposes', 20, TRUE),
('Unpaid Leave', 'Leave without salary', 30, TRUE),
('Work From Home', 'Temporary remote work', 20, FALSE),
('Comp Off', 'Compensatory leave', 10, TRUE),
('Marriage Leave', 'Leave for employee marriage', 15, TRUE),
('Medical Leave', 'Extended medical leave', 30, TRUE),
('Child Care Leave', 'Leave for childcare', 30, TRUE),
('Adoption Leave', 'Leave for adoption', 60, TRUE),
('Relocation Leave', 'Leave for relocation', 7, TRUE),
('Exam Leave', 'Leave for examinations', 10, TRUE),
('Volunteer Leave', 'Leave for volunteering activities', 5, TRUE),
('Special Leave', 'Special approved leave', 10, TRUE),
('Holiday Leave', 'Additional holiday leave', 5, FALSE);


-- =========================================================
-- 5. LEAVE BALANCE — 20 rows
-- =========================================================

INSERT INTO leave_balance
(employee_id, leave_type_id, leave_year, allocated_days, used_days, remaining_days)
VALUES
(1, 1, 2026, 30, 5, 25),
(2, 2, 2026, 15, 2, 13),
(3, 3, 2026, 12, 4, 8),
(4, 4, 2026, 180, 20, 160),
(5, 5, 2026, 15, 5, 10),
(6, 6, 2026, 10, 2, 8),
(7, 7, 2026, 7, 1, 6),
(8, 8, 2026, 20, 5, 15),
(9, 9, 2026, 30, 10, 20),
(10, 10, 2026, 20, 3, 17),
(11, 11, 2026, 10, 2, 8),
(12, 12, 2026, 15, 5, 10),
(13, 13, 2026, 30, 7, 23),
(14, 14, 2026, 30, 4, 26),
(15, 15, 2026, 60, 10, 50),
(16, 16, 2026, 7, 2, 5),
(17, 17, 2026, 10, 3, 7),
(18, 18, 2026, 5, 1, 4),
(19, 19, 2026, 10, 2, 8),
(20, 20, 2026, 5, 0, 5);



INSERT INTO leave_request
(employee_id, leave_type_id, start_date, end_date, total_days,
 reason, status, requested_at, cancelled_at)
VALUES
(1, 1, '2026-01-10', '2026-01-12', 3, 'Family vacation', 'Approved', '2026-01-01 10:00:00', NULL),

(2, 2, '2026-01-15', '2026-01-16', 2, 'Medical rest', 'Approved', '2026-01-10 09:30:00', NULL),

(3, 3, '2026-02-05', '2026-02-06', 2, 'Personal work', 'Rejected', '2026-01-25 11:00:00', NULL),

(4, 4, '2026-02-10', '2026-03-10', 29, 'Maternity leave', 'Approved', '2026-01-20 12:00:00', NULL),

(5, 5, '2026-02-15', '2026-02-20', 6, 'Paternity leave', 'Approved', '2026-02-01 10:15:00', NULL),

(6, 6, '2026-03-01', '2026-03-03', 3, 'Family bereavement', 'Approved', '2026-02-25 14:00:00', NULL),

(7, 7, '2026-03-10', '2026-03-11', 2, 'Emergency situation', 'Pending', '2026-03-05 09:00:00', NULL),

(8, 8, '2026-03-15', '2026-03-18', 4, 'Professional examination', 'Approved', '2026-03-01 15:30:00', NULL),

(9, 9, '2026-04-01', '2026-04-05', 5, 'Personal requirement', 'Pending', '2026-03-20 11:45:00', NULL),

(10, 10, '2026-04-10', '2026-04-11', 2, 'Remote work requirement', 'Approved', '2026-04-05 10:00:00', NULL),

(11, 11, '2026-04-15', '2026-04-16', 2, 'Worked on weekend', 'Approved', '2026-04-10 09:30:00', NULL),

(12, 12, '2026-05-01', '2026-05-05', 5, 'Marriage ceremony', 'Approved', '2026-04-15 12:00:00', NULL),

(13, 13, '2026-05-10', '2026-05-14', 5, 'Medical treatment', 'Rejected', '2026-05-01 10:30:00', NULL),

(14, 14, '2026-05-20', '2026-05-22', 3, 'Child care', 'Approved', '2026-05-10 11:00:00', NULL),

(15, 15, '2026-06-01', '2026-06-10', 10, 'Adoption process', 'Approved', '2026-05-20 13:00:00', NULL),

(16, 16, '2026-06-15', '2026-06-16', 2, 'House relocation', 'Cancelled', '2026-06-01 09:15:00', '2026-06-10 16:00:00'),

(17, 17, '2026-07-01', '2026-07-03', 3, 'University examination', 'Approved', '2026-06-20 10:00:00', NULL),

(18, 18, '2026-07-10', '2026-07-11', 2, 'Community volunteering', 'Pending', '2026-07-01 14:00:00', NULL),

(19, 19, '2026-08-01', '2026-08-02', 2, 'Personal requirement', 'Approved', '2026-07-20 10:45:00', NULL),

(20, 20, '2026-08-15', '2026-08-16', 2, 'Additional holiday', 'Cancelled', '2026-08-01 09:30:00', '2026-08-10 15:00:00');


-- =========================================================
-- 7. APPROVAL HISTORY — 20 rows
-- =========================================================

INSERT INTO approval_history
(leave_request_id, approver_id, action, comments, action_at)
VALUES
(1, 2, 'Approved', 'Leave approved by HR manager', '2026-01-02 10:00:00'),

(2, 3, 'Approved', 'Medical leave approved', '2026-01-11 09:00:00'),

(3, 4, 'Rejected', 'Leave rejected due to project requirements', '2026-01-27 14:00:00'),

(4, 5, 'Approved', 'Maternity leave approved', '2026-01-22 11:00:00'),

(5, 1, 'Approved', 'Paternity leave approved', '2026-02-02 10:30:00'),

(6, 2, 'Approved', 'Bereavement leave approved', '2026-02-26 15:00:00'),

(7, 3, 'Approved', 'Emergency leave approved', '2026-03-06 10:00:00'),

(8, 4, 'Approved', 'Study leave approved', '2026-03-02 16:00:00'),

(9, 5, 'Approved', 'Leave approved', '2026-03-21 12:00:00'),

(10, 1, 'Approved', 'Remote work approved', '2026-04-06 11:00:00'),

(11, 2, 'Approved', 'Comp off approved', '2026-04-11 10:00:00'),

(12, 3, 'Approved', 'Marriage leave approved', '2026-04-16 13:00:00'),

(13, 4, 'Rejected', 'Medical leave request rejected', '2026-05-02 11:30:00'),

(14, 5, 'Approved', 'Child care leave approved', '2026-05-11 12:00:00'),

(15, 1, 'Approved', 'Adoption leave approved', '2026-05-21 14:00:00'),

(16, 2, 'Cancelled', 'Employee cancelled the request', '2026-06-10 16:00:00'),

(17, 3, 'Approved', 'Exam leave approved', '2026-06-21 11:00:00'),

(18, 4, 'Approved', 'Volunteer leave approved', '2026-07-02 15:00:00'),

(19, 5, 'Approved', 'Special leave approved', '2026-07-21 11:30:00'),

(20, 1, 'Cancelled', 'Employee cancelled the holiday request', '2026-08-10 15:00:00');

COMMIT;


SELECT COUNT(*) FROM department;
SELECT COUNT(*) FROM role;
SELECT COUNT(*) FROM employee;
SELECT COUNT(*) FROM leave_type;
SELECT COUNT(*) FROM leave_balance;
SELECT COUNT(*) FROM leave_request;
SELECT COUNT(*) FROM approval_history;