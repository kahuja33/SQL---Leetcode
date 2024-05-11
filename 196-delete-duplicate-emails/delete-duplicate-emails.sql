# Write your MySQL query statement below
Delete from person where id in (
    Select id from(
Select id,email, rank() over (partition by email order by id) as rnk from person) as temp where rnk>1)