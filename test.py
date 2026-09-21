#source .venv/bin/activate
for i in range(2):
    for j in range(3):
        print(i, j)
#uvicorn app.main:app --reload
#uvicorn main:app --reload