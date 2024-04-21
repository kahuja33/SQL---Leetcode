# Write your MySQL query statement below
SELECT b.Product_name, a.Year, a.Price FROM Sales a inner join Product b on a. Product_ID=b.Product_ID group by a.Sale_ID