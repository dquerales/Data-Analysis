-- sub queries
USE sakila;

/*
Statement: Find costumers who like to watch action movies
*/ 
SELECT cust.customer_id, cust.first_name, cust.last_name
FROM customer cust
WHERE cust.customer_id IN (
-- 5. figure out  what costumers have the movies
SELECT ren.customer_id
FROM rental ren
WHERE ren.inventory_id IN (
-- 4. check in the inventory
SELECT inv.inventory_id
FROM inventory inv
WHERE inv.film_id IN (
-- 3. what are those movies, have to show the same ids
SELECT fl.film_id
FROM film fl
WHERE fl.film_id IN (
-- 2.  what are all the action movies ids
SELECT fc.film_id
FROM film_category fc
WHERE fc.category_id IN (
-- 1. what is the id of action
SELECT cat.category_id
FROM category cat
WHERE cat.name = 'Action')))))
ORDER BY cust.customer_id, cust.first_name, cust.last_name;

-- do the same exercise using joins
SELECT DISTINCT cust.customer_id, cust.first_name, cust.last_name
FROM customer cust
INNER JOIN rental ren ON ren.customer_id = cust.customer_id
INNER JOIN inventory inv ON inv.inventory_id = ren.inventory_id
INNER JOIN film fl ON fl.film_id = inv.film_id
INNER JOIN film_category fc ON fc.film_id = fl.film_id
INNER JOIN category cat ON cat.category_id = fc.category_id WHERE cat.name = 'Action'
ORDER BY cust.customer_id, cust.first_name, cust.last_name;