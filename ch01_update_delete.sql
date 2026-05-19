-- << 삭제 >>
delete from menus 
where id = 10 and menu_name = '불고기 피자'; -- 대입X, set에선 대입

-- where은 그 위치의 행을 지움
delete 
from 
	menus 
where 
	restaurant_id = 2 
and 
	menu_name = '치즈 피자';

select * from menus;

-- << 수정 >>
-- insert, update는 from 없음
update menus set description = '오시이이 라멘' where id = 3;
-- description의 내용을 지울 땐 null값을 넣어줌
update menus set description = null where id = 3;

update 
	menus 
set 
	description = '오이시이 라멘', 
	price = 12000 
where 
	id = 3;
