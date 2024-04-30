# Write your MySQL query statement below
SELECT b.name FROM EMPLOYEE a inner join EMPLOYEE b on a.managerid=b.id GROUP BY a.MANAGERID HAVING COUNT(a.MANAGERID)>=5