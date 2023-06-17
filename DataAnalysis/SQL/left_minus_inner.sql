/* 
 Rewrite the query to use joins
*/

USE test;

SELECT t1.*
FROM table1 t1
WHERE t1.id NOT IN (SELECT t2.id FROM table2 t2);

SELECT t1.*, t2.value
FROM table1 t1
LEFT JOIN table2 t2 ON t1.id = t2.id
WHERE t2.value IS NULL