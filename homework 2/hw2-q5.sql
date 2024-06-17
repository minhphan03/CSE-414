SELECT C.name as name, SUM(F.canceled)*1.0/COUNT(*)*100 as percentage
FROM FLIGHTS F INNER JOIN CARRIERS C ON F.carrier_id = C.cid
WHERE F.origin_city = 'Seattle WA'
GROUP BY F.carrier_id
HAVING SUM(F.canceled)*1.0/COUNT(*) > 0.005;