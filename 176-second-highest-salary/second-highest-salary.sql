# Write your MySQL query statement below

#Select id from
#(Select id,salary, rank() over (order by salary desc) as rnk from employee) as temp where rnk=2 

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);
