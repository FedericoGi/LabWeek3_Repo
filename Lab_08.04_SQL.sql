USE sakila;

#1 Using multiple JOIN() clauses display the store ID, city, and country of each store.

SELECT s.store_id, city.city, country.country FROM store s
JOIN address ON s.address_id = address.address_id 
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
#or 
select * FROM store s   
join address a   
on s.address_id = a.address_id
join city c       
on a.city_id = c.city_id
join country o
on c.country_id = o.country_id;
#OR
select s.store_id, c.city, country FROM store s 
join address a  
using  (address_id)
join city c 
using (city_id)
join country o
using (country_id);

#OR - Teacher

SELECT store_id, a.district, c.city, co.country FROM store s
JOIN address a 
on s.address_id = a.address_id
JOIN city c
ON a.city_id = c.city_id
JOIN country co
ON c.country_id = co.country_id;



#2 Display the total payment amount for each store

select SUM(amount),r.rental_id FROM payment p
join rental r ON p.rental_id = r.rental_id
group by r.rental_id;


SELECT d.A2, sum(l.amount) as totamountbor, round(AVG(l.amount)) as avgloan FROM loan l 
JOIN account a ON l.acccount_id = a.account_id
JOIN district d on a.district_id = d.A1
GROUP BY d.A2
ORDER BY avgloan DESC;

#3 What is the average film length per each category? 

select category.name, avg(length) from film 
join film_category using (film_id) 
join category using (category_id)
group by category.name
order by avg(length) desc;

#Which category of films are the longest?

select category.name, avg(length) from film 
join film_category using (film_id) 
join category using (category_id)
group by category.name
having avg(length) > (select avg(length) from film)
order by avg(length) desc;

#4 Display the most frequently rented movies in descending order.

SELECT f.title, COUNT(f.title) as rentals from film f 
JOIN (SELECT r.rental_id, i.film_id FROM rental r 
JOIN inventory i ON i.inventory_id = r.inventory_id) a ON a.film_id = f.film_id 
GROUP BY f.title 
ORDER BY rentals DESC;

#5 Display the top 5 categories with highest revenue (payment amount) in descending order.

SELECT
	name            AS category,
	SUM(amount)     AS `gross revenue`
FROM sakila.payment
	JOIN (sakila.rental
		JOIN (sakila.inventory
			JOIN (sakila.film_category
				JOIN sakila.category USING (category_id))
			USING (film_id))
		USING (inventory_id))
	USING (rental_id)
GROUP BY category_id
ORDER BY `gross revenue` DESC
LIMIT 5;

#OR

USE sakila
SELECT name AS category, SUM(amount) AS 'gross revenue' FROM payment 
JOIN rental 
ON rental.rental_id = payment.rental_id
JOIN inventory
ON rental.inventory_id = inventory.inventory_id
JOIN film_category
ON film_category.film_id = inventory.film_id
GROUP BY category_id
ORDER BY 'gross revenue' DESC
LIMIT 5;

#OR MARIAN

select name, amount, dense_rank() over (order by amount DESC) from payment
join rental using (rental_id)
join inventory using (inventory_id)
join film_category using (film_id)
join category using (category_id)
group by name
limit 5;
