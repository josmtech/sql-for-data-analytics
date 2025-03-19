-- CTEs in Practice

with CTE_Example as
(
select gender, avg(salary) Average_Salary, max(salary) Least_Payed, min(salary) Highest_Payed, count(salary) Number_of_Staff
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select avg(Average_Salary)
from CTE_Example
;



-- similar operation using a subquery
select avg(Average_Salary)
from
(
select gender, avg(salary) Average_Salary, max(salary) Least_Payed, min(salary) Highest_Payed, count(salary) Number_of_Staff
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)AS Average_Subquery
;


with IT_Employees as
(
select employee_id, first_name, last_name, age, gender
from employee_demographics
where age <= 45
),

 IT_Employees_Pay as
(
select employee_id, first_name, last_name, salary
from employee_salary
where salary >= 50000
)
select *
from IT_Employees
join IT_Employees_Pay
	on IT_Employees.employee_id = IT_Employees_Pay.employee_id
;