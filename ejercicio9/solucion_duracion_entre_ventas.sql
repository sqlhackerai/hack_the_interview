SELECT 
    fecha,
    categoria,
    total,
    LAG(fecha) OVER (PARTITION BY categoria ORDER BY fecha) AS fecha_anterior,
    EXTRACT(EPOCH FROM (fecha - LAG(fecha) OVER (PARTITION BY categoria ORDER BY fecha))) / 3600 AS horas_entre_ventas
FROM 
    ventas
ORDER BY 
    categoria, fecha;