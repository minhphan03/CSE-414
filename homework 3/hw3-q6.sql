select c.name as carrier
from (select f.carrier_id from FLIGHTS f
		where f.origin_city = 'Seattle WA' and f.dest_city = 'San Francisco CA') temp
inner join CARRIERS c on temp.carrier_id = c.cid
group by c.name
order by carrier asc;

-- number of rows returned: 4
-- execution time:  29ms

--Alaska Airlines Inc.
--SkyWest Airlines Inc.
--United Air Lines Inc.
--Virgin America