USE sakila;

SELECT *
FROM language;

-- change delimiter
delimiter //

-- create a stored procedure
CREATE PROCEDURE InsertValue(
IN name_lang VARCHAR(100),
OUT lang_id INT)
BEGIN
   INSERT INTO language(name, last_update)
   VALUES (name_lang, NOW());
   SET lang_id = LAST_INSERT_ID();
END //

-- default delimiter
delimiter ;

-- call stored procedure
CALL InsertValue('Gujarati', @lang_id);
SELECT CONCAT('Last Language Id is', ' ', @lang_id);

SELECT *
FROM language;

-- drop procedure
DROP PROCEDURE InsertValue;