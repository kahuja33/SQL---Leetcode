# Write your MySQL query statement below
With cte as (Select product_id,year,quantity as quantity,price from sales),
cte2 as (Select product_id,min(year) as year from sales group by product_id) 
Select a.product_id,a.year as first_year,a.quantity,a.price from cte a inner join cte2 b on a.product_id=b.product_id and a.year=b.year
