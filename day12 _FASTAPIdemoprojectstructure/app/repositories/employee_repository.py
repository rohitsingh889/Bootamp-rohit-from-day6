from sqlalchemy import select
from sqlalchemy.orm import Session

from app.models.employee import Employee


def create_employee(db: Session, employee: Employee):
    db.add(employee)
    db.commit()
    db.refresh(employee)

    return employee


def get_employees(db: Session):
    statement = select(Employee)

    return db.scalars(statement).all()