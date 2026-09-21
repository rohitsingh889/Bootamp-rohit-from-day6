from sqlalchemy import select
from sqlalchemy.orm import Session

from app.models.employee import Employee


def get_all_employees(db: Session):
    statement = select(Employee)

    result = db.execute(statement)

    return result.scalars().all()