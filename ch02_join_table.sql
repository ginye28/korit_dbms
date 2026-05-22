-- 크로스 조인
select * from customers join customer_addresses;


-- 이너 조인(이너 생략 가능)
select * from customers inner join customer_addresses on customer_id = customers.id;

-- 잘 안 씀
select * from customers right join customer_addresses on customer_id = customers.id;

-- left join == left outer join
select * from customers left join customer_addresses on customer_id = customers.id;

select 
	* 
from 
	customer_addresses cadd         -- 프라이머리 키가 앞으로 가야함
	left outer join customers cust on cust.id = cadd.customer_id;
    
select 
	* 
from 
	customers cust       						 -- 프라이머리 키가 앞으로 가야함
	inner join customer_addresses cadd on cadd.customer_id = cust.id and cadd.address like '%남구%';

show tables;

select
	rest.id,
    rest.name,
    round(avg(rmnu.price))
from
	orders ordr
    left join order_details odet on odet.order_id = ordr.id
    left join restaurant_menus rmnu on rmnu.id = odet.restaurant_menu_id
    left join restaurants rest on rest.id = rmnu.restaurant_id
    left join menus menu on menu.id = rmnu.menu_id
where
	rest.address like '%동래구%'
group by
	rest.id,
    rest.name