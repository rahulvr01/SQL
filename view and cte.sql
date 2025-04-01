use dummy;

# rls - row level security 
create view new_view (select * from customers);
select * from customers;


create view fetch_customers as (select * from customers
where city in ("nantes","las vegas"));

select * from fetch_customers;


