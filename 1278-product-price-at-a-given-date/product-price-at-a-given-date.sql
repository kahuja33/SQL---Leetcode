#part 1: Identify all the distinct Product Id
#part 2: Find the latest price of the product till the date 16-8-2019
#part 3: if the product has no new price before or on 16-8-2019, then assign $10 as an original price
#part 4: either use minus operation or union to combine both of the tables

#part 2 - part 1
#remaining part assign as $10 and do the Union

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
