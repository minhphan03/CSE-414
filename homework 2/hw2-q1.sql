select distinct flight_num as flight_num
from FLIGHTS F inner join CARRIERS C on F.carrier_id = C.cid
where F.day_of_week_id = 1 
	and C.name = 'Alaska Airlines Inc.' 
	and F.origin_city = 'Seattle WA' 
	and F.dest_city = 'Boston MA';