-- data security

CREATE VIEW Data_secure AS
    SELECT 
        pt.payment_id,
        pt.rental_id,
        cust.first_name,
        cust.last_name,
        amount
    FROM
        payment pt
            INNER JOIN
        customer cust ON cust.customer_id = pt.customer_id
    WHERE
        payment_id > 100;

SELECT *
FROM data_secure;

SELECT payment_id, rental_id
FROM data_secure
WHERE payment_id > 200;

-- help to hide other data
SELECT payment_id, rental_id
FROM data_secure
WHERE payment_id = 10;

-- error
SELECT email
FROM data_secure
WHERE payment_id = 1;

DROP VIEW data_secure;