-- 1번 가게: 부산명가갈비 (한식)
INSERT INTO menus (restaurant_id, menu_name, price, description) VALUES
(1, '갈비탕',     13000, '24시간 우려낸 진한 사골 베이스에 부드러운 갈비가 듬뿍'),
(1, '소갈비구이', 25000, '국내산 한우 소갈비를 숯불에 직접 구워드립니다'),
(1, '된장찌개',    9000, NULL);

-- 2번 가게: 해운대순대국 (한식)
INSERT INTO menus (restaurant_id, menu_name, price, description) VALUES
(2, '순대국밥',    9000, '매콤하고 구수한 부산식 순대국밥'),
(2, '내장탕',     10000, NULL),
(2, '수육정식',   14000, '보쌈수육 + 국밥 + 반찬 세트');

-- 3번 가게: 남포동비빔밥 (한식)
INSERT INTO menus (restaurant_id, menu_name, price, description) VALUES
(3, '돌솥비빔밥',  11000, '돌솥에 바삭하게 눌린 누룽지까지 즐길 수 있는 비빔밥'),
(3, '산채비빔밥',   9000, '각종 나물을 듬뿍 올린 건강한 비빔밥'),
(3, '육회비빔밥',  14000, NULL);

-- 4번 가게: 해운대통닭 (치킨)
INSERT INTO menus (restaurant_id, menu_name, price, description) VALUES
(4, '후라이드치킨', 18000, '바삭한 황금빛 후라이드, 1마리 기준'),
(4, '양념치킨',    19000, '달콤매콤한 양념 소스 치킨'),
(4, '반반치킨',    20000, '후라이드 반 + 양념 반 구성');

-- 5번 가게: 서면바삭치킨 (치킨)
INSERT INTO menus (restaurant_id, menu_name, price, description) VALUES
(5, '간장치킨',    19000, '달콤한 간장 소스로 버무린 인기 메뉴'),
(5, '파닭',        20000, NULL),
(5, '치킨무세트',   5000, '치킨 주문 시 추가 가능한 치킨무 세트');

-- 6번 가게: 광안리피자랩 (피자)
INSERT INTO menus (restaurant_id, menu_name, price, description) VALUES
(6, '마르게리따피자', 18000, '토마토소스, 모짜렐라, 바질의 정통 이탈리안'),
(6, '불고기피자',   20000, '국내산 불고기와 각종 야채가 올라간 인기 피자'),
(6, '고구마무스피자',19000, NULL);

-- 7번 가게: 사직피자하우스 (피자)
INSERT INTO menus (restaurant_id, menu_name, price, description) VALUES
(7, '콤비네이션피자', 22000, '페퍼로니, 피망, 올리브, 버섯이 가득'),
(7, '포테이토피자',  19000, '부드러운 크림소스 베이스의 감자 피자'),
(7, '치즈크러스트피자',23000, NULL);

-- 8번 가게: 연산동짬뽕왕 (중식)
INSERT INTO menus (restaurant_id, menu_name, price, description) VALUES
(8, '짬뽕',        11000, '불맛 가득한 얼큰한 해물짬뽕'),
(8, '짜장면',       9000, '춘장을 오래 볶아 깊은 풍미의 정통 짜장면'),
(8, '탕수육',      18000, '바삭한 튀김에 새콤달콤 소스, 부먹/찍먹 선택 가능');

-- 9번 가게: 서면차이나팰리스 (중식)
INSERT INTO menus (restaurant_id, menu_name, price, description) VALUES
(9, '마파두부',     12000, '얼얼하고 매콤한 사천식 마파두부'),
(9, '군만두',        8000, NULL),
(9, '볶음밥',       10000, '각종 재료를 넣어 센 불에 볶아낸 중화식 볶음밥');

-- 10번 가게: 광안리떡볶이집 (분식)
INSERT INTO menus (restaurant_id, menu_name, price, description) VALUES
(10, '국물떡볶이',   7000, '쌀떡과 어묵이 들어간 부드러운 국물 떡볶이'),
(10, '라볶이',       8000, '떡볶이 + 라면 사리의 환상 조합'),
(10, '분식세트',    12000, '떡볶이 + 순대 + 튀김 3종 세트');


insert into restaurants (name, category, address, rating) values
	('할매순대국', '한식', '부산시 동래구 온천동', 4.2), 
	('화덕피자헛', '피자', '부산시 수영구 광안동', 3.9), 
	('마늘치킨공화국', '치킨', '부산시 해운대구 좌동', 4.6);
    
select * from restaurants;

select * from menus;

select
	`name`,
    `address`,
    `rating`
from
	restaurants
where 
	category = '치킨';
    
    
select
	`menu_name`,
    `price`
from
	menus
where
	price between 10000 and 20000
order by
	price;
	
select
	`menu_name`,
    `price`
from
	menus
where
	menu_name like '%김치%';
    
select * from menus;
select * from restaurants;

select
	`name`,
    `category`,
    `rating`
from
	restaurants
order by
	rating desc
limit 5;


update 
	menus
set
	price = price * 1.1
where
	id = 1;
	

alter table menus
	add column is_available boolean default true;

select
	`id`,
    `menu_name`,
    `price`,
	`is_available`
from
	menus
where
	is_available = false;
	-- is_available = 0;  (false = 0)


delete
from
	menus
where
	is_available = false;

select
	`id`,
    `name`,
    `address`,
    `rating`
from
	restaurants
where
	address
like
	'%해운대%';

select * from menus;

select
	`id`,
    `menu_name`,
    `price`,
    `description`
from 
	menus
where
	description = null
order by
	menu_name desc, 
    price desc;
