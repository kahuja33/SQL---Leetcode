# Write your MySQL query statement below

With cte as (
select player_id,datediff(rw,event_date) as diff from(
select player_id,event_date,lead(event_date,1) over (partition by player_id order by event_date) as rw ,rank() over (partition by player_id order by event_date) as rw2 from activity) as temp where rw2=1 and datediff(rw,event_date)=1)

select round(count(*)/
(select count(distinct player_id) from activity),2) as fraction from cte

