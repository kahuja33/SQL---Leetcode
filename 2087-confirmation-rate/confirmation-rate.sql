# Write your MySQL query statement below
with cte as(
select a.user_id,sum(case when b.action="confirmed" then 1 else 0 end) as coun, case when count(b.action)=0 then 1 else count(b.action) end as tot from signups a left join confirmations b on a.user_id=b.user_id group by user_id)
select user_id, round(coun/tot,2) as confirmation_rate from cte

#select a.user_id,b.action,count(b.action) over(partition by user_id, b.action order by a.user_id) as coun,count(b.action) over(partition by user_id order by a.user_id) as tot from signups a left join confirmations b on a.user_id=b.user_id) 

#select user_id,(coun/tot) as confirmation_rate from cte where action="confirmed" group by user_id

#select user_id,case when action="timeout" then coun=0 else coun end, tot from  cte 