WITH ventas_acumuladas AS (
    SELECT 
        fecha,
        categoria,
        total,
        SUM(total) OVER (PARTITION BY categoria ORDER BY fecha) AS ventas_acumuladas
    FROM 
        ventas
)
SELECT 
    fecha,
    categoria,
    total,
    ventas_acumuladas,
    RANK() OVER (PARTITION BY fecha ORDER BY ventas_acumuladas DESC) AS rank_ventas
FROM 
    ventas_acumuladas
ORDER BY 
    fecha, rank_ventas;