select F.dest_city 'dest_city'
from FLIGHTS F
where F.dest_city not in (
	SELECT F2.dest_city from FLIGHTS F1
	join FLIGHTS F2 on F1.dest_city = F2.origin_city
	where F1.origin_city = 'Seattle WA'
) and F.dest_city not in (
	SELECT distinct dest_city from FLIGHTS where origin_city = 'Seattle WA'
)
group by F.dest_city
order by F.dest_city;

-- number of rows returned: 3
-- execution time: 1540 ms

--Devils Lake ND
--Hattiesburg/Laurel MS
--St. Augustine FL