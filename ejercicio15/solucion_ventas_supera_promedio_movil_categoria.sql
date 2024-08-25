WITH promedio_movil AS (
    SELECT 
        fecha,
        categoria,
        producto,
        total,
        AVG(total) OVER (PARTITION BY categoria ORDER BY fecha ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS promedio_movil
    FROM 
        ventas
)
SELECT 
    fecha,
    categoria,
    producto,
    total,
    promedio_movil,
    CASE 
        WHEN total > promedio_movil THEN 'Por Encima del Promedio'
        ELSE 'Por Debajo o Igual al Promedio'
    END AS comparacion
FROM 
    promedio_movil
ORDER BY 
    categoria, fecha;

