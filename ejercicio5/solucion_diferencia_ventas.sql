SELECT 
    fecha,
    categoria,
    total,
    LAG(total) OVER (PARTITION BY categoria ORDER BY fecha) AS total_dia_anterior,
    (total - LAG(total) OVER (PARTITION BY categoria ORDER BY fecha)) AS diferencia_ventas,
    RANK() OVER (PARTITION BY categoria ORDER BY (total - LAG(total) OVER (PARTITION BY categoria ORDER BY fecha)) DESC) AS rank_subida
FROM 
    ventas_categoria
ORDER BY 
    categoria, rank_subida;