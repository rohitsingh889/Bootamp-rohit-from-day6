from sqlalchemy.orm import Session
from sqlalchemy import select
from app.models.employee import Employee
from sqlalchemy.exc import IntegrityError



def create_employee(db: Session, employee_data: dict):
    try:
        employee = Employee(**employee_data)

        db.add(employee)
        db.commit()
        db.refresh(employee)

        return employee

    except IntegrityError:
        db.rollback()
        raise
    

    

def get_employees(db: Session):

    emp = select(Employee)
    result = db.execute(emp)
    employees = result.scalars().all()
    return employees

def getone_employee(emp_id:int,db:Session):
    employee= select(Employee).where(Employee.id==emp_id)
    result=db.execute(employee)
    emp = result.scalar_one_or_none()
    return emp


def update_employee(emp_id: int, employee_data: dict, db: Session):
    emp = select(Employee).where(Employee.id == emp_id)
    result = db.execute(emp)
    employee = result.scalar_one_or_none()

    if employee is None:
        return None

    try:
        for key, value in employee_data.items():
            setattr(employee, key, value)

        db.commit()
        db.refresh(employee)

        return employee

    except IntegrityError:
        db.rollback()
        raise


def delete_emp(emp_id: int, db: Session):

    emp = select(Employee).where(Employee.id == emp_id)

    result = db.execute(emp)

    employee = result.scalar_one_or_none()

    if employee is None:
        return None

    db.delete(employee)
    db.commit()

    return employee



def search_employee(search: str, db: Session):

    emp = select(Employee).where(
        Employee.name.ilike(f"%{search}%")
    )

    result = db.execute(emp)

    employees = result.scalars().all()

    return employees



def get_by_department(department: str, db: Session):

    emp = select(Employee).where(
        Employee.department == department
    )

    result = db.execute(emp)

    employees = result.scalars().all()

    return employees



def patch_employee(
    emp_id: int,
    employee_data: dict,
    db: Session
):
    stmt = select(Employee).where(Employee.id == emp_id)

    result = db.execute(stmt)

    employee = result.scalar_one_or_none()

    if employee is None:
        return None

    try:
        for key, value in employee_data.items():
            setattr(employee, key, value)

        db.commit()
        db.refresh(employee)

        return employee

    except IntegrityError:
        db.rollback()
        raise



















'''
from sqlalchemy import text

def create_employee(db: Session, employee_data: dict):

    query = text("""
        INSERT INTO employees
        (name, email, department, designation, salary, is_active)
        VALUES
        (:name, :email, :department, :designation, :salary, :is_active)
        RETURNING id, name, email, department, designation, salary, is_active
    """)

    result = db.execute(query, employee_data)
    employee = result.mappings().one()

    db.commit()

    return employee
'''