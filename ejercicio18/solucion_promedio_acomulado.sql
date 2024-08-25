SELECT 
    fecha,
    categoria,
    producto,
    total,
    AVG(total) OVER (PARTITION BY categoria, producto ORDER BY fecha) AS promedio_acumulado
FROM 
    ventas
ORDER BY 
    categoria, producto, fecha;