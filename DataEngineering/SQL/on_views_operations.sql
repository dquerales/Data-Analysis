USE sakila;

-- view
CREATE VIEW DML_OPS
AS
SELECT language_id, name, last_update
FROM sakila.language;

SELECT * 
FROM DML_OPS;

-- insert data
INSERT INTO DML_OPS (name, last_update)
VALUES ('Karen', NOW());

-- update data
UPDATE DML_OPS
SET name = 'Spanish'
WHERE name = 'Karen';

-- delete data
DELETE FROM DML_OPS
WHERE name = 'Karen';

DROP VIEW DML_OPS;