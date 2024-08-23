select v.fecha, categoria, total, sum(total) over(partition by categoria order by fecha asc) 
	from ventas_categoria v 
order by categoria, fecha