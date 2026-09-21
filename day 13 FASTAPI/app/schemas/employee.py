from pydantic import BaseModel, EmailStr, Field


class EmployeeCreate(BaseModel):
    name: str = Field(min_length=2, max_length=50)
    email: EmailStr
    department: str = Field(min_length=2, max_length=50)
    designation: str = Field(min_length=2, max_length=50)
    salary: float = Field(gt=0)
    is_active: bool = True


class EmployeeResponse(BaseModel):
    id: int
    name: str
    email: EmailStr
    department: str
    designation: str
    salary: float
    is_active: bool


class EmployeeUpdate(BaseModel):
    name: str = Field(min_length=2, max_length=50)
    email: EmailStr
    department: str = Field(min_length=2, max_length=50)
    designation: str = Field(min_length=2, max_length=50)
    salary: float = Field(gt=0)
    is_active: bool = True