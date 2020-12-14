CREATE USER 'potentialClient'@'localhost' IDENTIFIED BY 'potentialClient';

GRANT SELECT, INSERT ON pchardwarev1.* TO 'potentialClient'@'localhost';

CREATE USER 'administrator'@'localhost' IDENTIFIED BY 'administrator';

GRANT ALL PRIVILEGES ON pchardwarev1.* TO 'administrator'@'localhost';

CREATE USER 'employee'@'localhost' IDENTIFIED BY 'employee';

GRANT SELECT, UPDATE, DELETE, INSERT ON pchardwarev1.* TO 'employee'@'localhost';

FLUSH PRIVILEGES;