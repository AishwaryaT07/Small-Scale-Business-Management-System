use group023_bookstore;

create table city
(
	city_pincode int primary key, 
	city_name varchar(50), 
	city_street varchar(100), 
	city_state varchar(50)
);

create table customer
(
	customer_id int primary key, 
	customer_fname varchar(100), 
	customer_lname varchar(100), 
	customer_gender varchar(50), 
	customer_email varchar(128), 
	customer_contact bigint, 
	customer_street varchar(200), 
	city_pincode int, 
	foreign key(city_pincode) references city(city_pincode)
);

create table services
(
	service_id int primary key, 
	service_name varchar(100), 
	service_description varchar(250), 
	service_rating int, 
	service_cost int, 
	service_street varchar(100), 
	city_pincode int, 
	foreign key(city_pincode) references city(city_pincode)
);

create table vendor
(
	vendor_id int primary key, 
	vendor_fname varchar(50), 
	vendor_lname varchar(50), 
	vendor_gender varchar(50), 
	vendor_email varchar(128), 
	vendor_contact bigint, 
	vendor_profession varchar(200), 
	service_id int, 
	foreign key(service_id) references services(service_id)
);

create table feedback
(
	feedback_id int primary key,
	customer_id int,
	vendor_id int, 
	feedback_rating int, 
	feedback_description varchar(250),
	feedback_date date,
	foreign key(`customer_id`) references `customer`(`customer_id`), 
	foreign key(`vendor_id`) references `vendor`(`vendor_id`)
);

