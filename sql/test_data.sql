use pchardwarev1;

set FOREIGN_KEY_CHECKS = 0;

start transaction;

#insert customers
truncate table customers;

insert into customers (id, first_name, last_name, address, phone, email, zip, country) values(1, 'Bob', 'Johnson', 'Hvidovrevej 3', '36998877', 'bob.j@email.com', 2650, 'Denmark');
insert into customers (id, first_name, last_name, address, phone, email, zip, country) values(2, 'Dylan', 'Jackson', 'Roskildevej 39', '45991100', 'dylan.j@email.com', 4000, 'Denmark');


#insert employees
truncate table employees;

insert into employees (id, first_name, last_name, address, phone, email, zip, country) values(1, 'John', 'Johnson', 'Rødovrevej 98', '23990077', 'john.j@email.com', 2610, 'Denmark');
insert into employees (id, first_name, last_name, address, phone, email, zip, country) values(2, 'Jack', 'Jackson', 'Rundetårnvej 333', '99991100', 'jack.j@email.com', 2150, 'Denmark');


#insert products categories
truncate table product_categories;

insert into product_categories (id, name) values (1, 'Chargers');
insert into product_categories (id, name) values (2, 'Keyboards');
insert into product_categories (id, name) values (3, 'Mice');
insert into product_categories (id, name) values (4, 'Monitors');


#insert manufacturers
truncate table manufacturers;

insert into manufacturers (id, name, website) values (1, 'razer', 'www.razer.com');
insert into manufacturers (id, name, website) values (2, 'microsoft', 'www.microsoft.com');
insert into manufacturers (id, name, website) values (3, 'asus', 'www.asus.com');


#insert products
truncate table products;

#chargers
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (1, 'Charger', 'a charger designed for the best power effeciency while being fast at charging', 40, 20, 1, 1);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (2, 'Charger 5mm', 'This charger fits with all 5mm inputs. Charges really fast', 45, 1, 1, 1);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (3, 'Charger 5mm super edition', 'Super fast charger. Fits all 5mm inputs. requires 230v socket.', 45, 6, 1, 1);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (4, 'Charger 7mm', 'Charger for 7mm inputs. This charger comes with a 3 meter long cable. Perfect if your socket is far away', 45, 12, 1, 1);

#keyboards
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (5, 'Travel keyboard', 'Small sized keyboard that can fit in most backpacks. Perfect for travelling', 67, 0, 2, 1);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (6, 'Travel keyboard XS', 'Foldable keyboard that can fit in most backpacks. Perfect for travelling and hiking', 75, 0, 2, 1);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (7, 'Gamer keyboard XD', 'Sick gamer keyboard for the most veteran gamers. Has all the latest features that makes you really badass', 850, 0, 2, 1);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (8, 'Gamer keyboard XL', 'The perfect gamer keyboard for serious gamers and people who wants to destroy their wallets', 2950, 12, 2, 1);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (9, 'Office keyboard', 'A standard keyboard. Good for office work and other productive tasks', 40, 42, 2, 1);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (10, 'Ergonomic keyboard', 'An ergonomic keyboard that will protect your wrists from keyboard syndrome', 59, 5, 2, 1);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (11, 'Ergonomic gamer keyboard', 'Identical to the ergonomic keyboard, except it has a new logo and a higher price tag', 900, 2, 2, 2);


#mice
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (12, 'Ergonomic mouse', 'An ergonomic mouse that will protect your wrists from falling off', 30, 2, 3, 2);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (13, 'Ergonomic gamer mouse', 'The ergonomic mouse is back, more expensive than ever.', 300, 4, 3, 2);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (14, 'RPG mouse', 'This mouse is a great addition to WoW gamers. Has 400 side buttons', 320, 6, 3, 2);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (15, 'Mouse', 'Standard mouse. good for office work and other productive use', 2, 6, 3, 2);


#monitors
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (16, 'monitor', 'Standard 4:3 monitor. perfect for people stuck in the past', 20, 6, 4, 2);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (17, 'monitor HD', 'Standard 1080p monitor. Enjoy a crystal clear image on this beauty', 45, 6, 4, 3);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (18, 'UltraW xtreme', 'Ultrawide monitor for the serious money spenders. 649:9 aspect ratio.', 2000, 6, 4, 3);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (19, 'UltraW xtreme XL', 'Even wider monitor for people with fisheyes. Great visuals like you havve enver seen before.', 2001, 6, 4, 3);
insert into products (id, name, description, price, stock, category_id, manufacturer_id) values (20, '360 dome', 'A monitor that goes full circle. Enjoy the full 360 degrees of spectatular visuals', 3600, 6, 4, 3);



#insert payment methods
truncate table payment_methods;

insert into payment_methods (id, type) values (1, 'VISA');
insert into payment_methods (id, type) values (2, 'Mastercard');
insert into payment_methods (id, type) values (3, 'Cheque');
insert into payment_methods (id, type) values (4, 'Bank transfer');


#insert order statuses
truncate table status;

insert into status (id, name) values (1, 'Placed');
insert into status (id, name) values (2, 'Paid');
insert into status (id, name) values (3, 'Shipped');
insert into status (id, name) values (4, 'Cancelled');

#insert orders
truncate table orders;

insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (1, '19970101', 1, 1, 1, 1); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (2, '19970101', 1, 1, 1, 2); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (3, '19970101', 1, 1, 1, 3); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (4, '19970101', 1, 1, 1, 4); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (5, '19970101', 1, 1, 2, 1); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (6, '19970101', 1, 1, 2, 2); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (7, '19970101', 1, 1, 2, 3); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (8, '19970101', 1, 1, 2, 4);
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (9, '19970101', 1, 1, 3, 1); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (10, '19970101', 1, 1, 3, 2); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (11, '19970101', 1, 1, 3, 3); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (12, '19970101', 1, 1, 3, 4); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (13, '19970101', 1, 1, 4, 1); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (14, '19970101', 1, 1, 4, 2); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (15, '19970101', 1, 1, 4, 3); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (16, '19970101', 1, 1, 4, 4); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (17, '19970101', 2, 1, 1, 1); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (18, '19970101', 2, 1, 1, 2); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (19, '19970101', 2, 1, 1, 3); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (20, '19970101', 2, 1, 1, 4); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (21, '19970101', 2, 1, 2, 1); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (22, '19970101', 2, 1, 2, 2); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (23, '19970101', 2, 1, 2, 3); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (24, '19970101', 2, 1, 2, 4);
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (25, '19970101', 2, 1, 3, 1); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (26, '19970101', 2, 1, 3, 2); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (27, '19970101', 2, 1, 3, 3); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (28, '19970101', 2, 1, 3, 4); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (29, '19970101', 2, 1, 4, 1); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (30, '19970101', 2, 1, 4, 2); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (31, '19970101', 2, 1, 4, 3); 
insert into orders (id, date, customer_id, employee_id, status_id, payment_method_id) values (32, '19970101', 2, 1, 4, 4); 


#insert order items
truncate table order_items;

#1
insert into order_items (amount, unit_price, order_id, product_id) values (2, 25, 1, 1);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 50, 1, 4);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 50, 1, 7);
#2
insert into order_items (amount, unit_price, order_id, product_id) values (5, 25, 2, 2);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 50, 2, 13);
#3
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 3, 3);
insert into order_items (amount, unit_price, order_id, product_id) values (25, 50, 3, 18);
#4
insert into order_items (amount, unit_price, order_id, product_id) values (2, 25, 4, 4);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 4, 11);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 4, 9);
insert into order_items (amount, unit_price, order_id, product_id) values (4, 50, 4, 19);
#5
insert into order_items (amount, unit_price, order_id, product_id) values (2, 25, 5, 4);
#6
insert into order_items (amount, unit_price, order_id, product_id) values (2, 25, 6, 6);
#7
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 7, 5);
#8
insert into order_items (amount, unit_price, order_id, product_id) values (50, 25, 8, 20);
insert into order_items (amount, unit_price, order_id, product_id) values (20, 25, 8, 16);
#9
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 9, 15);
insert into order_items (amount, unit_price, order_id, product_id) values (2, 25, 9, 14);
#10
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 10, 6);
#11
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 11, 19);
#12
insert into order_items (amount, unit_price, order_id, product_id) values (2, 25, 12, 12);
#13
insert into order_items (amount, unit_price, order_id, product_id) values (2, 25, 13, 1);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 13, 2);
#14
insert into order_items (amount, unit_price, order_id, product_id) values (2, 25, 14, 1);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 14, 2);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 14, 3);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 14, 4);
insert into order_items (amount, unit_price, order_id, product_id) values (7, 25, 14, 5);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 14, 14);
#15
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 15, 4);
#16
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 16, 8);
#17
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 17, 9);
#18
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 18, 14);
#19
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 19, 11);
#20
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 20, 4);
#21
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 21, 1);
#22
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 22, 3);
#23
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 23, 17);
#24
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 24, 18);
#25
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 25, 18);
#26
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 26, 5);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 26, 6);
#27
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 27, 5);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 27, 6);
#28
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 28, 7);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 28, 11);
#29
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 29, 9);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 29, 14);
#30
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 30, 9);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 30, 16);
#31
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 31, 6);
#32
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 32, 8);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 32, 7);
insert into order_items (amount, unit_price, order_id, product_id) values (12, 25, 32, 9);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 32, 2);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 32, 3);
insert into order_items (amount, unit_price, order_id, product_id) values (20, 25, 32, 10);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 32, 19);
insert into order_items (amount, unit_price, order_id, product_id) values (1, 25, 32, 16);
insert into order_items (amount, unit_price, order_id, product_id) values (100, 25, 32, 5);
insert into order_items (amount, unit_price, order_id, product_id) values (100, 25, 32, 2);



commit;

set FOREIGN_KEY_CHECKS = 1;
