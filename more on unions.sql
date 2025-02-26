use parks_and_recreation;

select first_name, last_name, 'young employee' as Label
from employee_demographics
where age < 40
union
select first_name, last_name, 'old employee' as Label
from employee_demographics
where age > 55
union all
select first_name, last_name, 'lowest paid' as Label
from employee_salary
where salary < 30000
;

