-- change delimiter
delimiter //

-- create a stored procedure
CREATE PROCEDURE ConcatName(FirstName VARCHAR(100), LastName VARCHAR(100))
BEGIN
    DECLARE FullName VARCHAR(200);
	SET FullName = CONCAT(FirstName, ' ', LastName);
SELECT FullName;
END //

-- default delimiter
delimiter ;

-- call stored procedure
CALL ConcatName('John', 'Doe');

-- drop procedure
DROP PROCEDURE ConcatName;