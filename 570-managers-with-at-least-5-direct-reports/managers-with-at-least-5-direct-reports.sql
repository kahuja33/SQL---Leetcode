# Write your MySQL query statement below
#SELECT b.name FROM employee a inner join employee b on a.managerid=b.id GROUP BY a.managerid HAVING COUNT(a.managerid)>=5

SELECT name FROM Employee
WHERE id in (select managerId from employee group by managerId having count(id) >= 5);