USE sakila;

-- create view
CREATE VIEW DML_OPS
AS
SELECT language_id, name, last_update
FROM language
WHERE last_update = '2006-02-15 05:02:19'
WITH CHECK OPTION;

-- insert data error
INSERT INTO dml_ops (name, last_update)
VALUES ('Hindi', NOW());

-- only insert data on check date 
INSERT INTO dml_ops (name, last_update)
VALUES ('Hindi', '2006-02-15 05:02:19');