from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from app.schemas.employee import (
    EmployeeCreate,
    EmployeeResponse,
    EmployeeUpdate,
    EmployeeListResponse,
    EmployeeSingleResponse,
    EmployeeDeleteResponse,
    EmployeePatch
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

@router.get("/employees",response_model=EmployeeListResponse)
def get_employees(
    search: str | None = None,
    department: str | None = None,
    db: Session = Depends(get_db)
):
    if search:
        return employee_service.search_employee(search, db)

    if department:
        return employee_service.get_by_department(department, db)

    return employee_service.get_employees(db)


@router.get("/employees/{emp_id}",response_model=EmployeeSingleResponse)
def getone_employee(emp_id:int, db:Session=Depends(get_db)):
    return employee_service.getone_employee(emp_id,db)


@router.put("/employees/{emp_id}",response_model=EmployeeSingleResponse)
def update_employee(emp_id:int,employee_data:EmployeeUpdate,db:Session=Depends(get_db)):
    return employee_service.update_employee(emp_id,employee_data,db)


@router.delete("/employees/{emp_id}",response_model=EmployeeDeleteResponse)
def delete_employee(emp_id:int, db:Session=Depends(get_db)):
    return employee_service.delete_employee(emp_id,db)


@router.patch("/employees/{emp_id}", response_model=EmployeeSingleResponse)
def patch_employee(
    emp_id: int,
    employee_data: EmployeePatch,
    db: Session = Depends(get_db)
):
    return employee_service.patch_employee(
        emp_id,
        employee_data,
        db
    )














































