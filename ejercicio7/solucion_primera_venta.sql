SELECT 
    fecha,
    categoria,
    total,
    MIN(total) OVER (PARTITION BY categoria, fecha ORDER BY fecha ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS primera_venta_dia,
    (total - MIN(total) OVER (PARTITION BY categoria, fecha ORDER BY fecha ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)) AS diferencia_venta_primera
FROM 
    ventas_categoria
ORDER BY 
    categoria, fecha, total;