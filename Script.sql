--Q1
select customer_id, first_name, last_name, address, district
from customer
join address
on customer.address_id = address.address_id
where district = 'Texas'

--Q2
select payment_id, amount, payment_date, payment.customer_id
from payment
join customer 
on payment.customer_id = customer.customer_id 
where amount > 6.99

--Q3
select first_name, last_name
from customer
where customer_id in (
select customer_id
from payment
group by customer_id 
having sum(amount) > 175

);

--Q4
select customer.customer_id, customer.first_name, customer.last_name, address, city
from customer
join address
on customer.address_id = address.address_id 
join city
on address.city_id = city.city_id
join country 
on city.country_id = country.country_id 
where country = 'Nepal';

--Q5
select *
from staff
where staff_id in(
	select staff_id 
	from payment
	group by staff_id 
	order by count(staff_id) desc 
	limit 1
);

--Q6
select rating, count(title)
from film
group by rating;

select category.category_id, category.name, count(film_category.film_id)
from category
join film_category
on category.category_id = film_category.category_id
group by category.category_id, category.name
order by count(film_category.film_id)

--Q7
select first_name, last_name
from customer
where customer_id in (
select customer_id
from payment
group by customer_id 
having sum(amount) > 6.99
);

--Q8
select count(*)
from payment 
where amount = 0;
