DROP TABLE Merchants;
DROP TABLE Tags;
DROP TABLE Transactions;


CREATE TABLE Merchants(
  ID SERIAL4 primary key,
  name VARCHAR(255)
);



CREATE TABLE Tags(
  ID SERIAL4  primary key,
  name VARCHAR(255)
);



CREATE TABLE Transactions(
  ID SERIAL4 primary key,
  merchant_id int4 REFERENCES merchants(id),
  tag_id int4 REFERENCES tags(id),
  transaction_date date,
  value int4
);

