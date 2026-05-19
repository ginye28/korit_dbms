desc menus;

select * from menus;

insert into menus (id, restaurant_id, menu_name, price, description, spicy_level) values
	(default, 4, '김밥', 4000, '일반김밥', 0);

insert into menus (id, menu_name, restaurant_id, description, spicy_level, price) values
	(default, '참치김밥', 5, '참치 들어간 김밥', 1, 4000);

insert into menus values
	(null, 6, '김치김밥', 5000, '김치 들어간 김밥', 4);
    
insert into menus (restaurant_id, menu_name, price) values
	(7, '우동', 8000);
    
-- << 다건 삽입 >>

insert into menus values
	(null, 2, '클래식 피자', 19000, null, 0),
    (null, 2, '페퍼로니 피자', 24000, null, 2),
    (null, 2, '불고기 피자', 25000, null, 1),
    (null, 2, '치즈 피자', 25000, null, 0);