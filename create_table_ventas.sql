CREATE TABLE ventas (
    id SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    total NUMERIC(10, 2) NOT NULL
);
