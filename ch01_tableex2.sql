create table delivery_riders(
	id int primary key auto_increment,
    name varchar(30) not null,
    phone varchar(20) unique not null,
    region varchar(50) not null,
    is_active boolean default true,
    joined_at timestamp default current_timestamp
);

DESC delivery_riders;

insert into delivery_riders (name, phone, region) values 
('진혜정', '010-1234-1234', '남구'),
('이긴혜정', '010-1234-5678', '북구'),
('비긴혜정', '010-4321-1234', '서구');

select * from delivery_riders;


create table admins(
	id int primary key auto_increment,
    username varchar(30) unique not null,
    email varchar(100) unique not null,
    full_name varchar(50) not null,
    created_at timestamp default current_timestamp
);

DESC admins;

insert into admins (username, email, full_name) values
('진혜정','1234@gmail.com','진혜정'),
('이긴혜정', '4321@gmail.com','이긴혜정');

select * from admins;



