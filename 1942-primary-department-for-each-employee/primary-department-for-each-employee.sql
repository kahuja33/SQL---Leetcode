# Write your MySQL query statement below
select employee_id,department_id from (
select *,rank() over(partition by employee_id order by case when primary_flag="Y" then 1 else 2 end) as r1,COUNT(EMPLOYEE_ID)over (partition by   employee_id) as r2 from employee) as temp where (r1=1 and primary_flag="Y") or (r1=1 and r2=1 and primary_flag="N")

#SELECT employee_id, department_id FROM Employee WHERE primary_flag = 'Y' UNION SELECT employee_id, department_id FROM Employee GROUP BY employee_id HAVING COUNT(employee_id) = 1;

