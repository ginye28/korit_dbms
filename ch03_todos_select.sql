select
	ctgr.id
	count(*) as total_count,
    count(if(todos.is_completed = 0, 1, null)) as not_completed_count
from
	categories ctgr
    left join todos  on todos.category_id = ctgr.id
where
	ctgr.user_id = #{userId}
group by
	ctgr.id
order by
	ctgr.id;