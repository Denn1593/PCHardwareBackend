use PCHardwareV1;

set FOREIGN_KEY_CHECKS = 0;

start transaction;

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
