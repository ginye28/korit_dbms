-- 순서 중요! 참조하는 테이블부터 먼저 삭제
DROP TABLE IF EXISTS menus;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS restaurants;

CREATE TABLE restaurants (
    id               INT          PRIMARY KEY AUTO_INCREMENT,
    name             VARCHAR(50)  NOT NULL,
    category         VARCHAR(20)  NOT NULL,
    address          VARCHAR(100),
    rating           DECIMAL(2,1) DEFAULT 0.0,
    created_at       TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customers (
    id               INT          PRIMARY KEY AUTO_INCREMENT,
    name             VARCHAR(30)  NOT NULL,
    phone            VARCHAR(20)  UNIQUE NOT NULL,
    email            VARCHAR(100) UNIQUE,
    address          VARCHAR(100),
    joined_at        TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE menus (
    id               INT          PRIMARY KEY AUTO_INCREMENT,
    restaurant_id    INT          NOT NULL,
    menu_name        VARCHAR(50)  NOT NULL,
    price            INT          NOT NULL CHECK (price > 0),
    menu_description VARCHAR(200),
    is_available     BOOLEAN      DEFAULT TRUE
);

-- 기본 문법
-- ALTER TABLE 테이블명
--     ADD COLUMN 컬럼명 데이터타입 [제약조건];

-- 예제: restaurants에 최소주문금액 컬럼 추가
ALTER TABLE restaurants
    ADD COLUMN min_order_amount INT DEFAULT 0;
    
Desc restaurants;

-- 기본 문법
-- ALTER TABLE 테이블명
--     MODIFY COLUMN 컬럼명 새로운_데이터타입 [새로운_제약조건];

-- 예제: name 컬럼을 VARCHAR(30)에서 VARCHAR(50)으로 확장
ALTER TABLE customers
    MODIFY COLUMN name VARCHAR(50) NOT NULL;
    

-- 기본 문법 (MySQL 8.0 이상)
-- ALTER TABLE 테이블명
--     RENAME COLUMN 기존_컬럼명 TO 새_컬럼명;

-- 예제: description을 menu_description으로 변경
ALTER TABLE menus
    RENAME COLUMN menu_description TO description;
    
    
-- 기본 문법
-- ALTER TABLE 테이블명
--     DROP COLUMN 컬럼명;

-- 예제: 임시로 추가한 컬럼 제거
ALTER TABLE menus
    DROP COLUMN is_available;
    
Desc menus;

alter table menus
	add column spicy_level int default 0 check (spicy_level between 0 And 5);
    
desc menus;

insert into menus (spicy_level) values (8);

insert into menus (restaurant_id, menu_name, spicy_level, price) values
	(1, 'coke', 0, 4000),
    (2, 'pizza', 2, 23000),
    (3, 'ramen', 4, 11000);
    
desc menus;

select * from menus;

insert into menus (restaurant_id, menu_name, spicy_level, price) values
	(4, 'hmm', 6, 4000);
    
update menus set spicy_level = 0 where id = 4;

select * from menus;

select id, menu_name, price, spicy_level from menus where id in (1, 2, 3, 4);

alter table restaurants
	add column phone varchar(20) unique;
    
select * from restaurants;

DESC restaurants;

UPDATE restaurants SET phone = '051-111-1001' WHERE id = 1;

select * from restaurants;

insert into restaurants (name, category, phone) values
	('jhj', 'hmm', '051-111-1001'),
    ('jhh', 'meat', '051-111-1002');
    
select * from restaurants;

-- 추가 안 됨 
insert into restaurants (name, category, phone) values
	('jhi', 'pig', '051-111-1001');
select * from restaurants;

alter table menus
	(

