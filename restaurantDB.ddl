drop database if exists restaurantDB;
create database restaurantDB;
use restaurantDB;

create table restaurant (
    url varchar(512) primary key,
    street varchar(50),
    city varchar(50),
    province char(2),
    zip char(6),
    name varchar(50));
    
create table employee (
    id integer primary key,
    firstName varchar(50),
    lastName varchar(50),
    email varchar(320),
    restaurantURL varchar(512) not null,
    foreign key (restaurantURL) references restaurant(url));

create table manager (
    managerID integer primary key,
    foreign key (managerID) references employee(id) on delete cascade);

create table deliverer (
    delivererID integer primary key,
    foreign key (delivererID) references employee(id) on delete cascade);

create table chef (
    chefID integer primary key,
    foreign key (chefID) references employee(id) on delete cascade);

create table `server` (
    serverID integer primary key,
    foreign key (serverID) references employee(id) on delete cascade);

create table customerAccount (
    email varchar(320) primary key,
    firstName varchar(50),
    lastName varchar(50),
    phone char(10),
    street varchar(50),
    city varchar(50),
    province char(2),
    zip char(6),
    creditAmount decimal(8, 2));

create table `order` (
    id integer primary key,
    totalAmount decimal(6, 2),
    tips decimal(4, 2),
    day date,
    placeTime time,
    deliverTime time,
    placedByCustomer varchar(320) not null,
    takesByRestaurant varchar(512) not null,
    delivererID integer,
    foreign key (placedByCustomer) references customerAccount(email),
    foreign key (takesByRestaurant) references restaurant(url),
    foreign key (delivererID) references deliverer(delivererID));

create table food (
    name varchar(50) primary key);

create table shift (
    day date,
    employeeID integer,
    starttime time,
    endtime time,
    primary key (employeeID, day),
    foreign key (employeeID) references employee(id) on delete cascade);

create table payment (
    customerEmail varchar(320) not null,
    paymentAmount decimal(6, 2),
    paymentDate date not null,
    primary key (customerEmail, paymentDate),
    foreign key (customerEmail) references customerAccount(email) on delete cascade);

create table employeeRelatedToCustomer (
    employeeID integer not null,
    customerEmail varchar(320) not null,
    relationshipType varchar(20),
    primary key (employeeID, customerEmail),
    foreign key (employeeID) references employee(id) on delete cascade,
    foreign key (customerEmail) references customerAccount(email) on delete cascade);

create table orderContainsFood (
    orderID integer not null,
    foodName varchar(50) not null,
    primary key (orderID, foodName),
    foreign key (orderID) references `order`(id) on delete cascade,
    foreign key (foodName) references food(name) on delete cascade);

create table restaurantOffersFood (
    restaurantURL varchar(512) not null,
    foodName varchar(50) not null,
    price decimal(4, 2),
    primary key(restaurantURL, foodName),
    foreign key(restaurantURL) references restaurant(url) on delete cascade,
    foreign key(foodName) references food(name) on delete cascade);

create table chefCredentials (
    chefID integer not null,
    credentials varchar(100) not null,
    primary key (chefID, credentials),
    foreign key (chefID) references chef(chefID) on delete cascade);


insert into restaurant values
('http://kwadddfood.com/','24 Elm','Kingston','ON','K7K7I4','Kwafood'),
('http://andycookgoodfood.com/','933 Angus','Kingston','ON','M1W2U9','Andaaala'),
('https://leechenbistro.com/king-university/','214 King','Kingston','ON',"M5H2S7",'LeeChen'),
('https://tommynoodles.com/','3131 Bridle','Kingston','ON','H7H16Y','Noodela')
;

insert into employee values
(1,'Ray','Yao','rayyao333@gmail.com','http://kwadddfood.com/'),
(2,'Kitty','Smith','kitty222@hotmail.ca','http://andycookgoodfood.com/'),
(12,'Lebron','James', 'LBJ666@outlook.com','http://kwadddfood.com/'),
(9,'Lim','Chao','4524uuu@gmail.com','http://kwadddfood.com/'),
(8,'Paul','Gai','paul111@gmail.com','https://leechenbistro.com/king-university/'),
(22,'Martin','Wade','Wademmm@outlook.com','https://tommynoodles.com/'),
(24,'Grace','Skyler','graceyy@hotmail.com','http://kwadddfood.com/'),
(14,'Kate','Winston','kkw@hotmail.com','https://leechenbistro.com/king-university/'),
(7,'Moe','Green','moegreen@gmail.com','http://andycookgoodfood.com/'),
(3,'Howard','Brown','HB34@hotmail.ca','https://tommynoodles.com/'),
(16,'Chris','Wu','Chris888@hotmail.ca','http://andycookgoodfood.com/'),
(11,'Tommy','Lee','tommy321@gmail.com','https://leechenbistro.com/king-university/'),
(18,'Kai','Wong','kk22@hotmail.com','http://kwadddfood.com/'),
(19,'Kelly','Davis','kellysweet@outlook.com','https://tommynoodles.com/'),
(4,'Thomas','Bryant','TB6767@outlook.com','https://tommynoodles.com/'),
(5,'Kent','Oshawa','kyee222@outlook.com','http://andycookgoodfood.com/'),
(6,'Josh','J','JJ00@gmail.com','http://andycookgoodfood.com/'),
(10,'Kobe','Ni','ni1234@outlook.com','https://leechenbistro.com/king-university/'),
(13,'Noah','Adward','Noah78@hotmail.com','https://tommynoodles.com/'),
(15,'Jokin','Yao','yao888@outlook.com','https://tommynoodles.com/'),
(17,'Nobis','Nan','nobisnan24@gmail.com','https://leechenbistro.com/king-university/'),
(20,'Arthur','Lin','Ararar@outlook.com','https://leechenbistro.com/king-university/'),
(21,'Andy','Ni','andy0823@gmail.com','http://andycookgoodfood.com/'),
(23,'Shaw','Tank','Shaw333@gmail.com','http://kwadddfood.com/')
;

insert into manager values
(1),
(21),
(10),
(14),
(22),
(9)
;

insert into deliverer values
(12),
(6),
(8),
(19),
(23),
(16)
;

insert into chef values
(7),
(18),
(17),
(4),
(13),
(11)
;

insert into server values
(2),
(5),
(24),
(3),
(20),
(15)
;

insert into customerAccount values
('zzw@gmail.com','Weiwen','Zhang','6476662545','313 Vog','Kingston','ON','M1W2S8',87.19),
('youmin@hotmail.com','Youmin','Dave','614454676','14 Tim','Kingston','ON','H1Z2U8',999.99),
('Evanni@gmail.com','Evan','Ni','6478883999','22 Canner','Kingston','ON','M2W3S8',147.5),
('kale12@outlook.com','Kale','James','6475551333','898 Loius','Kingston','ON','L6A 4N8',202.00),
('benkkk@outlook.com','Ben','Night','6466762689','303 Tonta','Kingston','ON','T1T3G5',0),
('tony999@gmail.com','Tony','Wang','6476067878','999 Sky','Kingston','ON','M1W2S9',1000.50)
;

insert into `order` values
(111222333,50.23,12.00,'2022-01-14','10:11:12','10:23:25','kale12@outlook.com','http://kwadddfood.com/',12),
(333222111,18.13,2.00,'2022-01-13','12:10:30','12:40:21','Evanni@gmail.com','https://leechenbistro.com/king-university/',8),
(444324111,161.88,20.50,'2022-01-11','15:20:33','15:33:48','youmin@hotmail.com','https://tommynoodles.com/',19),
(888999888,25.08,8.00,'2022-01-10','09:20:11','09:55:03','tony999@gmail.com','https://leechenbistro.com/king-university/',8),
(118899880,18.78,1.00,'2022-01-12','21:00:09','21:33:08','zzw@gmail.com','http://kwadddfood.com/',23),
(151787666,79.51,10.00,'2022-01-15','23:01:00','23:58:03','benkkk@outlook.com','http://andycookgoodfood.com/',16)
;

insert into food values
('soup filled dumplings (pork)'),
('green onion pancake'),
('vegetable spring rolls'),
('chinese crullers'),
('spicy beef tendon'),
('smashed cucumber'),
('japanese wafu salad'),
('salt & pepper chicken'),
('braised pork belly over rice'),
('scallion noodle'),
('dan dan noodle (pork)')
;

insert into shift values
('2022-01-10',2,'10:00:00','20:00:00'),
('2022-01-11',2,'10:00:00','20:00:00'),
('2022-01-12',2,'10:00:00','20:00:00'),
('2022-01-13',2,'10:00:00','20:00:00'),
('2022-01-14',2,'10:00:00','20:00:00'),
('2022-01-15',2,'10:00:00','20:00:00'),
('2022-01-11',7,'10:00:00','20:00:00'),
('2022-01-12',16,'10:00:00','20:00:00'),
('2022-01-13',5,'10:00:00','20:00:00'),
('2022-01-14',6,'10:00:00','20:00:00'),
('2022-01-15',21,'10:00:00','20:00:00'),
('2022-01-10',1,'11:00:00','21:00:00'),
('2022-01-11',9,'11:00:00','21:00:00'),
('2022-01-12',12,'11:00:00','21:00:00'),
('2022-01-13',18,'11:00:00','21:00:00'),
('2022-01-14',23,'11:00:00','21:00:00'),
('2022-01-15',24,'11:00:00','21:00:00'),
('2022-01-10',8,'14:00:00','21:00:00'),
('2022-01-11',14,'14:00:00','23:00:00'),
('2022-01-12',11,'14:00:00','23:00:00'),
('2022-01-13',10,'14:00:00','23:00:00'),
('2022-01-14',17,'14:00:00','23:00:00'),
('2022-01-15',20,'14:00:00','23:00:00'),
('2022-01-10',22,'14:00:00','21:00:00'),
('2022-01-11',3,'09:00:00','18:00:00'),
('2022-01-12',3,'09:00:00','18:00:00'),
('2022-01-13',3,'09:00:00','18:00:00'),
('2022-01-15',3,'09:00:00','18:00:00'),
('2022-01-16',3,'09:00:00','18:00:00'),
('2022-01-12',19,'09:00:00','18:00:00'),
('2022-01-13',4,'09:00:00','18:00:00'),
('2022-01-14',13,'09:00:00','18:00:00'),
('2022-01-15',15,'09:00:00','18:00:00')
;

insert into payment values
('kale12@outlook.com',62.23,'2022-01-14'),
('Evanni@gmail.com',20.13,'2022-01-13'),
('youmin@hotmail.com',182.38,'2022-01-11'),
('tony999@gmail.com',33.08,'2022-01-10'),
('zzw@gmail.com',19.78,'2022-01-12'),
('benkkk@outlook.com',89.51,'2022-01-15')
;

insert into employeeRelatedToCustomer values
(1,'zzw@gmail.com','Brothers'),
(10,'Evanni@gmail.com','Brothers'),
(10,'tony999@gmail.com','Friends'),
(11,'tony999@gmail.com','Friends'),
(9,'youmin@hotmail.com', 'Son'),
(24,'benkkk@outlook.com', 'Aunt'),
(21,'Evanni@gmail.com','Cousins')
;

insert into orderContainsFood values
(111222333,'soup filled dumplings (pork)'),
(111222333,'smashed cucumber'),
(111222333,'braised pork belly over rice'),
(111222333,'green onion pancake'),
(444324111,'scallion noodle'),
(333222111,'braised pork belly over rice'),
(888999888,'braised pork belly over rice'),
(888999888,'soup filled dumplings (pork)'),
(118899880,'salt & pepper chicken'),
(151787666,'vegetable spring rolls'),
(151787666,'japanese wafu salad'),
(151787666,'chinese crullers'),
(151787666,'spicy beef tendon'),
(151787666,'smashed cucumber')
;

insert into restaurantOffersFood values
('http://kwadddfood.com/','soup filled dumplings (pork)',8.99),
('http://kwadddfood.com/','smashed cucumber',5.99),
('http://kwadddfood.com/','braised pork belly over rice',9.99),
('http://kwadddfood.com/','green onion pancake',8.99),
('http://kwadddfood.com/','salt & pepper chicken',11.99),
('https://leechenbistro.com/king-university/','soup filled dumplings (pork)',10.99),
('https://leechenbistro.com/king-university/','green onion pancake',6.99),
('https://leechenbistro.com/king-university/','vegetable spring rolls',4.99),
('https://leechenbistro.com/king-university/','chinese crullers',3.99),
('https://leechenbistro.com/king-university/','spicy beef tendon',11.99),
('https://leechenbistro.com/king-university/','smashed cucumber',7.99),
('https://leechenbistro.com/king-university/','japanese wafu salad',9.99),
('https://leechenbistro.com/king-university/','salt & pepper chicken',9.99),
('https://leechenbistro.com/king-university/','braised pork belly over rice',13.99),
('https://leechenbistro.com/king-university/','scallion noodle',9.99),
('https://leechenbistro.com/king-university/','dan dan noodle (pork)',9.99),
('https://tommynoodles.com/','scallion noodle',15.99),
('https://tommynoodles.com/','dan dan noodle (pork)',15.99),
('http://andycookgoodfood.com/','vegetable spring rolls',3.99),
('http://andycookgoodfood.com/','japanese wafu salad',3.99),
('http://andycookgoodfood.com/','chinese crullers',3.99),
('http://andycookgoodfood.com/','spicy beef tendon',4.99),
('http://andycookgoodfood.com/','smashed cucumber',3.99)
;

insert into chefCredentials values
(7,'Certified Working Chef'),
(7,'Certified Chef de Cuisine'),
(18,'Certified Working Chef'),
(18,'Certified Chef de Cuisine'),
(17,'Certified Working Chef'),
(17,'Certified Chef de Cuisine'),
(17,'Certified Decorator'),
(17,'Certified Master Chef'),
(4,'Certified Working Chef'),
(4,'Certified Chef de Cuisine'),
(13,'Certified Working Chef'),
(13,'Certified Chef de Cuisine'),
(11,'Certified Working Chef'),
(11,'Certified Chef de Cuisine'),
(11,'Certified Master Chef')
;
