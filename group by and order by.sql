select *
from parks_and_recreation.employee_demographics
;


select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender
;

select occupation, salary
from parks_and_recreation.employee_salary
group by occupation, salary
;

select gender, avg(age), max(age), min(age), count(age)
from parks_and_recreation.employee_demographics
group by gender
;

-- ORDER BY
select *
from parks_and_recreation.employee_demographics
order by gender, age desc
;