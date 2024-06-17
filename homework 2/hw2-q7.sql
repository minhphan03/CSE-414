SELECT capacity as capacity
FROM FLIGHTS F INNER JOIN CARRIERS C ON F.carrier_id = C.cid
WHERE ((F.origin_city = 'Seattle WA' and F.dest_city = 'San Francisco CA') or 
	(F.origin_city = 'San Francisco CA' and F.dest_city = 'Seattle WA'))
	and F.day_of_month = 10
	and F.month_id = 7
