select *
from parks_and_recreation.employee_demographics
where age >=40 and gender = "female"
;


select *
from parks_and_recreation.employee_salary
where salary > 50000 
;


#Logical Operators
select * 
from parks_and_recreation.employee_demographics
where age <50
or not gender = "female"
;

#like
select *
from parks_and_recreation.employee_demographics
where first_name like "%er%"
;