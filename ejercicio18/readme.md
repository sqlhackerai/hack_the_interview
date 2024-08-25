Aquí tienes otro desafío SQL utilizando funciones de ventana (window functions) para la tabla `ventas` con categorías. Este desafío se enfoca en calcular el promedio acumulado de las ventas por categoría y producto.

### Desafío: Calcular el promedio acumulado por categoría y producto

**Descripción:** Para cada venta en la tabla `ventas`, calcula el promedio acumulado de las ventas por categoría y producto, ordenado por fecha. Esto te permitirá ver cómo varía el promedio de ventas a lo largo del tiempo para cada producto dentro de cada categoría.

### Query SQL:

```sql
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
```

### Explicación:
- **`AVG(total) OVER (PARTITION BY categoria, producto ORDER BY fecha)`**: Esta función de ventana calcula el promedio acumulado de las ventas para cada combinación de `categoria` y `producto`, ordenado por la fecha de la venta.
- **`PARTITION BY categoria, producto`**: Divide los datos en particiones basadas en `categoria` y `producto`.
- **`ORDER BY fecha`**: Dentro de cada partición, las ventas se ordenan por la fecha para calcular el promedio acumulado de forma cronológica.

### Ejemplo de resultado:

| fecha       | categoria   | producto   | total  | promedio_acumulado |
|-------------|-------------|------------|--------|--------------------|
| 2024-01-01  | Abarrotes   | Arroz      | 162.43 | 162.43             |
| 2024-01-03  | Abarrotes   | Arroz      | 405.30 | 283.87             |
| 2024-01-13  | Abarrotes   | Arroz      | 94.79  | 220.17             |
| 2024-01-20  | Abarrotes   | Arroz      | 79.31  | 185.46             |
| 2024-01-21  | Abarrotes   | Arroz      | 287.61 | 205.09             |

Este desafío te ayudará a practicar el uso de funciones de ventana para cálculos acumulativos en SQL y te permitirá explorar cómo las ventas promedio cambian con el tiempo dentro de cada categoría y producto.