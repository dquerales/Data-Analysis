USE test;

-- union all
SELECT t1.id AS T1ID,  t1.value AS T1Value
FROM table1 AS t1
UNION ALL
SELECT t2.id AS T2ID, t2.value AS T2Value
FROM table2 AS t2;

-- union 
SELECT t1.id AS T1ID,  t1.value AS T1Value
FROM table1 AS t1
UNION 
SELECT t2.id AS T2ID, t2.value AS T2Value
FROM table2 AS t2;

-- union order by
SELECT t1.id AS T1ID,  t1.value AS T1Value
FROM table1 AS t1
UNION ALL
SELECT t2.id AS T2ID, t2.value AS T2Value
FROM table2 AS t2
ORDER BY t1Value DESC;

-- full outer join in MySQL
SELECT t1.id AS T1ID, t1.Value AS T1Value,
	   t2.id AS T1ID, t2.Value AS T2Value
FROM table1 AS t1
LEFT JOIN table2 AS t2 ON t1.id = t2.id
UNION
SELECT t1.id AS T1ID, t1.Value AS T1Value,
	   t2.id AS T1ID, t2.Value AS T2Value
FROM table1 AS t1
RIGHT JOIN table2 AS t2 ON t1.id = t2.id;

