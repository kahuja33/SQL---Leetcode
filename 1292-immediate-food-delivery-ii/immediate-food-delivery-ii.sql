# Write your MySQL query statement below

select round(sum(case when dif=0 then 1 else 0 end)*100/sum(rw),2) as immediate_percentage from (
select customer_id,order_date,customer_pref_delivery_date, rank() over(partition by customer_id order by order_date) as rw,datediff(customer_pref_delivery_date,order_date) as dif from delivery) as temp where rw=1 