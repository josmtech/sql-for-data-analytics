-- events and triggers


select *
from employee_demographics
;


select *
from employee_salary
;

delimiter $$

create trigger new_entry
	after insert on employee_salary
    for each row
begin
	insert into employee_demographics(employee_id, first_name, last_name)
    values(new.employee_id, new.first_name, new.last_name);
end $$
delimiter ;

insert into employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
values (13, 'Joan', 'Reels', 'mechanic', 260000, null)
