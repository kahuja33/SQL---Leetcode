# Write your MySQL query statement below
select a.name, b.unique_id from Employees a left join EmployeeUNI b ON a.id=b.id