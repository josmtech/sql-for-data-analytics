use parks_and_recreation;


select dem.employee_id, dem.first_name, dem.last_name, age, salary,
case
	when age <= 30 then 'young employee'
    when age between 30 and 50 then 'on the employment age'
    when age >= 50 then 'on the retirement row'
end as Age_Bracket
from parks_and_recreation.employee_demographics as dem
join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
;


select gender, avg(salary)
from employee_demographics
join employee_salary
	on employee_demographics.employee_id = employee_salary.employee_id
group by gender
;


select gender, avg(salary) over(partition by gender) 
from employee_demographics
join employee_salary
	on employee_demographics.employee_id = employee_salary.employee_id
;

select dem.employee_id, dem.first_name, dem.last_name, gender, salary, sum(salary) over(partition by gender  order by dem.employee_id) as Rolling_Total
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
;


select dem.employee_id, dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) Line_number,
rank() over(partition by gender order by salary desc) Position,
dense_rank() over(partition by gender order by salary desc) Densed_position
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
;