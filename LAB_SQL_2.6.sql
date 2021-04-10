#1 Get the unique release years.

SELECT distinct(release_year)
FROM film;

#2 Get all films with ARMAGEDDON in the title.

SELECT title from film
WHERE title = "ARMAGEDDON";

# 3 Get all films which title ends with APOLLO

select *
from film
where title like "APOLLO";

# 4 Get 10 the longest films

select *
from film
order by length desc
limit 10;

# 5 How many films include Behind the Scenes content?

select count(special_features)
from film
where special_features like "Behind the Scenes";

# 6 Drop column picture from staff

select *
from staff

#7 

SELECT * FROM customer 
INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, last_update)
WHERE address_id = '79';
