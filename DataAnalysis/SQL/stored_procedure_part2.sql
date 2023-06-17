-- change delimiter
delimiter //

-- create a stored procedure
create procedure Whileloop()
begin
	declare i int default 1;
    while i < 6 do
		select pow(i,i);
        set i = i + 1;
	end while;
end //

-- default delimiter
delimiter ;

-- call stored procedure
call Whileloop();

-- drop procedure
drop procedure Whileloop;