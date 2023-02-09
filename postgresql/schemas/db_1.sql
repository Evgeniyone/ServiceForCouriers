DROP SCHEMA IF EXISTS hello_schema CASCADE;

CREATE SCHEMA IF NOT EXISTS hello_schema;

CREATE TABLE IF NOT EXISTS hello_schema.users (
    name TEXT PRIMARY KEY,
    count INTEGER DEFAULT(1)
);

CREATE TABLE IF NOT EXISTS hello_schema.couriers (
    courier_id SERIAL PRIMARY KEY,
    courier_type TEXT,
    regions TEXT,
    working_hours TEXT,
    assign_time TIMESTAMP DEFAULT now(),
    last_time TIMESTAMP DEFAULT now(),
    orders TEXT,
    last_assigncourier_type TEXT,
    earnings INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS hello_schema.orders (
    order_id SERIAL PRIMARY KEY,
    weight FLOAT,
    region INTEGER,
    delivey_hours TEXT,
    taken BOOL
);

CREATE TABLE IF NOT EXISTS hello_schema.couriers_value
(
    courier_id   SERIAL REFERENCES hello_schema.couriers PRIMARY KEY,
    region       INTEGER,
    summary_time FLOAT   DEFAULT 0,
    counts       INTEGER DEFAULT 0
);