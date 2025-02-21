use parks_and_recreation;

select first_name, last_name
from employee_demographics
union
select first_name, last_name
from employee_salary
;


select first_name, last_name
from employee_demographics
union all
select first_name, last_name
from employee_salary
;

select first_name, last_name, 'old' as Label
from employee_demographics
where age > 45
;

select first_name, last_name, 'old Man' as Label
from employee_demographics
where age > 40 and gender = 'male'
union
select first_name, last_name, 'old Lady' as Label
from employee_demographics
where age > 45 and gender = 'female'
union
select first_name, last_name, 'highly paid' as Label
from employee_salary
where salary > 70000
order by first_name, last_name
;