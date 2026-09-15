from pydantic import BaseModel


class EmployeeCreate(BaseModel):
    name: str


class EmployeeResponse(BaseModel):
    id: int
    name: str

    model_config = {
        "from_attributes": True
    }