select employee_demographics.employee_id, 
employee_demographics.first_name, 
employee_demographics.last_name, 
employee_demographics.age
from parks_and_recreation.employee_demographics
where employee_id in (
	select employee_id
    from parks_and_recreation.employee_salary
    where dept_id = 1
)
;

select first_name, last_name, salary,
	(select avg(salary)
		from parks_and_recreation.employee_salary
    ) as Average_Salary,
case
	when salary <= (select avg(salary) from parks_and_recreation.employee_salary) then 'low pay'
    when salary >= (select avg(salary) from parks_and_recreation.employee_salary) then 'well paid'
end as Pay_Class
from parks_and_recreation.employee_salary
group by first_name, last_name, salary
;