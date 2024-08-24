
SELECT 
    fecha,
    categoria,
    total,
    RANK() OVER (PARTITION BY categoria ORDER BY total DESC) AS rank_ventas,
    DENSE_RANK() OVER (PARTITION BY categoria ORDER BY total DESC) AS dense_rank_ventas,
    ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY total DESC) AS row_number_ventas
FROM 
    ventas_categoria
ORDER BY 
    categoria, rank_ventas;