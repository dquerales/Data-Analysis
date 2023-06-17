USE test;

-- create table
CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT
);

-- insert data
INSERT INTO employee
SELECT 1, 'Mike', 3
UNION ALL
SELECT 2, 'David', 3
UNION ALL
SELECT 3, 'Roger', NULL
UNION ALL
SELECT 4, 'Marry', 2
UNION ALL
SELECT 5, 'Joseph', 2
UNION ALL
SELECT 7, 'Ben', 2;

-- check data
SELECT *
FROM employee;

-- self join
SELECT e1.Name AS EmployeeName, e2.name AS ManagerName
FROM employee e1
INNER JOIN employee e2
ON e1.ManagerID = e2.EmployeeId;

-- self outer
SELECT e1.Name AS EmployeeName, IFNULL(e2.name, 'Top Manager') AS ManagerName
FROM employee e1
LEFT JOIN employee e2
ON e1.ManagerID = e2.EmployeeId;

-- inner join
SELECT t1.ID AS T1ID, t1.Value AS T1Value,
	   t2.ID AS T2ID, t2.value AS T2Value
FROM table1 AS t1
INNER JOIN table2 AS t2
ON t1.id = t2.id;

-- natural join
SELECT t1.ID AS T1ID, t1.Value AS T1Value,
	   t2.ID AS T2ID, t2.value AS T2Value
FROM table1 AS t1
NATURAL JOIN table2 AS t2;

-- left join
SELECT t1.ID AS T1ID, t1.Value AS T1Value,
	   t2.ID AS T2ID, t2.value AS T2Value
FROM table1 AS t1
LEFT JOIN table2 AS t2
ON t1.id = t2.id;

-- natural left join
SELECT t1.ID AS T1ID, t1.Value AS T1Value,
	   t2.ID AS T2ID, t2.value AS T2Value
FROM table1 AS t1
NATURAL LEFT JOIN table2 AS t2;

-- using keyword
SELECT t1.ID AS T1ID, t1.Value AS T1Value,
	   t2.ID AS T2ID, t2.value AS T2Value
FROM table1 AS t1
INNER JOIN table2 AS t2 USING(id);

-- inner join and
SELECT t1.ID AS T1ID, t1.Value AS T1Value,
	   t2.ID AS T2ID, t2.value AS T2Value
FROM table1 AS t1
INNER JOIN table2 AS t2
ON t1.id = t2.id AND t1.Value = t2.value;

-- using keyword two parameters
SELECT t1.ID AS T1ID, t1.Value AS T1Value,
	   t2.ID AS T2ID, t2.value AS T2Value
FROM table1 AS t1
INNER JOIN table2 AS t2 USING(id, value); 



