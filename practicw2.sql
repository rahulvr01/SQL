use dummy;
select customername,count(ordernumber) as orders_s
from customers inner join orders using (customernumber)
group by customername having orders_s <=3
order by orders_s desc limit 5;

select customername,count(ordernumber) as orders_s
from customers left join orders using (customernumber)
group by customername having orders_s =0
order by orders_s; 

select customername,customernumber
from customers left join orders using (customernumber)
where ordernumber is null;


