-- NAME        : Valarmathi
-- PROJECT ON  : SQL
-- DATE        : 13-08-2024

---------- SQL  PROJECT --------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS cafe;                               -- creating database cafe
use cafe;

CREATE TABLE IF NOT EXISTS customer(
     customer_name text  ,
     phone_number varchar(10) NOT NULL PRIMARY KEY,
     order_number int,
     order_date date,
     ordered_food text
);                                                                 -- creating table customer in cafe database

CREATE TABLE IF NOT EXISTS food_list(
    serial_num int PRIMARY KEY,
    food_name text(20),
    food_category text(20),
    food_type text(20),
    price int
);                                                                 -- crating table food_list in cafe database

DESC  customer;                                                   -- describing table customer
DESC  food_list;                                                  -- describing table food_list

INSERT INTO food_list VALUES(1,"CheeseBurger","Main Course","VEG",150);
INSERT INTO food_list VALUES(2,"CheeseSandwich"," Main Course","VEG",180);
INSERT INTO food_list VALUES(3,"ChickenBurger"," Main Course","NON VEG",180);
INSERT INTO food_list VALUES(4,"Spicy Chicken Sandwich"," Main Course","NON VEG",225);
INSERT INTO food_list VALUES(5,"Corn Sandwich"," Main Course","VEG", 110);
INSERT INTO food_list VALUES(6,"Fruit Salad","Appetizers","NULL",80);
INSERT INTO food_list VALUES(7,"Nuggets","Appetizers","NULL ",110);
INSERT INTO food_list VALUES(8,"French Fries","Appetizers","NULL ",120);
INSERT INTO food_list VALUES(9,"Cocktails","Beverages","NULL ",100);
INSERT INTO food_list VALUES(10,"Milk Shakes","Beverages","NULL",90);
INSERT INTO food_list VALUES(11,"Iced Tea","Beverages","NULL ",50);
INSERT INTO food_list VALUES(12,"Orange Juice","Beverages"," NULL",50);
INSERT INTO food_list VALUES(13,"Lemon Tea","Beverages","NULL ",50);
INSERT INTO food_list VALUES(14,"Coffee","Beverages","NULL",30);         -- adding records to food_list table


INSERT INTO customer VALUES("Asha",9856565656,1006,"2024-08-11","ChickenBurger");
INSERT INTO customer VALUES("Ben",8080808080, 1002,"2024-08-11","Coffee");
INSERT INTO customer VALUES("Dhara",9696969696, 1008,"2024-08-11","Nuggets");
INSERT INTO customer VALUES("Jack", 7523232323, 1010,"2024-08-11","ChickenBurger");
INSERT INTO customer VALUES("Sana", 8520202020, 991,"2024-08-10","Fruit Salad");
INSERT INTO customer VALUES("Keny", 963636363, 999,"2024-08-10","CheeseSandwich");
INSERT INTO customer VALUES("Rishi", 8121212020, 1000,"2024-08-10","Nuggets");
INSERT INTO customer VALUES("Jamal",7023232323,995,"2024-08-10","Iced Tea");
INSERT INTO customer VALUES("Lara",7423568923,993,"2024-08-10","Nuggets");
INSERT INTO customer VALUES("Mini",8563632314,1001,"2024-08-11","Orange Juice");   -- adding records to customer table

 
--- Selecting all records from a table ---------------------------------------------------------------------------------------------------------------

SELECT* FROM food_list;                                                        -- displaying all tuples from food_list table
SELECT* FROM customer;                                                         -- displaying all tuples from cutomer table

--- Altering the table ------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE customer add serial_num INT;                                      -- adding a column name "serial_num" in customer table
ALTER TABLE customer CHANGE COLUMN serial_num s_num INT;                      -- changing the name of the colum from "serial_num" to "s_num"
DESC customer;                                                                -- describing the table customer
ALTER TABLE customer DROP COLUMN s_num;                                       -- dropping the column s_num from customer table

--- view of a table ----------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW customer_view AS SELECT food_name,price FROM food_list;           -- creating view "customer_view" 
SELECT* FROM customer_view;                                                   -- displaying "customer view"
DROP VIEW customer_view;                                                      -- deleting "customer view"

--- Using constraints --------------------------------------------------------------------------------------------------------------------------------

SELECT* FROM food_list WHERE price=110;                                                         -- selecting the columns where price=110 
SELECT customer_name,phone_number,order_date FROM customer WHERE order_date IN( "2024-08-10");  -- displaying columns where the order date is 10.8.24
SELECT* FROM food_list ORDER BY price DESC;                                                     -- displaying column by ordering price in descending
SELECT max(price) as maxi_price FROM food_list;                                                 -- finding maximum price from price column
SELECT* FROM food_list WHERE food_type like "VEG%";                                     -- displaying columns where food_type starts with VEG
SELECT* FROM food_list WHERE food_category not like "%Main Course";                     -- displaying columns where food_type not of type main course
SELECT* FROM  food_list WHERE price BETWEEN 150 and 200;                                -- displaying columns where the price ranging between 150,200

--- Joinning of two tables----------------------------------------------------------------------------------------------------------------------------

SELECT food_list.food_name,food_list.price,customer.customer_name,customer.phone_number,customer.ordered_food
FROM food_list
INNER JOIN  customer ON food_list.food_name=customer.ordered_food;                    -- displaying the price of the ordered food by customer

SELECT food_list.food_name,food_list.price,customer.customer_name,customer.phone_number,customer.ordered_food
FROM food_list
LEFT JOIN  customer ON food_list.food_name=customer.ordered_food;                   -- displays all food items and the details of customer ordered it

SELECT food_list.food_name,food_list.price,customer.customer_name,customer.phone_number,customer.ordered_food
FROM food_list
RIGHT JOIN  customer ON food_list.food_name=customer.ordered_food;                 -- displays the food items ordered according to food list

---- Displaying tables from particular schema --------------------------------------------------------------------------------------------------------

SHOW TABLES FROM cafe;                      -- Displays tables that are created under customer_and_product_analysis database


------------------------------------------------------ END-------------------------------------------------------------------------------------------
