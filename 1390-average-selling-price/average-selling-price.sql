# Write your MySQL query statement below
#Select a.product_id,case when b.product_id is null then 0 else round(sum(price*units)/sum(units),2) end as average_price from prices a left join unitssold b on a.product_id=b.product_id and b.purchase_date<=a.end_Date and b.purchase_date>=a.start_Date group by a.product_id

Select a.product_id,coalesce(round(sum(price*units)/sum(units),2),0) as average_price from prices a left join unitssold b on a.product_id=b.product_id and b.purchase_date<=a.end_Date and b.purchase_date>=a.start_Date group by a.product_id
