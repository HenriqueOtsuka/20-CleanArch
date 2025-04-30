-- mysql create table order with id, price, tax and final_price
CREATE TABLE IF NOT EXISTS `orders` (
    id varchar(36) NOT NULL PRIMARY KEY,
    price float NOT NULL,
    tax float NOT NULL,
    final_price float NOT NULL
);
