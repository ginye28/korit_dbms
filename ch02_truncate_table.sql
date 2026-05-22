
set foreign_key_checks = 0;

truncate table order_details;
truncate table orders;
truncate table customer_addresses;
truncate table restaurant_menus;
truncate table menus;
truncate table restaurants;
truncate table customers;

select * from restaurants;