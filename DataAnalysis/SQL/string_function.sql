-- ascii()
SELECT ASCII('a'), ASCII('A');

-- char()
SELECT CHAR(77, 121, 83, 81, 76);
SELECT CHAR(65);

-- length()
SELECT LENGTH('Sql Authorithy'), LENGTH('Sql Authorithy ');

-- concat()
SELECT CONCAT('Sql', 'Authori', 'thy');
SELECT CONCAT('Sql', NULL, 'thy');

-- lcase()
SELECT LCASE('SQLAUTHORITY'), LOWER('PlurALL');

-- ucase()
SELECT UCASE('sqlauthority'), UPPER('sqlauthority');

-- left()
SELECT LEFT('SQLAuthority', 4);

-- right()
SELECT RIGHT('SQLAuthority',3);

-- right trim
SELECT RTRIM('    SQLAuthority    '), LENGTH(RTRIM('    SQLAuthority    ')), LENGTH('    SQLAuthority    ');

-- left trim
SELECT LTRIM('    SQLAuthority    '), LENGTH(LTRIM('    SQLAuthority    ')), LENGTH('    SQLAuthority    ');

-- trim
SELECT TRIM('    SQLAuthority    '), LENGTH(TRIM('    SQLAuthority    ')), LENGTH('    SQLAuthority    ');

-- strcmp() compares strings: -1 is the first is smaller, 1 is the first is larger, 0 the same
SELECT STRCMP('SQLAuthority', 'SQLAuthority'),
	   STRCMP('MySQLAuthority', 'SQLAuthority'),
       STRCMP('SQLAuthority', 'MySQLAuthority');
       
-- reverse
SELECT REVERSE('MySQLAuthority');