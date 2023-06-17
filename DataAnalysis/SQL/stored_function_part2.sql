USE sakila;

-- set log permission
SET GLOBAL log_bin_trust_function_creators = 1;

-- change delimiter
delimiter //

-- create a stored function
CREATE FUNCTION RentalsCountbyCust(cust_id INT)
RETURNS INT
BEGIN
	DECLARE RentalsCount INT;
    
    SELECT COUNT(*) NoRentals
    INTO RentalsCount
    FROM rental
    WHERE customer_id = cust_id;
    
    RETURN(RentalsCount);
    
END //

-- default delimiter
delimiter ;

-- select stored function
SELECT first_name, last_name, RENTALSCOUNTBYCUST(customer_id)
FROM customer;

-- drop function
DROP FUNCTION RentalsCountbyCust;

-- set log permission
SET GLOBAL log_bin_trust_function_creators = 0;