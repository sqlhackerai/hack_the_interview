Aquí tienes otro desafío interesante utilizando funciones de ventana en la tabla de ventas con categorías:

### **Desafío: Calcular la Mediana Móvil de Ventas por Categoría**

**Objetivo**: Calcular la mediana móvil de las ventas en un intervalo de tiempo específico para cada categoría. Esto permite suavizar la variabilidad en los datos y resaltar la tendencia central a lo largo del tiempo.

#### **Consulta SQL**
```sql

```

### **Explicación del Desafío**:

1. **Mediana Móvil**: Utilizando `PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total)`, calculas la mediana de las ventas dentro de una ventana de tiempo móvil de 3 días (2 días anteriores y el día actual). Esta función se usa para obtener el percentil 50, que es la mediana.

2. **Partición y Orden**: La consulta está particionada por `categoria` y ordenada por `fecha`, lo que asegura que la mediana se calcule dentro de cada categoría y en orden cronológico.

3. **Ventana Móvil**: La cláusula `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW` define una ventana móvil de 3 días que se desplaza a lo largo del tiempo, permitiendo observar cómo la mediana cambia día a día.

### **Aplicaciones del Desafío**:

- **Análisis de Tendencias**: La mediana móvil es útil para entender la tendencia central en las ventas de una categoría, filtrando los efectos de valores atípicos y fluctuaciones extremas.

- **Optimización de Precios**: Al observar la mediana móvil de las ventas, puedes ajustar los precios para reflejar mejor el comportamiento de la demanda, maximizando así la rentabilidad.

- **Planificación de Inventario**: Este análisis permite identificar patrones estables en las ventas, ayudando a planificar mejor el inventario para mantener el equilibrio entre oferta y demanda.

- **Evaluación del Impacto de Promociones**: Si se implementan promociones o descuentos, la mediana móvil ayuda a medir su impacto sin ser influenciada por picos extremos de ventas.

Este desafío te ayudará a profundizar en la estabilidad y la tendencia central de las ventas dentro de cada categoría, proporcionando una visión más clara de cómo evoluciona la demanda a lo largo del tiempo y ayudando a tomar decisiones más informadas.