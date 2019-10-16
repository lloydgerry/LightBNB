  DROP TABLE users

CREATE TABLE property_reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INTEGER,
  reservation_id INTEGER,
  property_id INTEGER,
  rating SMALLINT,
  message TEXT
)

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(100),
  email VARCHAR(255),
  password VARCHAR(255)
)
