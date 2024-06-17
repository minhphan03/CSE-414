SELECT W.day_of_week as day_of_week, AVG(F.arrival_delay) as delay
FROM FLIGHTS F INNER JOIN WEEKDAYS W ON W.did = F.day_of_week_id
GROUP BY day_of_week_id
ORDER BY AVG(arrival_delay) DESC
LIMIT 1;