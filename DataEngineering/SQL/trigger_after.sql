USE sakila;

-- create table
CREATE TABLE Audit_language(
		language_id TINYINT(3), 
        name CHAR(20),
        last_update TIMESTAMP,
        rowValue CHAR(20)
);

-- change delimiter
delimiter //

-- create a trigger
CREATE TRIGGER Language_after_update
AFTER UPDATE ON language
FOR EACH ROW
BEGIN
   INSERT INTO Audit_language(language_id, name, last_update, rowValue)
   VALUES(old.language_id, old.name, old.last_update, 'before update'); 
   
   INSERT INTO Audit_language(language_id, name, last_update, rowValue)
   VALUES(new.language_id, new.name, new.last_update, 'after update'); 
END //

-- default delimiter
delimiter ;

-- insert
INSERT INTO language(name)
	VALUES('spanish');
    
-- update
UPDATE language
SET name = "spanish ew"
WHERE language_id = 15;

-- check table
SELECT *
FROM language;

-- check audit_table
SELECT *
FROM Audit_language;

-- drop trigger
DROP TRIGGER Language_after_update;
DROP TABLE Audit_language;