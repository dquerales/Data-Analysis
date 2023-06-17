-- rand
SELECT RAND() AS RandomValue;
SELECT LEFT(CEILING(RAND()*10), 1) AS RandomValue;

-- sleep
SELECT NOW();
SELECT SLEEP(5); -- delay
SELECT NOW();

-- uuid
SELECT UUID();