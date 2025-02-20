select *
from parks_and_recreation.employee_demographics
order by age desc
limit 4
;


select *
from parks_and_recreation.employee_demographics
order by age desc
limit 2, 2 -- start at second position then take the next two
;

-- Aliasing
select gender, avg(age) as average_age
from parks_and_recreation.employee_demographics
group by gender
having avg(age) > 40
;

-- Aliasing
select occupation, avg(salary) average_salary
from parks_and_recreation.employee_salary
group by occupation
having avg(salary) > 40000
;