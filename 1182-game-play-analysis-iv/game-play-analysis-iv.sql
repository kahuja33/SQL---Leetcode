# Write your MySQL query statement below

#Use a lag window function and count the difference between the days order by event date also use a rank to pick up only first observation

#then do a count of players and divide by select count(distinct player_id) from.... group by player_id
#With cte as (
#select player_id,datediff(rw,event_date) as diff from(
#select player_id,event_date,lead(event_date,1) over (partition by player_id order by event_date) as rw ,rank() over (partition by player_id order by event_date) as rw2 from activity) as temp where rw2=1 and datediff(rw,event_date)=1)

#select round(count(*)/
#(select count(distinct player_id) from activity),2) as fraction from cte

SELECT ROUND(COUNT(DISTINCT act1.player_id) / (SELECT COUNT(DISTINCT player_id) 
                                               FROM Activity), 2) AS fraction
FROM Activity act1
INNER JOIN Activity act2 ON 
DATEDIFF(act1.event_date, act2.event_date) = 1 AND act1.player_id = act2.player_id
WHERE (act2.player_id, act2.event_date) IN (SELECT player_id, MIN(event_date) 
                                            FROM Activity 
                                            GROUP BY player_id
                                           )