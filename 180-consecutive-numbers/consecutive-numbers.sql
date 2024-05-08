# Write your MySQL query statement below
#with cte as (
#Select num,lead(num) over (order by id) as nxt,lag(num) over (order by id) as prev from logs)
#select num as consecutivenums from cte where num=nxt and nxt=prev group by num
SELECT l1.num as consecutivenums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.Id = l2.Id - 1
    AND l2.Id = l3.Id - 1
    AND l1.num=l2.num
    AND l2.num=l3.num
group by l1.num