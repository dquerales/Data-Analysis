USE sakila;

SELECT *
FROM actor;

-- views
CREATE VIEW Vw_AllActor
AS
SELECT *
FROM actor;

-- is like a virtual table
SELECT *
FROM Vw_allactor;

SELECT *
FROM vw_allactor
WHERE first_name LIKE 'A%';

-- view
CREATE VIEW vw_actorA
AS
SELECT *
FROM actor
WHERE first_name LIKE 'A%';

SELECT *
FROM vw_actorA;

SELECT *
FROM vw_actorA
WHERE last_name LIKE '%A%';

-- view
CREATE VIEW vw_actorA_A
AS
SELECT *
FROM vw_actorA
WHERE last_name LIKE '%A%';

SELECT *
FROM vw_actorA_A
ORDER BY last_name;

-- drop views
DROP VIEW vw_actorA_A;
DROP VIEW vw_actorA;
DROP VIEW Vw_AllActor;
