-- 데이터의 추가가 많지 않고 조회가 많을때 사용
select * from nums;

insert into nums values (round(rand() * 10));

select * from nums where num = 7;
explain select * from nums where num = 7;
create index idx_num on nums(num);

show index from nums;

-- ch02
show index from orders;