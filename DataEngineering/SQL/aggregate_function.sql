USE sakila;

-- number of rentals, count()
SELECT COUNT(*) NoRentals, customer_id
FROM rental
GROUP BY customer_id; -- is needed when in the select clause there is a non-aggregate function

-- latest rental, max()
SELECT MAX(rental_date) LastRental, customer_id
FROM rental
GROUP BY customer_id;

-- first time rental, min()
SELECT MIN(rental_date) FirstRental, customer_id
FROM rental
GROUP BY customer_id;

-- summary query
SELECT AVG(amount) AS AvgPay, SUM(amount) AS TotalPay, COUNT(rental_id) AS TotalRentals, customer_id
FROM payment
GROUP BY customer_id;

