# Write your MySQL query statement below
#Select ifnull(num,"null") as num from mynumbers group by num having count(num)=1 order by num desc limit 1

select
case when count(num)=1 then num else null end as num
from MyNumbers
group by num
order by num desc limit 1