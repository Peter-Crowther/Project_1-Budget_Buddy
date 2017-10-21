DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;



CREATE TABLE tags
(
  id SERIAL4 PRIMARY KEY,
  tag_name VARCHAR(255)
);

CREATE TABLE merchants
(
  id SERIAL4 PRIMARY KEY,
  merchant_name VARCHAR(255)
);

CREATE TABLE transactions
(
  id SERIAL4 PRIMARY KEY,
  amount INT4,
  merchant_id INT4 REFERENCES merchants(id),
  tag_it INT4 REFERENCES tags(id)
);
