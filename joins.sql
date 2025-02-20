-- INNER JOINS


select *
from parks_and_recreation.employee_demographics
;

select *
from parks_and_recreation.employee_salary
;

select * 
from parks_and_recreation.employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

select dem.employee_id, age, salary 
from parks_and_recreation.employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

-- OUTER JOINS

-- LEFT OUTER JOIN / LEFT JOIN
select * 
from parks_and_recreation.employee_demographics as dem
left join employee_salary as sal
	on dem.employee_id = sal.employee_id
;



-- RIGHT OUTER JOIN / RIGHT JOIN
select * 
from parks_and_recreation.employee_demographics as dem
right join employee_salary as sal
	on dem.employee_id = sal.employee_id
;



-- SELF JOIN

select *
from employee_salary as tab1
join employee_salary as tab2
	on tab1.employee_id + 1 = tab2.employee_id
;

select tab1.employee_id as santa_id,
tab1.first_name as santa_first_name,
tab1.last_name as santa_last_name,
tab2.employee_id as emp_number,
tab2.first_name as emp_first_name,
tab2.last_name as emp_last_name
from employee_salary as tab1
join employee_salary as tab2
	on tab1.employee_id + 1 = tab2.employee_id
;


-- joining multiple tables together

select *
from parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments as pd
	on sal.dept_id = pd.department_id
;

select *
from parks_departments
;
