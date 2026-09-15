from sqlalchemy.orm import Session

from app.models.employee import Employee
from app.repositories import employee_repository
from app.schemas.employee import EmployeeCreate


def create_employee(db: Session, employee_data: EmployeeCreate):

    employee = Employee(
        name=employee_data.name
    )

    return employee_repository.create_employee(db, employee)


def get_employees(db: Session):

    return employee_repository.get_employees(db)