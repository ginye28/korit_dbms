select * from st11_spring01.users;
select * from st11_spring01.roles;
select * from st11_spring01.user_roles;

select
	usr.id as usr_id,
	usr.username,
	usr.password,
	usr.name,
	usr.email,
	usr.created_at as usr_created_at,
	usr.updated_at as usr_updated_at,

	usrl.id as usrl_id,
	usrl.user_id,
	usrl.role_id,
	usrl.created_at,
	usrl.updated_at,

	rol.id as rol_id,
	rol.role_name,
	rol.created_at as rol_created_at,
	rol.updated_at as rol_updated_at
from
	users usr
	inner join user_roles usrl on usrl.user_id = usr.id
	inner join roles rol on rol.role_id = usrl.role_id
where
	usr.id = 1
order by
	usr.id