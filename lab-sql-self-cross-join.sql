use sakila;

-- Get all pairs of actors that worked together.
select a1.actor_id, a1.film_id, a2.actor_id from film_actor a1
join film_actor a2
on a1.film_id = a2.film_id
and a1.actor_id > a2.actor_id;

-- Get all pairs of customers that have rented the same film more than 3 times.
select c1.customer_id, c1.inventory_id, c1.rentals, c2.customer_id, c2.inventory_id, c2.rentals  
from (select customer_id, inventory_id, count(rental_id) as rentals from rental
group by customer_id, inventory_id
having count(rental_id) >= 1) c1
join (select customer_id, inventory_id, count(rental_id) as rentals from rental
group by customer_id, inventory_id
having count(rental_id) >= 1) c2
on c1.inventory_id = c2.inventory_id
and c1.customer_id > c2.customer_id; 

-- Get all possible pairs of actors and films.
select * from (
select distinct actor_id from film_actor) sub1
cross join (
select distinct film_id from film_actor) sub2;