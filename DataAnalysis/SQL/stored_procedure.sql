USE sakila;

SELECT * 
FROM sakila.language;

-- change delimiter
delimiter //

-- create a stored procedure
CREATE PROCEDURE GetLanguage()
BEGIN
	SELECT * FROM language;
END //

-- default delimiter
delimiter ;

-- call stored procedure
CALL GetLanguage();

-- drop procedure
DROP PROCEDURE GetLanguage;