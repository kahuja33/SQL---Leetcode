# Write your MySQL query statement below
#With cte as (Select product_id,year,sum(quantity) as quantity,price from sales group by product_id,year),
#cte2 as (Select product_id,min(year) as year from sales group by product_id) 
#Select a.product_id,a.year as first_year,a.quantity,a.price from cte a inner join cte2 b on a.product_id=b.product_id and a.year=b.year

#With cte as (Select product_id,min(year) as year from sales group by product_id) 
#Select a.product_id,a.year,sum(a.quantity) as quantity,a.price from sales a inner join cte b on 
#a.product_id=b.product_id and a.year=b.year

WITH CTE AS (
    SELECT product_id, MIN(year) AS minyear FROM Sales 
    GROUP BY product_id 
)

SELECT s.product_id, s.year AS first_year, s.quantity, s.price 
FROM Sales s
INNER JOIN CTE ON cte.product_id = s.product_id  AND s.year = cte.minyear;