# Write your MySQL query statement below
with cte as (Select id,student,(case when id%2!=0 then (lead(student) over (order by id)) else null end) as lea,(case when id%2=0 then (lag(student) over (order by id)) else null end) as lea2
from seat)
select id, coalesce(lea,lea2,student) as student from cte

