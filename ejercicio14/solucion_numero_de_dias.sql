WITH ventas_con_umbral AS (
    SELECT 
        fecha,
        categoria,
        total,
        CASE 
            WHEN total > 500 THEN fecha
            ELSE NULL
        END AS fecha_ultima_venta_mayor
    FROM 
        ventas
),
dias_desde_ultima_venta_mayor AS (
    SELECT 
        fecha,
        categoria,
        total,
        fecha_ultima_venta_mayor,
        MAX(fecha_ultima_venta_mayor) OVER (PARTITION BY categoria ORDER BY fecha ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS fecha_ultima_venta_acumulada
    FROM 
        ventas_con_umbral
)
SELECT 
    fecha,
    categoria,
    total,
    fecha_ultima_venta_acumulada,
    COALESCE(DATE_PART('day', fecha - fecha_ultima_venta_acumulada), 0) AS dias_desde_ultima_venta_mayor
FROM 
    dias_desde_ultima_venta_mayor
ORDER BY 
    categoria, fecha;