/*DDL(Data Defination Language)

 1.CREATE:
 Creates a new object of the specified type.
 Syntax:
  CREATE [ OR REPLACE ] <object_type> [ IF NOT EXISTS ] <object_name>
  [ <object_type_properties> ]
  [ <object_type_params> ]
  [ COMMENT = '<string_literal>' ];
*/

CREATE DATABASE HOTELMANAGEMENT;
USE HOTELMANAGEMENT;


CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Address TEXT,
    City VARCHAR(50),
    RegistrationDate DATE NOT NULL 
);


CREATE TABLE Restaurants (
    RestaurantID INT  PRIMARY KEY,
    CName VARCHAR(100) NOT NULL,
    Address TEXT,
    City VARCHAR(50),
    Phone VARCHAR(15),
    CuisineType VARCHAR(50)
);

CREATE TABLE DeliveryAgents (
    AgentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    VehicleType VARCHAR(50),
    Rating DECIMAL(2, 1) CHECK (Rating BETWEEN 0 AND 5),
    EmploymentDate DATE NOT NULL
);


CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    AgentID INT,
    OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    DeliveryDate DATETIME,
    Status ENUM('Pending', 'In Progress', 'Delivered', 'Cancelled') NOT NULL DEFAULT 'Pending',
    TotalAmount DECIMAL(10, 2) NOT NULL
);

/*
 2.DROP:
 Removes the specified object from the system.
 Syntax:
  DROP <object_type> [ IF EXISTS ] <identifier>  [ CASCADE | RESTRICT ];
  We can drop table as well as database !!
*/

Drop table deliveryagents; /* Drop database database_name;*/



/*
 3.ALTER:
 Modifies the metadata of an account-level or database object, or the parameters for a session.
 Syntax:
  ALTER ACCOUNT SET <params>
  ALTER SESSION SET <params>
  ALTER <object_type> <object_name> <actions>
*/
Alter table Customer 
DROP column Address;

select * from customer;


/*
 4.TRUNCATE:
 Removes all rows from a table but leaves the table intact (including all privileges and 
 constraints on the table). Also deletes the load metadata for the table, which allows the
 same files to be loaded into the table again after the command completes.
 Syntax:
  TRUNCATE [ TABLE ] [ IF EXISTS ] <name>
*/

Truncate table restaurants;


/*DML(Data Manipulation Language)

 1.INSERT:
 Updates a table by inserting one or more rows into the table. The values inserted 
 into each column in the table can be explicitly-specified or the results of a query.
 Syntax:
   INSERT [ OVERWRITE ] INTO <target_table> [ ( <target_col_name> [ , ... ] ) ]
       {
         VALUES ( { <value> | DEFAULT | NULL } [ , ... ] ) [ , ( ... ) ]  |
         <query>
       }
       
*/

INSERT INTO customer VALUES 
(1001,'Alice Johnson', 'alice.johnson@example.com', '555-1234', '123 Elm Street', '2024-12-15'),
(1002,'Bob Smith', 'bob.smith@example.com', '555-5678', '456 Oak Avenue',  '2024-12-16'),
(1003,'Cathy Brown', 'cathy.brown@example.com', '555-8765', '789 Pine Lane', '2024-12-17'),
(1004,'James Martin', 'james.martin@example.com', '555-8888', '890 Shadow Street',  '2024-02-09'),
(1005,'David Rodger', 'david.rodge@example.com', '555-9890', '123 Bootcamp',  '2024-12-10');


INSERT INTO restaurants VALUES 
(101,'Golden Spoon', '123 Elm Street', 'Springfield', '555-1234', 'Italian'),
(102,'Ocean Breeze', '456 Pine Avenue', 'Seaside', '555-5678', 'Seafood'),
(103,'Taco Haven', '789 Maple Drive', 'Hilltop', '555-8765', 'Mexican'),
(104,'The Garden of Eatn', '871 Italian Palace', 'Seaside', '555-8928', 'Cheesy'),
(105,'Brit’s Brunch Bar', '918 Calastine Top', 'Hilltop', '555-6756', 'Bar')
;


/*
 2.UPDATE:
 Updates specified rows in the target table with new values.
 Syntax:
  UPDATE <target_table>
       SET <col_name> = <value> [ , <col_name> = <value> , ... ]
        [ FROM <additional_tables> ]
        [ WHERE <condition> ]
*/

Update Customer set cname="David Williams" where CustomerID=1001;

/*
 3.DELETE:
 Remove rows from a table. You can use a WHERE clause to specify which rows should be
 removed. If you need to use a subquery(s) or additional table(s) to identify the rows to be 
 removed, specify the subquery(s) or table(s) in a USING clause.
 Syntax:
  DELETE FROM <table_name>
            [ USING <additional_table_or_query> [, <additional_table_or_query> ] ]
            [ WHERE <condition> ]
*/
Delete from Customer where cname="David Williams";
