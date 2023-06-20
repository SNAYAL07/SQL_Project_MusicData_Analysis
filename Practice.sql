select * from employee
order by levels desc
limit 1


select count(*) as No_of_Invoices, billing_country 
from invoice
group by billing_country
order by No_of_Invoices desc


select billing_country,total from invoice
group by billing_country,total
order by total desc
limit 3


select sum(total) as invoice_total,billing_city 
from invoice
group by billing_city
order by invoice_total desc


select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1


select distinct first_name, last_name, email from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (
	select track_id from track
	join genre on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
)
order by email


select name,milliseconds from track
where milliseconds > (select avg(milliseconds) as avg_track_length from track)
order by milliseconds desc

select * from customer

