-- Part 1
CREATE TABLE frumbleData (
name varchar(256) PRIMARY KEY,
discount varchar(10),
month varchar(10),
price int
)

-- import data

-- Part 2
-- search for non-trivial functional dependencies

SELECT * FROM frumbleData A, frumbleData B
where A.name = B.name and A.price != B.price;
-- this query returns no result
-- through this query we can see that name can define price, or the same name cannot have different prices at the same time
-- FD: name -> price

SELECT * FROM frumbleData A, frumbleData B
where A.month = B.month and A.discount != B.discount;
-- this query returns no result
-- through this query we can see that month can define amount of discount, or the discount percentage depends on the month of the year
-- FD: month -> discount

-- from two forward dependencies above we can show that
-- FD: name, month -> discount, price

SELECT * FROM frumbleData A, frumbleData B
where A.name = B.name and A.discount = B.discount and A.month != B.month and A.price != B.price
-- FD: name, discount -> month, price

SELECT * FROM frumbleData A, frumbleData B
where A.month = B.month and A.price = B.price and A.name != B.name and A.discount != B.discount;
-- FD: month, price -> name, discount

-- This functional dependency does not exist: discount -> month
SELECT * FROM frumbleData A, frumbleData B
where A.discount = B.discount and A.month != B.month
LIMIT 10;
-- This query return results meaning that with the same discount percentage there are different months applying the same amount of discount
-- Therefore we cannot depend on the discount percentage to define the month


-- All functional dependencies: 
-- name -> price 
-- month -> discount
-- name, discount -> month, price
-- month, price -> discount, name


-- Part 3
-- R(name, price, discount, month)
-- {name}+ = {name, price} != {name} or {name, price, discount, month} is not in BCNF.
-- Decompose into R1(name, price) and R2(name, discount, month)

-- R1 is in BCNF form. R2 is not. Decompose R2 into R21(discount, month) and R2(month, name)

CREATE TABLE NamePriceMapping (
	name VARCHAR(200) PRIMARY KEY,
	price int
);

CREATE TABLE DiscountMonthMapping (
	discount varchar(10),
	month varchar(10) PRIMARY KEY
);

CREATE TABLE MonthNameMapping (
	month varchar(10),
	name varchar(200),
	FOREIGN KEY(month) REFERENCES DiscountMonthMapping(month),
	FOREIGN KEY(name) REFERENCES NamePriceMapping(name)
);

-- Part 4
INSERT INTO NamePriceMapping
SELECT DISTINCT name, price FROM frumbleData;

SELECT COUNT(*) FROM NamePriceMapping;
-- 36 rows

INSERT INTO DiscountMonthMapping
SELECT DISTINCT discount, month FROM frumbleData;

SELECT COUNT(*) FROM DiscountMonthMapping;
-- 12 rows

INSERT INTO MonthNameMapping
SELECT DISTINCT month, name from frumbleData;

SELECT COUNT(*) FROM MonthNameMapping;
-- 426 rows