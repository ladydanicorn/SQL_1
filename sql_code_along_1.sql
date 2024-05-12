--First query, we will select all the records from the actor table
select * from actor a ;

--Query for first_name and last_name in the actor table
select first_name, last_name
from actor a ;

--Query for a first_name that equals Nick using there WHERE clause
select FIRST_NAME, LAST_NAME
from actor a 
where first_name like 'Nick';

--Query for all first_name data that starts with a J and using LIKE and WHERE clauses and a wildcard
select first_name, actor_id
from actor a where first_name like 'J%';

--Query for all first_name data that starts with K and has 2 letter after the K again using like and where clauses and the underscore
select first_name, actor_id
from actor a where first_name like 'K__';

--Query for all first_name data that starts with a K and ends with th
--We will use the LIKE and WHERE clauses using both wildcard and the underscore
select first_name, last_name, actor_id
from actor a where first_name like 'K__%th';

-- Comparing operators
-- >, <, >=, <=, <>

-- Explore data with select all query so that we can change into a new table
	select * from payment p 	
	
--Query for data that shows customers who paid an amount GREATER THAN $2
	select customer_id, amount
	from payment p 
	where amount > 2.00;
	
--Query for data that shows customers who paid an amount less than 7.99
select customer_id, amount
from payment p 
where amount < 7.99;

--Query for less than or equal to 7.99
select customer_id, amount
FROM payment
where amount <= 7.99;

--Greater than or equal to 2
select customer_id, amount
FROM payment
where amount >= 2.00;

--Query for data that shows customers who paid an amount not equal to $0.00 ordered in DESCENDING order
select customer_id, amount
from payment p 
where amount <> 0.00
order by amount desc;

--SQL Aggregate Functions! Sum, avg, count, min, max
--Query to display the sum of amounts paid that are greater than 5.99
select sum(amount)
from payment
where amount > 5.99;

--Query to display the average of amount paid greater than 5.99
select AVG(amount)
from payment p 
where AMOUNT > 5.99;

--Query to display the count of amounts paid greater than 5.99
select count(amount) from payment where amount > 5.99;

--Query to display the count of DISTINCT amounts paid greater 5.99
select count(distinct amount)
from payment p 
where amount > 5.99;

--Query to display min amount greater than 7.99
select MIN(amount) as min_num_payments
from payment p 
where amount > 7.99;

--Query to display max amount greater than 7.99
select max(amount) as max_num_payments
from payment p 
where amount > 7.99;

--Demo of groupby
select amount
from payment p 
where amount = 7.99;

--Query to display different amounts grouped together
--and count the amount
select amount, count(amount)
from payment p 
group by amount order by amount;


--Query to display customer ids with the summed amounts for each customer id 
select customer_id, sum(amount)
from payment p 
group by customer_id 
order by customer_id desc;

--Homework!

--1. How many actors are there with the last name ‘Wahlberg’?
select last_name
from actor a where last_name like 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
select count(*) as num_payments
from payment p 
where amount >= 3.99 and amount <= 5.99;

--3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(*) AS inventory_count
FROM inventory
GROUP BY film_id
ORDER BY inventory_count DESC
LIMIT 1;

--4. How many customers have the last name ‘William’?
select count(*) as num_William
from customer c 
where last_name = 'William';

--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(*) AS rental_count
FROM rental r 
GROUP BY staff_id
ORDER BY rental_count DESC
LIMIT 1;

--6. How many different district names are there?
select COUNT(distinct district) as district_count
from address a ;

--7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(actor_id) as actor_count
from film_actor fa 
group by film_id
order by actor_count desc 
limit 1;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select COUNT(*) as last_name_es
from customer c 
where store_id = 1 and last_name like '%es';

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
select amount, COUNT(*) 
from payment p  
where customer_id between 380 and 430 
group BY amount
having COUNT(*) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
select count(distinct rating) as rating_num
from film;
select rating, count(*) as movie_ratings
from film f 
group by rating 
order by movie_ratings desc
limit 1;