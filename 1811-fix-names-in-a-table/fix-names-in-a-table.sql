# Write your MySQL query statement below
Select user_id,concat(upper(Substring(name,1,1)),lower(substring(name,2,10))) as name from Users order by user_id