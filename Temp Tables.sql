create temporary table temp_table
(first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100	)
);



insert into temp_table
values(
'Joseph', 'Maina', 'Rambo'
)
;


select *
from temp_table
;


create temporary table temp_table2
select dem.first_name, dem.last_name, age, salary
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

select first_name, last_name, age, salary
from temp_table2
;