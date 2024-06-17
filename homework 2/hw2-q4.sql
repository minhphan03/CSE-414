select distinct C.name as name
from CARRIERS C inner join FLIGHTS F
ON C.cid = F.carrier_id
GROUP BY F.month_id, F.day_of_month, C.name
HAVING COUNT(*) > 1000;

