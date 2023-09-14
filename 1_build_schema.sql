create database ex_1;
use ex_1;

CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);


show tables;
select * from manufacturers;
select * from products;

-- 1.1 Select the names of all the products in the store.
select name from products;

-- 1.2 Select the names and the prices of all the products in the store.
select name, price from products;

-- 1.3 Select the name of the products with a price less than or equal to $200.
select name,price from products 
where price <= 200 ;

-- 1.4 Select all the products with a price between $60 and $120.
select * from products where price between 60 and 120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
select name, price*100 from products;

-- 1.6 Compute the average price of all the products.
select avg(price) from products;


-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
select avg(price), Manufacturer from products
where Manufacturer =2;


-- 1.8 Compute the number of products with a price larger than or equal to $180.
select price from products
where price >= 180;

select name,price from products
where price >= 180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, 
-- and sort first by price (in descending order), and then by name (in ascending order).
select name,price from products
where price >= 180
order by price desc, name;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
select * from products right join manufacturers
on products.Manufacturer =manufacturers.code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
select p.name, p.price,m.name from products p, manufacturers m;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
select avg(price),Manufacturer from products group by manufacturer;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
select avg(price),m.name, p.name from products p join manufacturers m
on M.code=p.Manufacturer group by m.name;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
select name from manufacturers where (select avg(price) from products where price >=150);



-- 1.15 Select the name and price of the cheapest product.

select name, price from products order by price limit 1 ;

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
select m.name, p.price from manufacturers m   left join products p 
on m.Code=p.Manufacturer order by p.price desc limit 1;

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.

insert into Products (code,name,price,manufacturer) values(11,'Loudspeaker',70,2);
select * from products;

-- 1.18 Update the name of product 8 to "Laser Printer".
update products set name= "Laser Printer" where name= "Printer";
select * from products;

-- 1.19 Apply a 10% discount to all products.
update products set price= price-(price *10/100);
select * from products;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
update products set price = price-(price*10/100) where price >=120;
select * from products;


