# Write your MySQL query statement below
#With ce1 as (
#Select a.project_id,a.employee_id,b.name,b.experience_years from Project a inner join Employee b on a.employee_id=b.employee_id order by a.project_id,a.employee_id )
#Select project_id,round(avg(experience_years),2) as average_years from ce1 group by project_id

Select project_id,round(average_years,2) as average_years from(Select a.project_id,avg(experience_years) over (partition by project_id) as average_years,ROW_NUMBER() OVER (PARTITION BY a.project_id ORDER BY a.project_id) as row_num from Project a inner join Employee b on a.employee_id=b.employee_id) as grouped_experience where row_num=1