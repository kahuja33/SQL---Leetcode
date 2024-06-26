# Write your MySQL query statement below

with cte as(select count(user_id) from users)
select contest_id,round(count(user_id)*100/(select * from cte),2) as percentage from(
Select a.user_id,a.user_name,b.contest_id from Users a inner join Register b on a.user_id=b.user_id) as temp group by contest_id order by percentage desc,contest_id
