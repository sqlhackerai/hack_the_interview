SELECT 
    fecha,
    categoria,
    total,
    AVG(total) OVER (PARTITION BY categoria ORDER BY fecha 
                     ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS media_movil
FROM 
    ventas_categoria
ORDER BY 
    categoria, fecha;
