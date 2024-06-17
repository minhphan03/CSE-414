select c.dest_city as city
from FLIGHTS F
join (select origin_city, dest_city from FLIGHTS
	where dest_city != 'Seattle WA' and dest_city not in
		(select dest_city from FLIGHTS
		where origin_city = 'Seattle WA')
		group by origin_city, dest_city) c
	on F.dest_city = c.origin_city
where f.origin_city = 'Seattle WA'
group by c.dest_city
order by c.dest_city;

-- number of rows returned: 256 rows
-- execution time: 482 ms

--Aberdeen SD
--Abilene TX
--Adak Island AK
--Aguadilla PR
--Akron OH
--Albany GA
--Albany NY
--Alexandria LA
--Allentown/Bethlehem/Easton PA
--Alpena MI
--Amarillo TX
--Appleton WI
--Arcata/Eureka CA
--Asheville NC
--Ashland WV
--Aspen CO
--Atlantic City NJ
--Augusta GA
--Bakersfield CA
--Bangor ME