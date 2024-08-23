select fecha, total, sum(total) over (order by fecha ) as acomulado from ventas
group by fecha, total