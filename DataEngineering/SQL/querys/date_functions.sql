-- add date
SELECT 
    ADDDATE('2013-01-01', INTERVAL 45 DAY),
    DATE_ADD('2013-01-01', INTERVAL 45 DAY);

-- sub date
SELECT SUBDATE('2013-01-01', INTERVAL 45 DAY), DATE_SUB('2013-01-01', INTERVAL 45 DAY);

-- current date
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE;

-- current time
SELECT CURTIME(), CURRENT_TIME(), CURRENT_TIME;

-- now()
SELECT NOW(),
	   DATE(NOW()),
       TIME(NOW()),
       YEAR(NOW()),
       QUARTER(NOW()),
       MONTH(NOW()),
       WEEK(NOW()),
       DAY(NOW()),
       DAYNAME(NOW()),
       HOUR(NOW()),
       MINUTE(NOW()),
       SECOND(NOW());
       
-- format
SELECT DATE_FORMAT(NOW(), '%w, %y, %m, %d')
