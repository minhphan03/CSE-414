select C.name as name, 
	F1.flight_num as f1_flight_num, 
	F1.origin_city as f1_origin_city,
	F1.dest_city as f1_dest_city,
	F1.actual_time as f1_actual_time,
	F2.flight_num as f2_flight_num, 
	F2.origin_city as f2_origin_city,
	F2.dest_city as f2_dest_city,
	F2.actual_time as f2_actual_time
from FLIGHTS F1, FLIGHTS F2, CARRIERS C
WHERE F1.dest_city = F2.origin_city
	and F1.carrier_id = C.cid
	and F2.carrier_id = C.cid
	and F1.carrier_id = F2.carrier_id
	and F1.origin_city='Seattle WA' 
	and F2.dest_city='Boston MA'
	and F1.month_id = 7
	and F2.month_id = 7
	and F1.day_of_month = 15
	and F2.day_of_month = 15
	and F1.actual_time + F2.actual_time < 420;