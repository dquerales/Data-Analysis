# FastApi

*This is an example to deploy a model using FastApi*

## Installation
1. Install requirments
```
pip install -r "requirements.txt"
```
2. Run FastApi local host
```
python -m uvicorn api:app --reload
```

## Usage

Request
```  
{
    "YearsAtCompany":1, 
    "EmployeeSatisfaction":0.01,
    "Position":"Non-Manager",
    "Salary":1000
}
```
Prediction
```  
{
    "prediction":1, 
}
```

# Contact

Daniel Querales - d.querales@gmail.com

