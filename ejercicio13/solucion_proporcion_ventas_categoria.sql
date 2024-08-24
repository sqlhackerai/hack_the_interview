WITH ventas_categoria AS (
    SELECT 
        fecha,
        categoria,
        SUM(total) OVER (PARTITION BY categoria, fecha) AS total_categoria_dia
    FROM 
        ventas
)
SELECT 
    v.fecha,
    v.categoria,
    v.producto,
    v.total,
    vc.total_categoria_dia,
    ROUND(100.0 * v.total / vc.total_categoria_dia, 2) AS porcentaje_ventas_producto
FROM 
    ventas v
JOIN 
    ventas_categoria vc
    ON v.fecha = vc.fecha AND v.categoria = vc.categoria
ORDER BY 
    v.categoria, v.fecha, porcentaje_ventas_producto DESC;