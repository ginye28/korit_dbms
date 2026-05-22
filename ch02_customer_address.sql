CREATE TABLE order_details_raw (
    order_id          INT,
    customer_id       INT,
    customer_name     VARCHAR(50),
    restaurant_id     INT,
    restaurant_name   VARCHAR(100),
    restaurant_category VARCHAR(50),
    menu_name         VARCHAR(100),
    quantity          INT
) COMMENT '비정규형 — 삽입/갱신/삭제 이상 현상 학습용';
 
INSERT INTO order_details_raw VALUES
(1, 1, '김민준', 1, '부산치킨',   '치킨', '후라이드',  2),
(2, 1, '김민준', 2, '해운대짜장', '중식', '짜장면',    1),
(3, 2, '이수진', 1, '부산치킨',   '치킨', '양념치킨',  1),
(4, 3, '박지호', 3, '광안리버거', '버거', '불고기버거', 1),
(5, 2, '이수진', 3, '광안리버거', '버거', '치즈버거',  2),
(6, 4, '최유나', 2, '해운대짜장', '중식', '탕수육',    1),
(6, 4, '최유나', 2, '해운대짜장', '중식', '짜장면',    2);

truncate table order_details_raw;

-- 중간테이블
create table  order_details_2nf (
    order_id        int,
    customer_id        int,
    restaurant_id    int,
    menu_name        varchar(255),
    quantity        int
);

create table customers_2nf (
    customer_id        int primary key,
    customer_name    varchar(255)
);

create table restaurant_2nf (
    restaurant_id    int primary key,
    restaurant_name    varchar(255),
    restaurant_category    varchar(255)
);

create table menus (
    id                int primary key auto_increment,
    menu_name        varchar(255) not null unique
);

create table restaurants (
    id                int primary key auto_increment,
    menu_name        varchar(255) not null,
    address            varchar(255) not null
);

create table restaurant_menus (
    id                int primary key auto_increment,
    restaurant_id    int    not null,
    menu_id            int not null,
    price            int not null default(0),
    constraint fk_restaurant_id
    FOREIGN KEY (restaurant_id)
    references restaurants(id)
    on delete cascade,
    constraint fk_menu_id
    FOREIGN KEY (menu_id)
    references menus(id)
    on delete cascade
);

create table customers (
    id                int primary key auto_increment,
    name            varchar(255) not null,
    phone            varchar(255) not null unique
);

create table customer_addresses (
    id                int primary key auto_increment,
    customer_id        int not null,
    address         varchar(255) not null,
    constraint fk_customer_id
    FOREIGN KEY (customer_id)
    references customers(id)
    on delete cascade
);

create table orders (
    id                int primary key auto_increment,
    customer_id        int    not null,
    order_date_time    datetime not null default(now())
);

create table order_details (
    id                int primary key auto_increment,
    order_id        int not null,
    restaurant_menu_id    int not null,
    quantity        int not null default(1),
    constraint fk_order_id
    FOREIGN KEY (order_id)
    references orders(id)
    on delete cascade,
    constraint fk_restaurant_menu_id
    FOREIGN KEY (restaurant_menu_id)
    references restaurant_menus(id)
    on delete cascade
);

select * from order_details_raw;
select * from customers;