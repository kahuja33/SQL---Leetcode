# Write your MySQL query statement below
with te1 as (select count(distinct product_key) as check1 from product),te2 as (select a.customer_id as customer_id, count(distinct a.product_key) as check2 from Customer a inner join product b on a.product_key=b.product_key group by a.customer_id order by customer_id)

select c.customer_id from te2 c inner join te1 d on c.check2=d.check1 