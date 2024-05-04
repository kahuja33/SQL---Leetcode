# Write your MySQL query statement below
#Select departmentid,name as employee,salary from (
Select Department,Employee,salary from (
Select b.name as Department,a.name as Employee,a.salary as salary,dense_rank() over (partition by a.departmentid order by a.salary desc) as rnk from employee a inner join department b 
on a.departmentid=b.id
) as t where rnk <=3 