# Day 13 – FastAPI + PostgreSQL Employee Management API

[![Agentic Chatbot with FastAPI and PostgreSQL](https://www.orfium.com/owp-content/uploads/2025/04/Screenshot-2025-04-08-at-2.47.23%E2%80%AFPM.png)](https://www.orfium.com/engineering/how-to-build-an-agentic-chatbot-with-fastapi-and-postgresql/)

A backend Employee Management API built using **FastAPI, PostgreSQL, SQLAlchemy, and Pydantic**.

This project extends the Day 12 Employee API by replacing in-memory employee data with a real PostgreSQL database.

## 🚀 Objective

Connect the FastAPI application to PostgreSQL and implement:

- Create Employee
- Read Employee
- Update Employee
- Delete Employee
- Search Employee
- Database validation
- Error handling
- Transactions
- Department filtering

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

## 🛠️ Tech Stack

- Python
- FastAPI
- PostgreSQL
- SQLAlchemy
- Pydantic
- Uvicorn
- python-dotenv

## 📁 Project Structure

```text
day 13 FASTAPI/

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
├── README.md
├── requirements.txt
└── table_posstgres.sql
```

> `.venv/` and Python `__pycache__/` directories are local/generated files and should not be committed to the repository.

## 🗄️ PostgreSQL Database

The application uses PostgreSQL as the persistent database.

The database URL is stored in `.env`:

```env
DATABASE_URL=postgresql+psycopg2://username:password@localhost:5432/database_name
```

Do not commit `.env` to GitHub.

Recommended `.gitignore` entries:

```text
.env
.venv/
__pycache__/
*.pyc
```

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

## 👨‍💼 Employee Model

The `employees` table contains:

| Column | Description |
|---|---|
| id | Primary key |
| name | Employee name |
| email | Unique employee email |
| department | Employee department |
| designation | Employee designation |
| salary | Employee salary |
| is_active | Employee active status |

Database constraints include:

- Primary Key
- Unique email
- NOT NULL constraints
- Salary CHECK constraint

## 📄 PostgreSQL SQL Script

The project also contains:

```text
table_posstgres.sql
```

This file contains the PostgreSQL table creation SQL used for the project.

## 🔌 API Endpoints

### Create Employee

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

### Get All Employees

```http
GET /employees
```

### Get Employee by ID

```http
GET /employees/{emp_id}
```

Example:

```http
GET /employees/1
```

### Update Employee

```http
PUT /employees/{emp_id}
```
### Partial Update Employee

```http
PATCH /employees/{emp_id}
```
### Delete Employee

```http
DELETE /employees/{emp_id}
```

## 🔎 Search Employee

Search employees by name using a query parameter:

```http
GET /employees?search=rahul
```

The implementation uses a case-insensitive partial match.

## 🏢 Filter by Department

```http
GET /employees?department=IT
```

## ✅ Validation

### Pydantic Validation

Examples:

```python
name: str = Field(min_length=2, max_length=50)

email: EmailStr

salary: float = Field(gt=0)
```

### Database Validation

PostgreSQL also protects the data using constraints such as:

- PRIMARY KEY
- UNIQUE
- NOT NULL
- CHECK

Duplicate employee emails are handled through SQLAlchemy's `IntegrityError`.

## ⚠️ Error Handling

The service layer handles application and database errors.

Examples:

```text
404 Not Found

409 Conflict

400 Bad Request

422 Unprocessable Entity
```

Duplicate email:

```json
{
  "detail": "Email already exists"
}
```

## 🔄 Transactions

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

## 🧩 SQLAlchemy ORM

The project uses SQLAlchemy ORM for database operations.

### Get All Employees

```python
stmt = select(Employee)

result = db.execute(stmt)

employees = result.scalars().all()
```

### Get One Employee

```python
stmt = select(Employee).where(Employee.id == emp_id)

result = db.execute(stmt)

employee = result.scalar_one_or_none()
```

## 📦 Installation

Clone the repository:

```bash
git clone <your-repository-url>

cd "day 13 FASTAPI"
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

## ⚙️ Environment Setup

Create a `.env` file:

```env
DATABASE_URL=postgresql+psycopg2://postgres:your_password@localhost:5432/day13db
```

Make sure PostgreSQL is running and the database exists.

## ▶️ Run the Application

From the project root:

```bash
uvicorn app.main:app --reload
```

The API will be available at:

```text
http://127.0.0.1:8000
```

## 📚 API Documentation

Swagger UI:

```text
http://127.0.0.1:8000/docs
```

ReDoc:

```text
http://127.0.0.1:8000/redoc
```

Swagger can be used to test:

```text
POST    /employees
GET     /employees
GET     /employees/{emp_id}
PUT     /employees/{emp_id}
DELETE  /employees/{emp_id}
```

Along with:

```text
GET /employees?search=rahul
GET /employees?department=IT
```

## 🧪 Testing

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

## 👨‍💻 Author

**Rohit Raj Singh**

B.Tech CSE  
ITS Engineering College, Greater Noida