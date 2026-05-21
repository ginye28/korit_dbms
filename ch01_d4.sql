select concat('진', '혜', '정');
select
	*
from
	restaurants;
    
select
	substring(name, 3, 2)
from
	restaurants;
    
create table nums(
	id int primary key auto_increment,
    num int
);

alter table nums modify column num varchar(10);

insert into nums(num) values
	('1'),
	('11'),
	('111'),
	('21'),
	('221'),
	('212'),
	('2');
    
select 
	lpad(num, 5, '0') as lpad_num
from 
	nums 
order by 
	lpad_num;
    
select 100 % 3;

-- mod 사용 권장
select mod(100, 3);

-- table 초기화 (auto_increment 삭제)
truncate table nums;
-- table 비움 (auto_increment 남음)
delete from nums;

select * from nums;


select truncate(-10.5, 0), floor(-10.5);

select now(), curdate(), curtime();

select date_format(now(), '%Y년 %m월 %d일 %p %h시 %i분 %s초 %W');

-- 임시저장
create view v_weeks as
select 0 as week_num, '일' as week_name union
select 1, '월' union
select 2, '화' union
select 3, '수' union
select 4, '목' union
select 5, '금' union
select 6, '토';

select * from v_weeks;

select * from v_weeks where week_num = (
	select date_format(date_sub(now(), interval 4 day), '%w')
);

select year('2026-05-02');
select month('2026-05-02');
select day('2026-05-02');
select hour(now());
select minute(now());
select second(now());

select * from customers;

select 
	ifnull(email, '') 
from
	customers;
    
-- 삼항연산
select
	if(email is null, '이메일 없음', email)
from
	customers;
    
select 
	case
		when then,
		when then,
    end
from 
	restaurants;