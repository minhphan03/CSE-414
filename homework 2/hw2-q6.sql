SELECT C.name as carrier, MAX(F.price) as max_price
FROM FLIGHTS F INNER JOIN CARRIERS C ON F.carrier_id = C.cid
WHERE (F.origin_city = 'Seattle WA' and F.dest_city = 'New York NY') or 
	(F.origin_city = 'New York NY' and F.dest_city = 'Seattle WA')
GROUP BY C.cid;