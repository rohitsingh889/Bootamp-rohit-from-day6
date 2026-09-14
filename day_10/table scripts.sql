CREATE TABLE department (
    department_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE role (
    role_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE employee (
    employee_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    hire_date DATE NOT NULL,
    department_id INT NOT NULL,
    role_id INT NOT NULL,
    manager_id INT,

    employment_status VARCHAR(20) NOT NULL
        CHECK (employment_status IN (
            'Active',
            'Inactive',
            'Onboarding',
            'Resigned',
            'Terminated'
        )),

    FOREIGN KEY (department_id)
        REFERENCES department(department_id),

    FOREIGN KEY (role_id)
        REFERENCES role(role_id),

    FOREIGN KEY (manager_id)
        REFERENCES employee(employee_id),

    CHECK (manager_id IS NULL OR manager_id <> employee_id)
);


CREATE TABLE leave_type (
    leave_type_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    leave_type_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),

    max_days_per_year INT NOT NULL
        CHECK (max_days_per_year > 0),

    requires_approval BOOLEAN NOT NULL DEFAULT TRUE
);


CREATE TABLE leave_balance (
    balance_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    employee_id INT NOT NULL,
    leave_type_id INT NOT NULL,
    leave_year INT NOT NULL,

    allocated_days DECIMAL(5,2) NOT NULL
        CHECK (allocated_days >= 0),

    used_days DECIMAL(5,2) NOT NULL DEFAULT 0
        CHECK (used_days >= 0),

    remaining_days DECIMAL(5,2) NOT NULL
        CHECK (remaining_days >= 0),

    FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id),

    FOREIGN KEY (leave_type_id)
        REFERENCES leave_type(leave_type_id),

    UNIQUE (employee_id, leave_type_id, leave_year),

    CHECK (leave_year >= 2000)
);


CREATE TABLE leave_request (
    leave_request_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    employee_id INT NOT NULL,
    leave_type_id INT NOT NULL,

    start_date DATE NOT NULL,
    end_date DATE NOT NULL,

    total_days DECIMAL(5,2) NOT NULL
        CHECK (total_days > 0),

    reason TEXT NOT NULL,

    status VARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (status IN (
            'Pending',
            'Approved',
            'Rejected',
            'Cancelled'
        )),

    requested_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    cancelled_at TIMESTAMP,

    FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id),

    FOREIGN KEY (leave_type_id)
        REFERENCES leave_type(leave_type_id),

    CHECK (end_date >= start_date),

    CHECK (
        (status = 'Cancelled' AND cancelled_at IS NOT NULL)
        OR
        (status <> 'Cancelled')
    )
);


CREATE TABLE approval_history (
    approval_history_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    leave_request_id INT NOT NULL,
    approver_id INT NOT NULL,

    action VARCHAR(20) NOT NULL
        CHECK (action IN (
            'Approved',
            'Rejected',
            'Cancelled'
        )),

    comments TEXT,

    action_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (leave_request_id)
        REFERENCES leave_request(leave_request_id),

    FOREIGN KEY (approver_id)
        REFERENCES employee(employee_id)
);