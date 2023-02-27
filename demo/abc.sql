drop database if exists blissful_coffee;
create database blissful_coffee;
use blissful_coffee;



create table `customer`(
`customer_id` 		int 	not null primary key auto_increment,
`fullname`			varchar(45),
`dob`				date,
`gender`			bit(1),
`email`				varchar(255),
`phone_number`		varchar(45),
`profile_img`		varchar(255),
`username`			varchar(45),
`password`			varchar(45),
`account_status`	varchar(255)
);





create table `address`(
`address_id` 	int not null primary key auto_increment,
`address_line` 	varchar(45),
`customer_id` 	int,
foreign key(`customer_id`)		references`customer`(`customer_id`) on delete cascade
);


create table `category`(
`category_id` 	int not null primary key auto_increment,
`category_name` 	varchar(255)
);



create table `product`(
`product_id` 	int not null primary key auto_increment,
`product_name` 	varchar(45),
`price` 	double,
`quantity` 	int,
`description` 	varchar(255),
`category_id` 	int,
foreign key(`category_id`)		references`category`(`category_id`) on delete cascade
);

create table `image`(
`image_id` 		int not null primary key,
`image_name` varchar(255),
foreign key(`product_id`)		references`product`(`product_id`) on delete cascade

);

create table `rating`(
`rating_id` 	int not null primary key auto_increment,
`product_id` 	int,
`score` 		double,
`remarks` 		varchar(255),
`date_recorded`	date,
`customer_id` 	int,
foreign key(`customer_id`)		references`customer`(`customer_id`) on delete cascade,
foreign key(`product_id`)		references`product`(`product_id`) on delete cascade

);

create table `wishlist`(
`wishlist_id` 	int not null primary key,
`product_id` 	int,
`customer_id` 	int ,
foreign key(`customer_id`)		references`customer`(`customer_id`) on delete cascade,
foreign key(`product_id`)		references`product`(`product_id`) on delete cascade
);

create table `discount`(
`discount_id` 	int not null primary key,
`discount_code` varchar(45),
`discount_value` double,
`customer_unit` 	double ,
`create_date` 	date ,
`valid_from` 	date ,
`valid_unil` 	date ,
`product_id` 	int ,
foreign key(`product_id`)		references`product`(`product_id`) on delete cascade
);


create table `role`(
`role_id` 		int not null primary key,
`role_mame` varchar(255)
);



create table `staff`(
`staff_id` 	int not null primary key,
`fullname` 	varchar(255),
`contact` 	varchar(255) ,
`email` 	varchar(255) ,
`user_name` 	varchar(255) ,
`password` 	varchar(255) ,
`role_id` 	int ,

foreign key(`role_id`)			references`role`(`role_id`) on delete cascade
);


create table `order`(
`order_id` 	int not null primary key,
`staff_id` 	int,
`order_date` 	date ,
`total_amount` 	double,
`order_status` 	varchar(255),
`customer_id` 	int,

foreign key(`staff_id`)			references`staff`(`staff_id`) on delete cascade,
foreign key(`customer_id`)		references`customer`(`customer_id`) on delete cascade
);


create table `order_dentail`(
`order_dentail_id` 	int not null primary key,
`product_id` 	int,
`order_id` 	int ,
`quantity` 	int ,
`total_amount` 	double,
foreign key(`order_id`)			references`order`(`order_id`) on delete cascade,
foreign key(`product_id`)		references`product`(`product_id`) on delete cascade
);



create table `payment`(
`payment_id` 	int not null primary key,
`order_id` 	int,
`amount` 	int ,
`paid_by` 	varchar(255) ,
`payment_date` 	date,
`customer_id` 	int,
foreign key(`order_id`)			references`order`(`order_id`) on delete cascade,
foreign key(`customer_id`)		references`customer`(`customer_id`) on delete cascade
);

create table `site_inf`(
`site_inf_id` 	int not null primary key,
`site_name` 	varchar(255) ,
`description` 	varchar(255) ,
`contact_info` 	varchar(255) ,
`address` 	varchar(255) ,
`last_update` varchar(255) ,
`s` 	int,

foreign key(`customer_id`)		references`customer`(`customer_id`) on delete cascade
);

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    