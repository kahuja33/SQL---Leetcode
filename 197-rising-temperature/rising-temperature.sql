# Write your MySQL query statement below
With temp As (select id ,RecordDate,Temperature,
LAG (Temperature) OVER (ORDER BY RecordDate) AS prev_Temperature,
LAG(recorddate) over(Order by RecordDate) as prev_record_date
from Weather )
select id from temp where temperature>prev_temperature and datediff(recorddate,prev_record_date)=1 