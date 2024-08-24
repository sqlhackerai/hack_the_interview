SELECT 
    fecha,
    categoria,
    total,
    SUM(total) OVER (PARTITION BY categoria) AS total_categoria,
    ROUND((total::decimal / SUM(total) OVER (PARTITION BY categoria)) * 100, 2) AS porcentaje_contribucion
FROM 
    ventas_categoria
ORDER BY 
    categoria, fecha;