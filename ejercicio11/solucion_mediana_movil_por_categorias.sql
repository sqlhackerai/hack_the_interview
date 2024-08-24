SELECT 
    fecha,
    categoria,
    total,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total) OVER (PARTITION BY categoria ORDER BY fecha ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS mediana_movil
FROM 
    ventas
ORDER BY 
    categoria, fecha;