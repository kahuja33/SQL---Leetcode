#Select a.product_name,  sum(b.unit) as Unit from products a inner join orders b on a.product_id=b.product_id where date_format(b.order_date,"%Y-%m")="2020-02" group by product_name having sum(b.unit)>=100

Select product_name,  sum(unit) as Unit from (select a.product_name as product_name, b.order_date as order_date,b.unit as unit from products a inner join orders b on a.product_id=b.product_id where date_format(b.order_date,"%Y-%m")="2020-02") as te1 group by product_name having sum(unit)>=100
