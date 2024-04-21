# Write your MySQL query statement below
With temp as (select id ,recorddate,temperature,
LAG (temperature) OVER (ORDER BY recordDate) AS prev_temp,
LAG(recorddate) over(Order by recordDate) as prev_record_date
from weather)
select id from temp where temperature>prev_temp and datediff(recorddate,prev_record_date)=1 