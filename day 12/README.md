# Employee Management API
![REST API Architecture](https://media.geeksforgeeks.org/wp-content/uploads/20250822144440953865/rest_api.webp)
A simple Employee Management REST API built using **FastAPI** as part of **Day 12 – FastAPI** of the Intern-to-Engineer Bootcamp.

## Objective

Build the first real backend API using FastAPI and practice:

- FastAPI project structure
- REST API routes
- HTTP methods
- Path parameters
- Request models
- Response models
- Pydantic validation
- HTTP status codes
- Error handling
- Swagger/OpenAPI
- CRUD operations

## Tech Stack

- Python
- FastAPI
- Pydantic
- Uvicorn
- Swagger/OpenAPI

## Project Structure

```text
day12_app/
│
├── main.py
│
└── schemas/
    ├── __init__.py
    └── employees.py
```

## API Endpoints

| Method | Endpoint | Description | Success Status |
|--------|----------|-------------|----------------|
| POST | `/employees` | Create employee | 201 |
| GET | `/employees` | Get all employees | 200 |
| GET | `/employees/{emp_id}` | Get employee by ID | 200 |
| PUT | `/employees/{emp_id}` | Update employee | 200 |
| DELETE | `/employees/{emp_id}` | Delete employee | 204 |

## Employee Data Structure

```json
{
  "id": 1,
  "name": "Rohit Singh",
  "email": "rohit@example.com",
  "department": "Engineering",
  "designation": "Software Engineer",
  "salary": 50000,
  "is_active": true
}
```

## Pydantic Schemas

### EmployeeCreate

Used for creating a new employee.

```python
class EmployeeCreate(BaseModel):
    name: str = Field(min_length=2, max_length=50)
    email: EmailStr
    department: str = Field(min_length=2, max_length=50)
    designation: str = Field(min_length=2, max_length=50)
    salary: float = Field(gt=0)
    is_active: bool = True
```

### EmployeeResponse

Used to define the structure of API responses.

```python
class EmployeeResponse(BaseModel):
    id: int
    name: str
    email: EmailStr
    department: str
    designation: str
    salary: float
    is_active: bool
```

### EmployeeUpdate

Used for updating an existing employee.

```python
class EmployeeUpdate(BaseModel):
    name: str = Field(min_length=2, max_length=50)
    email: EmailStr
    department: str = Field(min_length=2, max_length=50)
    designation: str = Field(min_length=2, max_length=50)
    salary: float = Field(gt=0)
    is_active: bool = True
```

## Validation

Pydantic is used for request validation.

- `name` → minimum 2 and maximum 50 characters
- `email` → valid email format
- `department` → minimum 2 and maximum 50 characters
- `designation` → minimum 2 and maximum 50 characters
- `salary` → must be greater than 0
- `is_active` → boolean, defaults to `True`

Invalid request data is automatically rejected by FastAPI/Pydantic.

## Error Handling

The API uses `HTTPException` for resource-related errors.

Example:

```python
raise HTTPException(
    status_code=404,
    detail="Employee not found"
)
```

If an employee does not exist:

```json
{
  "detail": "Employee not found"
}
```

## HTTP Status Codes

| Status Code | Meaning | Usage |
|-------------|---------|-------|
| 200 | OK | GET and PUT successful |
| 201 | Created | Employee created successfully |
| 204 | No Content | Employee deleted successfully |
| 404 | Not Found | Employee does not exist |
| 422 | Validation Error | Invalid request data |

## Path Parameters

The employee ID is used as a dynamic path parameter.

Examples:

```text
GET /employees/1
GET /employees/2
GET /employees/10
```

FastAPI route:

```python
@app.get("/employees/{emp_id}")
def get(emp_id: int):
    ...
```

The `{emp_id}` part of the URL is dynamic.

## CRUD Operations

### 1. Create Employee

```text
POST /employees
```

Request body:

```json
{
  "name": "Rohit Singh",
  "email": "rohit@example.com",
  "department": "Engineering",
  "designation": "Software Engineer",
  "salary": 50000,
  "is_active": true
}
```

Response:

```json
{
  "id": 1,
  "name": "Rohit Singh",
  "email": "rohit@example.com",
  "department": "Engineering",
  "designation": "Software Engineer",
  "salary": 50000,
  "is_active": true
}
```

Status: `201 Created`

### 2. Get All Employees

```text
GET /employees
```

Returns all employees stored in the application.

Status: `200 OK`

### 3. Get Employee by ID

```text
GET /employees/{emp_id}
```

Example:

```text
GET /employees/1
```

Possible status codes:

```text
200 OK
404 Not Found
```

### 4. Update Employee

```text
PUT /employees/{emp_id}
```

Example:

```text
PUT /employees/1
```

Request body:

```json
{
  "name": "Rohit Singh",
  "email": "rohit@example.com",
  "department": "Engineering",
  "designation": "Senior Software Engineer",
  "salary": 60000,
  "is_active": true
}
```

Possible status codes:

```text
200 OK
404 Not Found
```

### 5. Delete Employee

```text
DELETE /employees/{emp_id}
```

Example:

```text
DELETE /employees/1
```

Possible status codes:

```text
204 No Content
404 Not Found
```

## Temporary Data Storage

For Day 12, employee data is stored in an in-memory Python list:

```python
emp_db: list[dict] = []
```

Employee IDs are generated using:

```python
seq_id = 0
```

When an employee is created:

```python
seq_id += 1
emp["id"] = seq_id
```

The data is temporary and will be lost when the application restarts.

## Installation

Install the required dependencies:

```bash
pip install fastapi uvicorn email-validator
```

## Run the Application

From the directory containing `day12_app`:

```bash
uvicorn day12_app.main:app --reload
```

The application will run at:

```text
http://127.0.0.1:8000
```

## Swagger / OpenAPI Documentation

FastAPI automatically generates interactive API documentation.

Open:

```text
http://127.0.0.1:8000/docs
```

The following APIs can be tested directly from Swagger:

```text
POST    /employees
GET     /employees
GET     /employees/{emp_id}
PUT     /employees/{emp_id}
DELETE  /employees/{emp_id}
```

## Testing

Test the following cases in Swagger:

### Create Employee

- Valid employee
- Invalid email
- Negative salary
- Missing required field
- Invalid field length

### Get Employee

- Existing employee ID
- Non-existing employee ID

### Update Employee

- Existing employee ID
- Non-existing employee ID
- Invalid request data

### Delete Employee

- Existing employee ID
- Non-existing employee ID
- Deleting the same employee again

## API Flow

```text
Client
   ↓
HTTP Request
   ↓
FastAPI Route
   ↓
Path Parameter / Request Body
   ↓
Pydantic Validation
   ↓
CRUD Logic
   ↓
In-Memory emp_db
   ↓
Response Model
   ↓
HTTP Response
```

## Concepts Practiced

- FastAPI application setup
- REST API
- CRUD operations
- HTTP methods
- Dynamic routes
- Path parameters
- Request body
- Pydantic models
- Request validation
- Response models
- HTTP status codes
- HTTPException
- Error handling
- Swagger/OpenAPI
- Uvicorn
- In-memory data storage

## Day 12 Outcome

Successfully built an Employee Management REST API using FastAPI with:

- Create employee
- Read all employees
- Read employee by ID
- Update employee
- Delete employee
- Request validation
- Response validation
- Proper HTTP status codes
- Error handling
- Dynamic routes
- Swagger/OpenAPI documentation

## Future Scope

The current application uses an in-memory Python list for storage.

The next stage can replace the temporary storage with a real database:

```text
FastAPI
   ↓
SQLAlchemy ORM
   ↓
PostgreSQL
   ↓
Database
```

This will provide persistent data storage and database-based CRUD operations.

## Author

**Rohit Raj Singh**

B.Tech CSE  
ITS Engineering College

**Intern-to-Engineer Bootcamp — Day 12: FastAPI**
