select T1.city as origin_city, isnull(T2.cnt,0)*1.0 /T1.cnt as percentage
from (
	select origin_city city, count(fid) cnt
	from FLIGHTS
	where canceled = 0
	group by origin_city
) T1 left join (
	select origin_city city, isnull(count(*),0.0) cnt
	from FLIGHTS
	where canceled = 0 and actual_time < 180
	group by origin_city
) T2 on T1.city = T2.city
order by percentage asc, origin_city asc;

-- number of rows returned: 327 
-- execution time: 223 ms

--Guam TT	0.000000000000
--Pago Pago TT	0.000000000000
--Aguadilla PR	0.288973384030
--Anchorage AK	0.318120805369
--San Juan PR	0.336605316973
--Charlotte Amalie VI	0.395588235294
--Ponce PR	0.409836065573
--Fairbanks AK	0.501165501165
--Kahului HI	0.535144713526
--Honolulu HI	0.547390288236
--San Francisco CA	0.558288645371
--Los Angeles CA	0.560808908229
--Seattle WA	0.576093877922
--Long Beach CA	0.621764395139
--New York NY	0.623718341367
--Kona HI	0.631607929515
--Las Vegas NV	0.649202563720
--Christiansted VI	0.651006711409
--Newark NJ	0.658499710969
--Plattsburgh NY	0.666666666666
