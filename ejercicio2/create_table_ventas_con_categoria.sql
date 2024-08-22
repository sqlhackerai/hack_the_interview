CREATE TABLE ventas_categoria (
    id SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    total NUMERIC(10, 2) NOT NULL
);
