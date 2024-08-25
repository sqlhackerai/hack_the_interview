WITH ventas_acumuladas AS (
    SELECT 
        fecha,
        categoria,
        producto,
        total,
        SUM(total) OVER (PARTITION BY categoria, producto ORDER BY fecha) AS ventas_acumuladas
    FROM 
        ventas
)
SELECT 
    fecha,
    categoria,
    producto,
    total,
    ventas_acumuladas,
    RANK() OVER (PARTITION BY categoria ORDER BY ventas_acumuladas DESC) AS ranking_producto
FROM 
    ventas_acumuladas
ORDER BY 
    categoria, ranking_producto, fecha;