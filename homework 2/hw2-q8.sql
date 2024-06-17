SELECT C.name as name, SUM(F.departure_delay) as delay
FROM FLIGHTS F INNER JOIN CARRIERS C ON F.carrier_id = C.cid
GROUP BY F.carrier_id