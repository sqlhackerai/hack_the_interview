WITH ventas_con_cambio AS (
    SELECT 
        fecha,
        categoria,
        total,
        LAG(total) OVER (PARTITION BY categoria ORDER BY fecha) AS total_dia_anterior
    FROM 
        ventas
)
SELECT 
    fecha,
    categoria,
    total,
    total_dia_anterior,
    ROUND((total - total_dia_anterior) * 100.0 / total_dia_anterior, 2) AS crecimiento_porcentual
FROM 
    ventas_con_cambio
WHERE 
    total_dia_anterior IS NOT NULL
ORDER BY 
    categoria, crecimiento_porcentual DESC;