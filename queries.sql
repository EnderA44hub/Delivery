SELECT delivery_status, COUNT(*) as total
FROM olista_data
GROUP BY delivery_status

///////////////////////

SELECT delivery_status,
		COUNT(*) as total,
		ROUND(COUNT(*) * 100.0/5000, 1 ) as porcentaje
FROM olista_data
GROUP BY delivery_status

//////////////////////////

SELECT COUNT(*) as total_pedidos FROM olista_data;

//////////////////////////

SELECT * FROM olista_data LIMIT 10;

/////////////////////////

SELECT purchase_dayofweek, COUNT(*) as total
FROM olista_data
WHERE delivery_status = 'late'
GROUP BY purchase_dayofweek
		
///////////////////////////

SELECT purchase_dayofweek, COUNT(*) as total
FROM olista_data
WHERE delivery_status = 'late'
GROUP BY purchase_dayofweek
ORDER BY total DESC

///////////////////////////

SELECT purchase_hour, COUNT(*) as pedidos_tarde
FROM olista_data
WHERE delivery_status='late'
GROUP BY purchase_hour
ORDER BY pedidos_tarde DESC
LIMIT 5;

///////////////////////////

SELECT purchase_month,
		COUNT(*) as total,
		SUM(CASE WHEN delivery_status = 'late' THEN 1 ELSE 0 END) as tarde,
		ROUND(SUM(CASE WHEN delivery_status = 'late' then 1 ELSE 0 END) * 100.0/COUNT(*),1) as pct_tarde
		from olista_data
		GROUP BY purchase_month
		ORDER BY purchase_month

/////////////////////////////

SELECT purchase_dayofweek, ROUND(AVG(days_diff),1) as promedio_dias
FROM olista_data
WHERE delivery_status = 'late'
GROUP BY purchase_dayofweek
ORDER BY promedio_dias DESC
		
