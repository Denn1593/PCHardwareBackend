use PCHardwareV1;

set FOREIGN_KEY_CHECKS = 0;

start transaction;

#insert product categories
truncate table product_categories;

INSERT INTO product_categories (id, name) VALUES ('1','Desktop / desktop');
INSERT INTO product_categories (id, name) VALUES ('2','Notebooks / laptops');
INSERT INTO product_categories (id, name) VALUES ('3','Tablets');
INSERT INTO product_categories (id, name) VALUES ('4','Servers');
INSERT INTO product_categories (id, name) VALUES ('5','Keyboard & mouse etc.');
INSERT INTO product_categories (id, name) VALUES ('6','Bags / sleeve');
INSERT INTO product_categories (id, name) VALUES ('7','Docking stations');
INSERT INTO product_categories (id, name) VALUES ('8','Power supply');
INSERT INTO product_categories (id, name) VALUES ('9','External hard drives');
INSERT INTO product_categories (id, name) VALUES ('10','Batteries');
INSERT INTO product_categories (id, name) VALUES ('11','Monitors / screens');
INSERT INTO product_categories (id, name) VALUES ('12','Speakers & headsets');

set FOREIGN_KEY_CHECKS = 1;