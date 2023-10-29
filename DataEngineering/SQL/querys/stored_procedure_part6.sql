-- change delimiter
delimiter //

-- drop if exist
DROP PROCEDURE IF EXISTS GetLanguage //

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