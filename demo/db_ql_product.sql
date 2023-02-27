drop database if exists ql_product;
create database ql_product;
use ql_product;

create table `product`(
`product_stt` 	int 	not null primary key auto_increment,
`product_name`	varchar(255),
`product_price`	double,
`quantity` int,
`color_product` varchar(255),
`category` varchar(50)
);	

insert into product(`product_stt`,`product_name`,`product_price`,`quantity` ,`color_product`,`category`)
values(1,'iPhone 11',799.0,12,'Black,Yellow,Green','Phone'),
	(2,'iPhone 11 Pro',1100.0,12,'Black,Yellow,Green','Phone'),
	(3,'iPhone X',749.0,12,'Black,Yellow,Green','Phone'),
	(4,'Smart Tivi 55 inch',799.0,12,'Black,Yellow,Green','Tivi'),
	(5,'Tủ lạnh 2 cánh Toshiba',799.0,12,'Black,Yellow,Green','Tủ Lạnh'),
	(6,'Máy giặt cửa ngang SamSung',320.0,12,'Black,Yellow,Green','Máy giặt');

SET SQL_SAFE_UPDATES = 0;



DELIMITER //
create procedure search_product_by_name(search varchar(45))
begin
select * from product
where product_name like CONCAT('%', search, '%');
end //
DELIMITER ;



call search_product_by_name("i");



