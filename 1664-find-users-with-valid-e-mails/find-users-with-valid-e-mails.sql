# Write your MySQL query statement below
#select user_id,name, mail from Users where mail like "%@leetcode.com" and (mail REGEXP "^[a-z]" or mail REGEXP "^[A-Z]") and (mail REGEXP [a-z]|_|.|-|[0-9])

select user_id,name, mail from Users where mail REGEXP '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$'
