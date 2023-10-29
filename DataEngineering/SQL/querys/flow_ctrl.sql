-- use case
SET @var = 3; -- constant

SELECT CASE @var
		    WHEN 1 THEN 'one'
            WHEN 2 THEN 'two'
		ELSE 'more' END AS result;

SELECT CASE WHEN @var = 1 THEN 'one'
            WHEN @var = 2 THEN 'two'
            ELSE 'more' END AS result;
            
-- if
SELECT IF (1>2,2,3);
SELECT IF (1 < 2, 'yes', 'no');
SELECT IF (YEAR(NOW()) = 2021, 'yes', 'no');

-- if null
SELECT IFNULL(1, 0);
SELECT IFNULL(NULL, 0);
SELECT 1/0;
SELECT IFNULL(1/0, 'yes');

-- null if
SELECT NULLIF(1,1);
SELECT NULLIF(1,2);
