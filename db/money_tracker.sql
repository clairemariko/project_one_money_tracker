CREATE TABLE merchants(
ID SERIAL4 primary key,
name       VARCHAR(255)
);



CREATE TABLE tags(
ID SERIAL4  primary key,
name        VARCHAR(255)
);



CREATE TABLE transactions(
ID SERIAL4            primary key,
merchant_id           int4 REFERENCES merchants(id),
tag_id                int4 REFERENCES tags(id),
transaction_date      date,
value                 int4
);