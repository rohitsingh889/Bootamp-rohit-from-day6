from sqlalchemy.orm import Session

from app.models.employee import Employee


def create_employee(db: Session, employee_data: dict):

    employee = Employee(**employee_data)
    db.add(employee)
    db.commit()
    db.refresh(employee)
    return employee
    

    
































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