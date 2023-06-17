-- select schema
USE test;

-- create table 1
CREATE TABLE table1 (
	id INT, value VARCHAR(10)
);

-- insert data
INSERT INTO table1 (id, value)
	VALUES (1, "first"),
		   (2, "second"),
           (3, "third"),
           (4, "fourth"),
           (5, "fifth");

-- check table
SELECT *
FROM table1;

-- create table2
CREATE TABLE table2 (
	id INT, value VARCHAR(10)
);

-- insert data
INSERT INTO table2 (id, value)
SELECT 1, 'first'
UNION ALL
SELECT 2, 'second'
UNION ALL
SELECT 3, 'third'
UNION ALL
SELECT 6, 'sixth'
UNION ALL
SELECT 7, 'seventh'
UNION ALL
SELECT 8, 'eight';

-- check table2
SELECT *
FROM table2;

-- inner join (intersection)
SELECT t1.*,t2.*
FROM table1 t1
INNER JOIN table2 t2 ON t1.id = t2.id;

-- another example
SELECT t1.id AS T1Id, t1.value AS T1Value,
	   t2.id AS T2Id, t2.value AS T2Value
FROM table1 t1
INNER JOIN table2 t2 ON t1.id = t2.id;

-- left outer join (all the left side results) (left outer join = left join) includes null
SELECT t1.id AS T1Id, t1.value AS T1Value,
	   t2.id AS T2Id, t2.value AS T2Value
FROM table1 t1
LEFT JOIN table2 t2 ON t1.id = t2.id;

-- right outer join (all the right side results) (right outer join = right join) includes null
SELECT t1.id AS T1Id, t1.value AS T1Value,
	   t2.id AS T2Id, t2.value AS T2Value
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.id = t2.id;

-- full outer join (dont exist in MySQL) (union)
SELECT t1.id AS T1Id, t1.value AS T1Value,
	   t2.id AS T2Id, t2.value AS T2Value
FROM table1 t1
LEFT JOIN table2 t2 ON t1.id = t2.id
UNION 
SELECT t1.id AS T1Id, t1.value AS T1Value,
	   t2.id AS T2Id, t2.value AS T2Value
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.id = t2.id;

-- cross join (multiply rows)
SELECT t1.id AS T1Id, t1.value AS T1Value,
	   t2.id AS T2Id, t2.value AS T2Value
FROM table1 t1
CROSS JOIN table2 t2;