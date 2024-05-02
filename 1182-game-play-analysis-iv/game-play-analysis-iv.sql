# Write your MySQL query statement below

#Use a lag window function and count the difference between the days order by event date also use a rank to pick up only first observation

#then do a count of players and divide by select count(distinct player_id) from.... group by player_id
With cte as (
select player_id,datediff(rw,event_date) as diff from(
select player_id,event_date,lead(event_date,1) over (partition by player_id order by event_date) as rw ,rank() over (partition by player_id order by event_date) as rw2 from activity) as temp where rw2=1 and datediff(rw,event_date)=1)

select round(count(*)/
(select count(distinct player_id) from activity),2) as fraction from cte
