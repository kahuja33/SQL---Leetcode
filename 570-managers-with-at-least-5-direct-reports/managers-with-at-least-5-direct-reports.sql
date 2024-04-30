# Write your MySQL query statement below
SELECT b.name FROM employee a inner join employee b on a.managerid=b.id GROUP BY a.managerid HAVING COUNT(a.managerid)>=5
