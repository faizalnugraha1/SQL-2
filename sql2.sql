START TRANSACTION;
INSERT INTO employees values
(1704, "Fei Hung", "Wong", "x2314", "kungfu_master@gmail.com", "5", 1002, "Security"),
(1705, "Escobar", "Pablo", "x2315", "legendary_marketer@gmail.com", "3", 1076, "Marketing Manager"),
(1706, "Ma", "Jack", "x2316", "service.your.ac@gmail.com", "1", 1002, "Technician"),
(1707, "Schumacher", "Michael", "x2317", "vroom_vrooom@gmail.com", "4", 1002, "Driver"),
(1708, "Snowden", "Edward", "x2318", "mr.robot@gmail.com", "2", 1002, "Cyber Security");
COMMIT;

INSERT INTO employees values(1709, "Ford", "Henry", "x2319", "mechanism@gmail.com", "5", 1002, "Mechanic");
UPDATE employees SET officeCode = "7" WHERE employeeNumber = 1709;
DELETE FROM employees WHERE employeeNumber = 1709;

ROLLBACK;
SELECT * FROM employees;

/* Subquery */
SELECT * FROM customers WHERE creditLimit IN (SELECT creditLimit FROM customers WHERE creditLimit < 100000);

INSERT INTO employees_bkp SELECT * FROM employees WHERE employeeNumber IN (SELECT employeeNumber FROM employees);
SELECT * FROM employees_bkp;

UPDATE employees SET reportsTo = "1102" WHERE reportsTo IN (SELECT reportsTo FROM employees_bkp WHERE reportsTo = "1088" );

DELETE FROM employees WHERE officeCode IN (SELECT officeCode FROM employees_bkp WHERE officeCode = "2");

SELECT * FROM customers WHERE creditLimit IN (SELECT MAX(creditLimit) FROM customers);

SELECT products.productCode, orderdetails.quantityOrdered from (SELECT productCode FROM orderdetails WHERE quantityOrdered > 20) AS products JOIN orderdetails
ON products.productCode = orderdetails.productCode;

SELECT addressLine1 FROM customers union SELECT addressLine1 FROM offices ORDER BY addressLine1;

SELECT productCode FROM products intersect SELECT productCode FROM orderdetails;