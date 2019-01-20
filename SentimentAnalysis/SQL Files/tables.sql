create database cdac_project;

create table user(
	id Int Not null primary key Auto_increment,
	user_name varchar(255) not null unique, 
	name varchar(255) not null, 
	password varchar(255) not null, 
	email_id  varchar(255) not null, 
	phone_no varchar(25) not null, 
	gender varchar(20) not null, 
	nationality varchar(40) not null, 
	created_at timestamp default current_timestamp, 
	updated_at timestamp default current_timestamp on update current_timestamp
);

create table product(
	id INT not null primary key Auto_increment,
	title varchar(255) not null,
	description text not null,
	creator_id varchar(255) references user(id),
	image_url varchar(255) not null,
	created_at timestamp default current_timestamp,
	updated_at timestamp default current_timestamp on update current_timestamp
);

create table comments(
	id INT not null primary key Auto_increment,
	product_id INT references product(id),
	user_id INT references user(id),
	comment_text text not null,
	sentiment varchar(20) not null,
	created_at timestamp default current_timestamp,
	updated_at timestamp default current_timestamp on update current_timestamp
);
