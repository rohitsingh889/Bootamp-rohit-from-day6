from sqlalchemy.orm import Session

from app.repositories import employee_repository

def create_employee(
    db: Session,
    employee_data: dict
):
    return employee_repository.create_employee(
        db,
        employee_data
    )