# Day 14 – FastAPI + PostgreSQL Employee Management API

A backend Employee Management API built using **FastAPI, PostgreSQL, SQLAlchemy, and Pydantic**.

This project extends the Day 13 Employee API by improving API quality with:

- Pagination
- Search
- Department filtering
- Sorting
- Input validation
- Error handling
- Logging
- PostgreSQL database integration
- CRUD operations

---

## 🚀 Objective

Improve the Employee Management API by implementing:

- Create Employee
- Read Employee
- Update Employee
- Delete Employee
- Partial Update Employee
- Search Employee
- Department filtering
- Pagination
- Sorting
- Input validation
- Error handling
- Application logging

---

## 🏗️ Architecture

```text
Client
   ↓
FastAPI
   ↓
API / Routes
   ↓
Service Layer
   ↓
Repository Layer
   ↓
SQLAlchemy ORM
   ↓
PostgreSQL
```

### Logging Flow

```text
API Request
   ↓
FastAPI Endpoint
   ↓
Python Logger
   ↓
Terminal + app.log
```

---

## 🛠️ Tech Stack

- Python
- FastAPI
- PostgreSQL
- SQLAlchemy
- Pydantic
- Uvicorn
- python-dotenv
- Python Logging

---

## 📁 Project Structure

```text
day 14/

├── app/
│   ├── api/
│   │   ├── __init__.py
│   │   └── v1/
│   │       ├── endpoints/
│   │       │   ├── employees.py
│   │       │   └── __init__.py
│   │       ├── __init__.py
│   │       └── router.py
│   │
│   ├── core/
│   │   ├── config.py
│   │   ├── dependencies.py
│   │   └── __init__.py
│   │
│   ├── db/
│   │   ├── base.py
│   │   ├── session.py
│   │   └── __init__.py
│   │
│   ├── models/
│   │   ├── employee.py
│   │   └── __init__.py
│   │
│   ├── repositories/
│   │   ├── employee_repository.py
│   │   └── __init__.py
│   │
│   ├── schemas/
│   │   ├── employee.py
│   │   └── __init__.py
│   │
│   ├── services/
│   │   ├── employee_service.py
│   │   └── __init__.py
│   │
│   ├── main.py
│   └── __init__.py
│
├── tests/
│   ├── __init__.py
│   ├── test_db.py
│   ├── test_employees.py
│   └── test_raw_sql.py
│
├── app.log
├── README.md
├── requirements.txt
└── table_posstgres.sql
```

> `.venv/` and Python `__pycache__/` directories are local/generated files and should not be committed to the repository.

Recommended `.gitignore`:

```text
.env
.venv/
__pycache__/
*.pyc
*.log
```

---

## 🗄️ PostgreSQL Database

The application uses PostgreSQL as the persistent database.

The database URL is stored in `.env`:

```env
DATABASE_URL=postgresql+psycopg2://username:password@localhost:5432/database_name
```

> Do not commit `.env` to GitHub.

---

## 🏗️ SQLAlchemy Database Base

The project uses SQLAlchemy's `DeclarativeBase` as the common base class for ORM models.

`app/db/base.py`:

```python
from sqlalchemy.orm import DeclarativeBase


class Base(DeclarativeBase):
    pass
```

The SQLAlchemy models inherit from `Base`.

Example:

```python
class Employee(Base):

    __tablename__ = "employees"
```

This allows SQLAlchemy to register the model and its table metadata.

### Table Creation Using SQLAlchemy

If the PostgreSQL table does not already exist, SQLAlchemy can create it from the registered models:

```python
from app.db.base import Base
from app.db.session import engine
from app.models.employee import Employee

Base.metadata.create_all(bind=engine)
```

### Important Notes

`Base.metadata.create_all()`:

- Creates missing tables.
- Does not modify or alter an existing table structure.
- Uses the metadata registered through SQLAlchemy models.

For production schema changes, use **Alembic migrations** instead of relying on `create_all()` to alter existing tables.

---

## 👨‍💼 Employee Model

The `employees` table contains:

| Column | Description |
|---|---|
| `id` | Primary key |
| `name` | Employee name |
| `email` | Unique employee email |
| `department` | Employee department |
| `designation` | Employee designation |
| `salary` | Employee salary |
| `is_active` | Employee active status |

Database constraints include:

- Primary Key
- Unique email
- NOT NULL constraints
- Salary CHECK constraint

---

## 📄 PostgreSQL SQL Script

The project also contains:

```text
table_posstgres.sql
```

This file contains the PostgreSQL table creation SQL used for the project.

---

# 🔌 API Endpoints

## Create Employee

```http
POST /employees
```

Example request:

```json
{
  "name": "Rohit Singh",
  "email": "rohit@example.com",
  "department": "IT",
  "designation": "Backend Developer",
  "salary": 55000,
  "is_active": true
}
```

---

## Get All Employees

```http
GET /employees
```

---

## Get Employee by ID

```http
GET /employees/{emp_id}
```

Example:

```http
GET /employees/1
```

---

## Update Employee

```http
PUT /employees/{emp_id}
```

---

## Partial Update Employee

```http
PATCH /employees/{emp_id}
```

---

## Delete Employee

```http
DELETE /employees/{emp_id}
```

---

# 📄 Pagination

The Employee API supports pagination using `page` and `limit` query parameters.

```http
GET /employees?page=1&limit=20
```

Example:

```http
GET /employees?page=2&limit=10
```

Pagination uses:

```python
offset = (page - 1) * limit
```

Validation:

- `page >= 1`
- `limit >= 1`
- `limit <= 100`

---

# 🔎 Search Employee

Employees can be searched by name using the `search` query parameter.

```http
GET /employees?search=rahul
```

The search uses a case-insensitive partial match.

Search can also be combined with pagination:

```http
GET /employees?search=rohit&page=1&limit=10
```

---

# 🏢 Filter by Department

Employees can be filtered by department:

```http
GET /employees?department=IT
```

---

# ↕️ Sorting

The API supports sorting employees by name.

### Ascending

```http
GET /employees?sort=name&order=asc
```

Example:

```text
Amit
Priya
Rahul
Rohit
```

### Descending

```http
GET /employees?sort=name&order=desc
```

Example:

```text
Rohit
Rahul
Priya
Amit
```

Sorting can also be combined with pagination:

```http
GET /employees?page=1&limit=10&sort=name&order=asc
```

---

# ✅ Validation

The API uses **Pydantic validation** to validate incoming request data.

## Validation Rules

| Field | Validation |
|---|---|
| `name` | Required, minimum 2 and maximum 50 characters |
| `email` | Must be a valid email address |
| `department` | Minimum 2 and maximum 50 characters |
| `designation` | Minimum 2 and maximum 50 characters |
| `salary` | Must be greater than 0 |
| `is_active` | Boolean value |
| `page` | Must be greater than or equal to 1 |
| `limit` | Between 1 and 100 |
| `order` | Supports `asc` and `desc` |

Examples from the Pydantic schema:

```python
name: str = Field(min_length=2, max_length=50)

email: EmailStr

department: str = Field(min_length=2, max_length=50)

designation: str = Field(min_length=2, max_length=50)

salary: float = Field(gt=0)
```

Invalid request data is automatically rejected by FastAPI/Pydantic with a `422 Unprocessable Entity` response.

---

# 🗄️ Database Validation

PostgreSQL protects the data using database constraints such as:

- PRIMARY KEY
- UNIQUE
- NOT NULL
- CHECK

Duplicate employee emails are handled through SQLAlchemy's `IntegrityError`.

Example:

```json
{
  "detail": "Email already exists"
}
```

---

# ⚠️ Error Handling

The service layer handles application and database errors using appropriate HTTP status codes.

Examples:

```text
400 Bad Request
404 Not Found
409 Conflict
422 Unprocessable Entity
500 Internal Server Error
```

## 400 Bad Request

```json
{
  "detail": "Database constraint violated"
}
```

## 404 Not Found

```json
{
  "detail": {
    "msg": "Employee not found"
  }
}
```

## 409 Conflict

Used when a duplicate employee email is submitted.

```json
{
  "detail": "Email already exists"
}
```

## 422 Unprocessable Entity

Example invalid email:

```json
{
  "detail": [
    {
      "loc": ["body", "email"],
      "msg": "value is not a valid email address"
    }
  ]
}
```

Example invalid salary:

```json
{
  "salary": -5000
}
```

The request is rejected because salary must be greater than `0`.

## 500 Internal Server Error

Used when an unexpected server-side error occurs.

```json
{
  "detail": "Internal server error"
}
```

---

# 🔄 Transactions

Database write operations use transactions.

Example:

```python
db.add(employee)

db.commit()

db.refresh(employee)
```

If an integrity error occurs:

```python
except IntegrityError:

    db.rollback()

    raise
```

This keeps the database session in a valid state after a failed write.

---

# 🧩 SQLAlchemy ORM

The project uses SQLAlchemy ORM for database operations.

## Get All Employees

```python
stmt = select(Employee)

result = db.execute(stmt)

employees = result.scalars().all()
```

## Get One Employee

```python
stmt = select(Employee).where(Employee.id == emp_id)

result = db.execute(stmt)

employee = result.scalar_one_or_none()
```

## Pagination

```python
offset = (page - 1) * limit

stmt = (
    select(Employee)
    .offset(offset)
    .limit(limit)
)
```

## Sorting

Ascending:

```python
stmt = stmt.order_by(Employee.name.asc())
```

Descending:

```python
stmt = stmt.order_by(Employee.name.desc())
```

---

# 📝 Logging

The API uses Python's built-in `logging` module.

Logs are displayed in the terminal and stored in:

```text
app.log
```

Logging configuration:

```python
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    handlers=[
        logging.FileHandler("app.log"),
        logging.StreamHandler()
    ]
)

logger = logging.getLogger(__name__)
```

The API logs important operations such as:

- Employee creation
- Employee retrieval
- Employee search
- Department filtering
- Employee update
- Employee deletion
- Partial updates
- Pagination and sorting requests

Example:

```text
INFO - Creating employee: Rohit Singh
INFO - Employee created successfully: Rohit Singh
INFO - Fetching employee with ID: 1
INFO - Updating employee with ID: 1
INFO - Employee deleted successfully: 1
```

---

# 📦 Installation

Clone the repository:

```bash
git clone <your-repository-url>

cd "day 14"
```

Create a virtual environment:

```bash
python3 -m venv .venv
```

Activate it:

```bash
source .venv/bin/activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

---

# ⚙️ Environment Setup

Create a `.env` file:

```env
DATABASE_URL=postgresql+psycopg2://postgres:your_password@localhost:5432/day13db
```

Make sure PostgreSQL is running and the database exists.

---

# ▶️ Run the Application

From the project root:

```bash
uvicorn app.main:app --reload
```

The API will be available at:

```text
http://127.0.0.1:8000
```

---

# 📚 API Documentation

FastAPI automatically provides interactive API documentation.

### Swagger UI

```text
http://127.0.0.1:8000/docs
```

### ReDoc

```text
http://127.0.0.1:8000/redoc
```

Swagger can be used to test:

```text
POST    /employees
GET     /employees
GET     /employees/{emp_id}
PUT     /employees/{emp_id}
PATCH   /employees/{emp_id}
DELETE  /employees/{emp_id}
```

Query-based features:

```text
GET /employees?page=1&limit=20

GET /employees?search=rahul

GET /employees?department=IT

GET /employees?sort=name&order=asc

GET /employees?sort=name&order=desc
```

---

# 🧪 Testing

The project includes tests for database connectivity, employee operations, and raw SQL queries.

Test the database connection:

```bash
python -m tests.test_db
```

Available tests:

```text
tests/
├── test_db.py
├── test_employees.py
└── test_raw_sql.py
```

## Day 14 Test Cases

| Test Case | Request / Condition | Expected Result |
|---|---|---|
| Create Employee | `POST /employees` with valid data | `201 Created` |
| Get Employees | `GET /employees` | `200 OK` |
| Pagination | `GET /employees?page=1&limit=2` | Limited records returned |
| Search | `GET /employees?search=Rohit` | Matching employees returned |
| Sorting ASC | `GET /employees?sort=name&order=asc` | A → Z |
| Sorting DESC | `GET /employees?sort=name&order=desc` | Z → A |
| Get Employee | `GET /employees/1` | Employee details returned |
| Update Employee | `PUT /employees/1` | Employee updated |
| Partial Update | `PATCH /employees/1` | Selected fields updated |
| Delete Employee | `DELETE /employees/1` | Employee deleted |
| Invalid Email | Invalid email format | `422 Unprocessable Entity` |
| Invalid Salary | Salary ≤ 0 | `422 Unprocessable Entity` |
| Missing Employee | Non-existing employee ID | `404 Not Found` |
| Duplicate Email | Existing email | `409 Conflict` |

---



# 👨‍💻 Author

**Rohit Raj Singh**

B.Tech CSE  
ITS Engineering College, Greater Noida