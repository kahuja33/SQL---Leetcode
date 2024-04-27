
with cte as(
select a.user_id,sum(case when b.action="confirmed" then 1 else 0 end) as coun, case when count(b.action)=0 then 1 else count(b.action) end as tot from signups a left join confirmations b on a.user_id=b.user_id group by user_id)
select user_id, round(coun/tot,2) as confirmation_rate from cte
