-- 1. List all customers who live in Texas (use JOINs)
-- Answer = 5 people: Jen, Kim, Rich, Bryan, and Ian
SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
WHERE district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
-- Answer = 3661 payements
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)
-- Answer = 135 people
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);


-- 4. List all customers that live in Nepal (use the city table)
-- Answer = 1 person Kevin
SELECT first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';


-- 5. Which staff member had the most transactions?
-- Answer = Jon with 181218873 transactions
SELECT first_name, last_name, SUM(payment_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id;


-- 6. How many movies of each rating are there?
-- Answer = G;178 PG;194 PG13;223 R;196 NC17;209
SELECT DISTINCT rating, COUNT(rating)
FROM film
GROUP BY rating;


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
-- Answer 597 people
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
);
-- Could not get this to work without an agregation on HAVING amount > 6.99


-- 8. How many free rentals did our stores give away?
-- Answer 0 free rentals
SELECT amount
FROM payment
INNER JOIN rental
ON payment.rental_id = rental.rental_id
WHERE amount < 1;