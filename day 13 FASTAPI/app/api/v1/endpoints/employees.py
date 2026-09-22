from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from app.schemas.employee import (
    EmployeeCreate,
    EmployeeResponse,
    EmployeeUpdate
)
from app.core.dependencies import get_db
from app.services import employee_service

router = APIRouter()


@router.post("/employees", status_code=201)
def create_emp(employee:EmployeeCreate,db:Session=Depends(get_db)):
    employee_data = employee.model_dump()

    return employee_service.create_employee(
    db,
    employee_data
)



























































