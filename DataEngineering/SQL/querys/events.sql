USE sakila;

-- turn on
SET GLOBAL event_scheduler = ON;

-- create table
CREATE TABLE event_audit(
	id INT NOT NULL AUTO_INCREMENT,
    last_update TIMESTAMP,
    PRIMARY KEY (id)
);

-- change delimiter
delimiter //

-- create event
CREATE EVENT one_time_event
ON SCHEDULE AT NOW() + INTERVAL 1 MINUTE
DO BEGIN
  INSERT INTO event_audit(last_update)
  VALUES (NOW());
END //

-- default delimiter
delimiter ;

-- check table
SELECT *
FROM event_audit;

-- drop trigger
DROP EVENT one_time_event;
DROP TABLE event_audit;