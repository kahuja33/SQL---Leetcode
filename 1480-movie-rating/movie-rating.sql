# Write your MySQL query statement below
#need to do union of 2 different queries
/*1st query - 
inner join user and movie rating tables
windows function*/
(Select a.name as results from users a inner join movierating b on a.user_id=b.user_id group by a.user_id order by count(a.user_id) desc,a.name asc limit 1)
union all
(Select  a.title as results from movies a inner join movierating b on a.movie_id=b.movie_id where EXTRACT(YEAR_MONTH from b.created_at) in (202002) group by a.title order by (sum(b.rating)/count(b.rating)) desc, a.title asc limit 1)

