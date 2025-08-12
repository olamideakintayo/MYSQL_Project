USE MDC_CH02;
SHOW TABLES;


-- Question A. Show all data in each of the tables.--
SELECT * FROM Customer, Invoice, Invoice_Item;

-- Question B. List the LastName, FirstName, and Phone of all customers. --
SELECT LastName, FirstName, Phone
FROM Customer;

