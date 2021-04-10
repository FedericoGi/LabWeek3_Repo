USE sakila;

#1 Select all the actors with the first name ‘Scarlett’.
SELECT * 
FROM actor
WHERE first_name = 'Scarlett';

#2 How many films (movies) are available for rent and how many films have been rented?
SELECT count(film_id)
FROM inventory; 


SELECT count(rental_id)
FROM rental;

#3 What are the shortest and longest movie duration? 
#Return the results as columns with the names  max_duration and min_duration.
SELECT title,length as max_duration
FROM film 
ORDER BY length DESC;

SELECT title,length as min_duration
FROM film 
ORDER BY length ASC;

#4 What's the average movie duration expressed in format (hours, minutes) 
#Return the result as columns with the names hours and minutes?
SELECT AVG(length) as hours_minutes
from film;

SELECT
floor(AVG(length)/60) as hours,
floor(AVG(length)%60) as min
FROM film; 

#5 How many distinct (different) actors' last names are there?
SELECT count(distinct last_name)
FROM actor;

SELECT count(distinct last_name)
FROM actor;

#6 Since how many days has the company been operating (check the DATEDIFF() function)? 
#Hint: rental table
SELECT DATEDIFF(rental_date, return_date) as operating 
FROM rental;

select DATEDIFF(CURDATE(), rental_date) as days_open
from rental;

SELECT DATEDIFF(MAX(rental_date),MIN(rental_date)) as diff 
FROM rental;

#7 Show all rental information with additional columns month and weekday. (hint: DATE_FORMAT() ). 
#Get 20 results.

SELECT *,
date_format(convert(rental_date,datetime) , "%M") as month,
date_format(convert(rental_date,datetime) , "%a") as day
from rental
limit 20;


#SELECT *,
#month(rental_date) as month,
#weekday(rental_date) as weekday
#FROM rental;

#8 Add an additional column day_type with values 'weekend' and 'workday' 
#depending on the rental day of the week.

SELECT *, 
CASE 
  WHEN date_format(convert(rental_date,datetime) , "%W")='Sunday' OR 'Saturday' then 'weekend'  
  ELSE 'workday'  
  END AS day_type
FROM rental;

#9 How many rentals were made in the last month of renting activity?

SELECT year(max(rental_date)), month(max(rental_date)) as lastrent 
FROM rental;