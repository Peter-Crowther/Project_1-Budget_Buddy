DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;



CREATE TABLE tags
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE merchants
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions
(
  id SERIAL4 PRIMARY KEY,
  amount INT4,
  month VARCHAR(255),
  merchant_id INT4 REFERENCES merchants(id),
  tag_id INT4 REFERENCES tags(id)
);
