Aquí tienes otro desafío SQL para la tabla `ventas` utilizando funciones de ventana:

### Desafío: Encontrar la primera y última venta por categoría

**Descripción:** Para cada categoría, encuentra la primera y última venta (según la fecha) y compara los montos de esas ventas. El objetivo es calcular la diferencia entre el monto de la primera venta y la última venta dentro de cada categoría.

### Query SQL:

```sql
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
```

### Explicación:
- **`FIRST_VALUE(total) OVER (PARTITION BY categoria ORDER BY fecha)`**: Obtiene el valor del total de la primera venta dentro de cada categoría, según la fecha.
- **`LAST_VALUE(total) OVER (PARTITION BY categoria ORDER BY fecha ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)`**: Obtiene el valor del total de la última venta dentro de cada categoría. La cláusula `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING` asegura que se tome la última venta en la ventana completa.
- **`diferencia_ventas`**: Calcula la diferencia entre la primera y última venta en cada categoría.
- **`GROUP BY categoria`**: Agrupa los resultados por categoría.

### Ejemplo de resultado:

| categoria   | primera_venta_fecha | ultima_venta_fecha | primera_venta_total | ultima_venta_total | diferencia_ventas |
|-------------|---------------------|--------------------|---------------------|--------------------|-------------------|
| Abarrotes   | 2024-01-01          | 2024-01-31         | 162.43              | 257.99             | 95.56             |
| Cárnicos    | 2024-01-02          | 2024-01-30         | 233.32              | 73.38              | -159.94           |
| Ferretería  | 2024-01-01          | 2024-01-31         | 294.10              | 387.36             | 93.26             |

Este desafío es útil para entender cómo las ventas evolucionan dentro de cada categoría a lo largo del tiempo, y cómo comparar puntos clave (primera y última venta) usando funciones de ventana.