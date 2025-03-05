use parks_and_recreation;

select first_name, last_name, age,
case
	when age < 35 then 'youth'
    when age between 35 and 50 then 'adult'
    when age > 50 then 'old, should retire'
end as Age_bracket
from employee_demographics
;

select first_name, last_name, salary,dept_id,
case
	when salary < 40000 then salary*1.05
    when salary = 50000 then salary*1.06
    when salary > 50000 and dept_id != 6 then salary*1.07
    when dept_id = 6 then salary + (salary*0.1)
end as New_Salary
from parks_and_recreation.employee_salary
;


select employee_demographics.first_name, employee_demographics.last_name, employee_demographics.age, employee_salary.salary,
case
	when age < 35 then 'Youth'
    when age between 35 and 50 then 'Adult'
    when age > 50 then 'Old, Should Retire'
end as Age_Bracket,
case
	when salary < 40000 then salary*1.05
    when salary = 50000 then salary*1.06
    when salary > 50000 then salary*1.07
end as New_Salary,
case
	when dept_id = 6 then salary*0.1
end as Bonus
from parks_and_recreation.employee_demographics
join
parks_and_recreation.employee_salary
on employee_demographics.employee_id = employee_salary.employee_id
;