USE sakila;

SELECT *
FROM language;

-- change delimiter
delimiter //

-- create a stored procedure
CREATE PROCEDURE InsertValue(name_lang VARCHAR(100))
BEGIN
   INSERT INTO language(name, last_update)
   VALUES (name_lang, NOW());
   SELECT LAST_INSERT_ID();
END //

-- default delimiter
delimiter ;

-- call stored procedure
CALL InsertValue('Gujarati');

-- drop procedure
DROP PROCEDURE InsertValue;