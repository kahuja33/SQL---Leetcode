# Write your MySQL query statement below

Select a.product_name,  sum(b.unit) as Unit from products a inner join orders b on a.product_id=b.product_id where date_format(b.order_date,"%Y-%m")="2020-02" group by product_name having sum(b.unit)>=100

#a.product_category,date_format(order_date,"%Y-%m")as my,b.unit