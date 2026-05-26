-- window function
-- over() 함수  그룹함수(group by를 사용하지 않고 행의 그룹 데이터를 생성할 때 사용함.)
select
	count(*) over(partition by order_id),
	order_id
    restaurant_menu_id
from
	order_details;
    
-- row_number() over()
select
	*
from (
	select
	-- row, rank, dense_rank 사용
		row_number() over(
			partition by 
				restaurant_menu_id 
			order by 
				restaurant_menu_id) as row_num,
		oddt.*
	from
		order_details oddt) oddt2
where
	oddt2.row_num = 1;