SELECT 
    fecha,
    categoria,
    producto,
    total,
    SUM(total) OVER (PARTITION BY categoria, EXTRACT(MONTH FROM fecha), producto) AS total_producto_mes,
    RANK() OVER (PARTITION BY categoria, EXTRACT(MONTH FROM fecha) ORDER BY SUM(total) OVER (PARTITION BY categoria, EXTRACT(MONTH FROM fecha), producto) DESC) AS rank_producto
FROM 
    ventas
ORDER BY 
    categoria, EXTRACT(MONTH FROM fecha), rank_producto;