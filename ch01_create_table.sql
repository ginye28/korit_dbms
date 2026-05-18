create table restaurants (
	id INT,
    name VARCHAR(50),
    category VARCHAR(20)
);

create table customers (
	id INT,
	name VARCHAR(30),
	phone VARCHAR(20),
    address VARCHAR(100)
);

create table menus (
	id INT,
    restaurant_id INT,
    menu_name VARCHAR(50),
    price INT
);
