USE sakila;

-- set log permission
SET GLOBAL log_bin_trust_function_creators = 1;

-- change delimiter
delimiter //

-- create a stored function
CREATE FUNCTION GetLang(lang_id INT)
RETURNS VARCHAR(100)
BEGIN
	DECLARE LangName VARCHAR(100);
    
    SELECT name
    INTO LangName
    FROM language
    WHERE language_id = lang_id;
    RETURN(LangName);
    
END //

-- default delimiter
delimiter ;

-- call stored function
SELECT GETLANG(1);
SELECT GETLANG(2);
SELECT GETLANG(3);
SELECT GETLANG(4);

SELECT title, language_id, GETLANG(language_id)
FROM film;

-- drop procedure
DROP FUNCTION GetLang;

-- set log permission
SET GLOBAL log_bin_trust_function_creators = 0;