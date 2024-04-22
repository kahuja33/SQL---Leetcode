# Write your MySQL query statement below
with temp3 as
(with tem2 as(
with temp1 as(
select * from activity order by machine_id,process_id,case activity_type when "start" then 1 else 2 end)
select machine_id,process_id,activity_type,timestamp,lag(timestamp,1) over (partition by machine_id,process_id order by machine_id,process_id,case activity_type when "start" then 1 else 2 end) as process_end  from temp1)
select machine_id,process_id,round((timestamp-process_end),3) as total_time from tem2 where activity_type="end")
select machine_id,round(sum(total_time)/count(machine_id),3) as processing_time from temp3 group by machine_id