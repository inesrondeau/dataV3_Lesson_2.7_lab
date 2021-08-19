USE sakila;
-- 1
SELECT sakila.c.name, COUNT(sakila.fc.film_id) as 'number of films'
FROM sakila.film_category fc
JOIN sakila.category c
ON sakila.fc.category_id=sakila.c.category_id
GROUP BY sakila.c.name;
-- 2
SELECT sakila.s.first_name, sakila.s.last_name, COUNT(sakila.r.rental_id) as 'total amount'
FROM sakila.rental r
JOIN sakila.staff s
ON r.staff_id=s.staff_id
WHERE sakila.r.rental_date LIKE '2005-08%'
GROUP BY sakila.s.first_name, sakila.s.last_name;
-- 2
SELECT sakila.a.first_name, sakila.a.last_name, COUNT(sakila.f.film_id) as 'number of films'
FROM sakila.actor a
JOIN sakila.film_actor f
ON sakila.a.actor_id=sakila.f.actor_id
GROUP BY sakila.a.first_name, sakila.a.last_name
ORDER BY COUNT(sakila.f.film_id) DESC
LIMIT 1;
-- 4
SELECT sakila.c.first_name, sakila.c.last_name, COUNT(sakila.r.rental_id) as 'number of rentals'
FROM sakila.rental r
JOIN sakila.customer c
ON sakila.r.customer_id=sakila.c.customer_id
ORDER BY COUNT(sakila.r.rental_id) DESC
LIMIT 1;
-- 5
SELECT sakila.s.first_name, sakila.s.last_name, sakila.a.address
FROM sakila.staff s
JOIN sakila.address a
ON sakila.s.address_id=sakila.a.address_id;
-- 6
SELECT sakila.f.title, COUNT(DISTINCT sakila.fa.actor_id) as 'number of actors'
FROM sakila.film f
JOIN sakila.film_actor fa
ON sakila.f.film_id=sakila.fa.film_id
GROUP BY sakila.f.film_id;
-- 7
SELECT sakila.c.last_name, sakila.c.first_name, SUM(amount) as 'total paid'
FROM sakila.customer c
JOIN sakila.payment p
USING (customer_id)
GROUP BY sakila.c.last_name, sakila.c.first_name
ORDER BY sakila.c.last_name ASC;
-- 8
SELECT sakila.c.name, COUNT(film_id) as 'number of films'
FROM sakila.category c
JOIN sakila.film_category fc
ON sakila.c.category_id=sakila.fc.category_id
GROUP BY sakila.c.category_id;
