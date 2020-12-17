        DROP USER 'potentialClient'@'localhost';

CREATE USER 'potentialClient'@'localhost' IDENTIFIED BY 'potentialClient';

GRANT SELECT, INSERT ON pchardwarev1.* TO 'potentialClient'@'localhost';

        DROP USER 'administrator'@'localhost';

CREATE USER 'administrator'@'localhost' IDENTIFIED BY 'administrator';

GRANT ALL PRIVILEGES ON pchardwarev1.* TO 'administrator'@'localhost';

        DROP USER 'employee'@'localhost';

CREATE USER 'employee'@'localhost' IDENTIFIED BY 'employee';

GRANT SELECT, UPDATE, DELETE, INSERT ON pchardwarev1.* TO 'employee'@'localhost';

FLUSH PRIVILEGES;