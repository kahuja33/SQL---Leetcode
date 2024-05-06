With cte as (select product_id from products group by product_id),
cte2 as (Select product_id from(
Select product_id,new_price,rank() over(partition by product_id order by change_date desc)
as rnk from products where change_date<="2019-08-16") as temp where rnk=1
)
Select product_id,new_price as price from(
Select product_id,new_price,rank() over(partition by product_id order by change_date desc)
as rnk from products where change_date<="2019-08-16") as temp where rnk=1
union
select a.product_id,10 as price from cte a left join cte2 b on a.product_id=b.product_id where b.product_id is null

