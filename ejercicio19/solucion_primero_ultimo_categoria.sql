SELECT 
    categoria,
    MIN(fecha) AS primera_venta_fecha,
    MAX(fecha) AS ultima_venta_fecha,
    FIRST_VALUE(total) OVER (PARTITION BY categoria ORDER BY fecha) AS primera_venta_total,
    LAST_VALUE(total) OVER (PARTITION BY categoria ORDER BY fecha ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS ultima_venta_total,
    LAST_VALUE(total) OVER (PARTITION BY categoria ORDER BY fecha ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) - FIRST_VALUE(total) OVER (PARTITION BY categoria ORDER BY fecha) AS diferencia_ventas
FROM 
    ventas
GROUP BY 
    categoria
ORDER BY 
    categoria;