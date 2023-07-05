#Create a database name pizza_sales
CREATE DATABASE IF NOT EXISTS Pizza_Sales;

USE pizza_sales;

#Create table orders with columns Order_ID, Order_Date, Order_Time
CREATE TABLE orders
(
 Order_ID int,
 Order_Date char(20),
 Order_Time time
);

LOAD DATA INFILE 'orders.csv' INTO TABLE orders
FIELDS  TERMINATED BY ','
IGNORE 1 LINES;

#Update the data type of Order_Date column to date from char
UPDATE orders SET Order_Date = str_to_date(Order_Date, "%d-%m-%Y");


#Create table pizza_types with columns Pizza_Type_ID, Pizza_Name, Category, Ingredients. This table contains different pizzas available.
CREATE TABLE pizza_types
(
 Pizza_Type_ID varchar(50),
 Pizza_Name varchar(50),
 Category varchar(50),
 Ingredients varchar(255)
);

LOAD DATA INFILE 'pizza_types.csv' INTO TABLE pizza_types
FIELDS  TERMINATED BY ','
IGNORE 1 LINES;


CREATE TABLE pizzas
(
Pizza_ID varchar(50),
Pizza_Type_ID varchar(50),
Size varchar(50),
Price decimal
);

LOAD DATA INFILE 'pizzas.csv' INTO TABLE pizzas
FIELDS  TERMINATED BY ','
IGNORE 1 LINES;


CREATE TABLE order_details
( 
 Order_Details_ID int, 
 Order_ID int,
 Pizza_ID varchar(50),
 Quantity int
 );
 
LOAD DATA INFILE 'order_details.csv' INTO TABLE order_details
FIELDS  TERMINATED BY ','
IGNORE 1 LINES;