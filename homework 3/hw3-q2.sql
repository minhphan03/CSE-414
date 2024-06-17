select distinct origin_city as 'city'
from FLIGHTS F
where canceled = 0
group by origin_city
having max(actual_time) <180
order by origin_city asc;

-- number of rows returned: 109
-- execution time: 121ms

--Aberdeen SD
--Abilene TX
--Alpena MI
--Ashland WV
--Augusta GA
--Barrow AK
--Beaumont/Port Arthur TX
--Bemidji MN
--Bethel AK
--Binghamton NY
--Brainerd MN
--Bristol/Johnson City/Kingsport TN
--Butte MT
--Carlsbad CA
--Casper WY
--Cedar City UT
--Chico CA
--College Station/Bryan TX
--Columbia MO
--Columbus GA