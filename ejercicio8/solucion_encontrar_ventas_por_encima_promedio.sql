WITH ventas_con_promedio AS (
    SELECT 
        fecha,
        categoria,
        total,
        AVG(total) OVER (PARTITION BY categoria) AS promedio_categoria
    FROM 
        ventas_categoria
)
SELECT 
    fecha,
    categoria,
    total,
    promedio_categoria,
    CASE 
        WHEN total > promedio_categoria THEN 'Venta por Encima del Promedio'
        ELSE 'Venta por Debajo del Promedio'
    END AS clasificacion_venta,
    COUNT(CASE WHEN total > promedio_categoria THEN 1 END) OVER (PARTITION BY categoria ORDER BY fecha) AS dias_sobre_promedio
FROM 
    ventas_con_promedio
ORDER BY 
    categoria, fecha;