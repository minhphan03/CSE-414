select distinct C.name as carrier
from CARRIERS C right join FLIGHTS F on C.cid = F.carrier_id
where F.origin_city = 'Seattle WA' and F.dest_city = 'San Francisco CA'
order by carrier asc;

-- number of rows returned: 4
-- execution time: 16ms

--Alaska Airlines Inc.
--SkyWest Airlines Inc.
--United Air Lines Inc.
--Virgin America