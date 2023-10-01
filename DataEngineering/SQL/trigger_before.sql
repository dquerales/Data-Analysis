USE sakila;

SELECT *
FROM language;

-- change delimiter
delimiter //

-- create a trigger
CREATE TRIGGER Language_before_insert
BEFORE INSERT ON language
FOR EACH ROW
BEGIN
   SET new.name = CONCAT(UPPER(SUBSTRING(new.name,1,1)),
						LOWER(SUBSTRING(new.name FROM 2)));
END //

-- default delimiter
delimiter ;

-- insert
INSERT INTO language(name)
VALUES ("spanish");
INSERT INTO language(name)
VALUES ("english");

-- check table
SELECT *
FROM language;

-- drop trigger
DROP TRIGGER Language_before_insert;