USE sakila;

#1 

SELECT first_name, last_name 
FROM actor 
GROUP BY last_name, first_name
HAVING count(last_name) = 1;

#2 Which last names appear more than once

SELECT first_name, last_name FROM actor 
GROUP BY last_name, first_name
HAVING count(*) > 1;


#3 Using the rental table, find out how many rentals were processed by each employee.

select staff_id, COUNT(rental_id)
from rental
group by staff_id;

#4 Using the film table, find out how many films were released each year

select release_year, count(*)
from film
group by release_year;

#5 find out for each rating how many films were there.

select rating, count(film_id)
from film
group by rating;

#6 What is the average length of films for each rating? Round off the average lengths to two decimal places.

select rating, round(avg(length),2)
from film
group by rating;

#7 Which kind of movies (based on rating) have an average duration of two hours or more


SELECT
	rating,
    ROUND(AVG(length), 2) AS avg_duration
FROM film
GROUP BY rating
HAVING avg_duration > 120
ORDER BY avg_duration DESC;
