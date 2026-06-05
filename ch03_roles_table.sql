select * from st11_spring02.users;
truncate table users;
truncate table roles;

select * from users;
select * from roles;

insert into roles (id, role_name) values (default, "ROLE_ADMIN");