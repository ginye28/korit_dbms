-- 1이면 true
select @@autocommit;

-- @@ -> mysql 전역변수
set @@autocommit = 0;

-- 1, 2 column
select * from menus order by 2;
insert into menus values (default, '야채볶음밥');
commit;

start transaction;
rollback;
rollback to sp2;

savepoint sp1;
savepoint sp2;