from fastapi import FastAPI,  HTTPException
#from fastapi.responses import JSONResponse

from schemas.employees import EmployeeCreate, EmployeeResponse, EmployeeUpdate
app = FastAPI()

#emp_db=[]
emp_db: list[dict] = []
seq_id =0

'''def generate_id():
    global seq_id
    seq_id += 1
    return seq_id 
    i can use this also insted of mannual seq id generation i can generate it by a function
    '''



@app.post(
    "/employees",
    response_model=EmployeeResponse,
    status_code=201
)
def create_emp(employee: EmployeeCreate):

    global seq_id
    seq_id += 1
    emp = employee.model_dump()
    emp["id"] = seq_id
    emp_db.append(emp)
    return emp



@app.get("/employees", response_model=list[EmployeeResponse])
def getall_emp():
    return emp_db

@app.get("/employees/{emp_id}", response_model=EmployeeResponse)
def get(emp_id:int):
    for emp in emp_db:
        if emp["id"]==emp_id:
            return emp
    raise HTTPException(status_code=404, detail="Employee not found")


@app.put("/employees/{emp_id}", response_model=EmployeeResponse, status_code=200)
def update_emp(emp_id: int, employee: EmployeeUpdate):
    for emp in emp_db:
        if emp["id"]==emp_id:
            new_data=employee.model_dump()
            emp.update(new_data)
            return emp
            
    raise HTTPException(status_code=404  ,detail="employee not found")



@app.delete("/employees/{emp_id}",status_code=204)
def delete_emp(emp_id:int):
    for emp in emp_db:
        if emp["id"]==emp_id:
            emp_db.remove(emp)
            return 
    raise HTTPException(status_code=404, detail="employee not found")