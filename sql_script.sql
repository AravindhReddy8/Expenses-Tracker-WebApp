-- PostgreSQL Forward Engineering

-- Drop schema if exists and create a new one
DROP SCHEMA IF EXISTS expenses_tracker CASCADE;
CREATE SCHEMA expenses_tracker;
SET search_path TO expenses_tracker;

-- Table: category
CREATE TABLE IF NOT EXISTS category (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255)
);

-- Table: client
CREATE TABLE IF NOT EXISTS client (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255),
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

-- Table: role
CREATE TABLE IF NOT EXISTS role (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255)
);

-- Table: user
CREATE TABLE IF NOT EXISTS "user" (
  id SERIAL PRIMARY KEY,
  password VARCHAR(255),
  user_name VARCHAR(255),
  client_id INTEGER UNIQUE,
  enabled BOOLEAN,
  CONSTRAINT fk_user_client FOREIGN KEY (client_id) REFERENCES client(id)
);

-- Table: expense
CREATE TABLE IF NOT EXISTS expense (
  id SERIAL PRIMARY KEY,
  amount INTEGER,
  date_time VARCHAR(255),
  description VARCHAR(400),
  category_id INTEGER,
  client_id INTEGER,
  CONSTRAINT fk_expense_category FOREIGN KEY (category_id) REFERENCES category(id),
  CONSTRAINT fk_expense_client FOREIGN KEY (client_id) REFERENCES client(id)
);

-- Table: users_roles
CREATE TABLE IF NOT EXISTS users_roles (
  user_id INTEGER NOT NULL,
  role_id INTEGER NOT NULL,
  CONSTRAINT fk_users_roles_user FOREIGN KEY (user_id) REFERENCES "user"(id),
  CONSTRAINT fk_users_roles_role FOREIGN KEY (role_id) REFERENCES role(id)
);
