create table Member(
	id varchar(50) not null primary key,
	password varchar(100) not null,
	name varchar(50) not null,
	gender varchar(20) not null,
	age varchar varchar(20) not null,
	phone varchar(100) not null,
	address varchar(1000) not null
);

create table orders(
	orders_id int primary key auto_increment,
    orders_memberid varchar(50) not null,
    orders_date varchar(50) not null,
    orders_name varchar(50) not null,
    orders_address varchar(50) not null,
    orders_request varchar(50) not null,
    orders_fee int not null
);

create table detail(
	detail_id int primary key auto_increment,
    detail_product_id varchar(50) not null,
    detail_orders_id int not null,
    detail_amount int not null,
    detail_state int not null
);