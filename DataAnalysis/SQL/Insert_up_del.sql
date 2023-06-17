USE sakila;

CREATE TABLE ActorSample (
	actor_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
		ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (actor_id)
);

INSERT INTO sakila.actorsample (first_name, last_name, last_update)
	VALUES ("John", "Doe", '21-04-21');

SELECT *
FROM actorsample;

INSERT INTO sakila.actorsample
VALUES(DEFAULT, 'Neo', 'Smith', '2021-04-16');

INSERT INTO sakila.actorsample (first_name, last_name)
VALUES('Daniel', 'Querales');

INSERT INTO sakila.actorsample (first_name)
VALUES('Xiomara');

INSERT INTO sakila.actorsample (first_name, last_name)
	VALUES ("Sebastian", "Vidal"),
		   ("Hugo", "Vargas"),
           ("Keith", "Varela");
           
INSERT INTO sakila.actorsample (first_name, last_name, last_update)
	SELECT first_name, last_name, last_update
    FROM actor
    WHERE first_name = 'Neo';

INSERT INTO sakila.actorsample (first_name, last_name, last_update)
	SELECT first_name, last_name, last_update
    FROM actor;

SELECT *
FROM actorsample;

UPDATE sakila.actorsample
SET first_name = 'Dan'
WHERE actor_id = 1;

UPDATE sakila.actorsample
SET last_name = 'Sets'
WHERE actor_id = 1;

UPDATE sakila.actorsample
SET first_name = 'Daniel', last_name = 'Queralt'
WHERE actor_id = 2;

UPDATE sakila.actorsample
SET first_name = 'Daniel', last_name = 'Querales'
WHERE actor_id IN (3, 4, 5);

UPDATE sakila.actorsample
SET first_name = 'Neo'
WHERE actor_id IN (SELECT actor_id FROM film_actor WHERE film_id = 1);

DELETE
FROM sakila.actorsample
WHERE actor_id = 1;

DELETE
FROM sakila.actorsample
WHERE actor_id IN (3, 4, 5);

DELETE
FROM sakila.actorsample
WHERE actor_id IN (SELECT actor_id FROM film_actor WHERE film_id = 1);

DROP TABLE actorsample;
