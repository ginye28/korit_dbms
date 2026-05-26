-- CTE(Common table expression)
-- 서브쿼리 가독성 및 재사용성을 높이기 위해 사용되는 임시 결과 집합(가상테이블)
-- with 예약어 사용

select
	*
from
	orders odrs
	left join (
    select 
		order_id, 
		sum(price)
    from
		order_details oddt2
        left join restaurant_menus rtmn on rtmn.id = oddt2.restaurant_menu_id
group by
	oddt2.order_id) ttpr on ttpr.order_id = odrs.id;

-- cte 사용

with cte_total_price as (
	select 
		order_id, 
		sum(price)
	from
		order_details oddt2
		left join restaurant_menus rtmn on rtmn.id = oddt2.restaurant_menu_id
	group by
		oddt2.order_id
)

select
	*
from
	orders odrs
	left join cte_total_price ttpr on ttpr.order_id = odrs.id;
    
    
