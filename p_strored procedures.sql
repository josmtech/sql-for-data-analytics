-- stored procedures with parameters



delimiter $$
create procedure high_pay(number int)
begin
	select employee_id, first_name, last_name, age
    from employee_demographics
    where age > number
    ;
end $$
delimiter ;


call high_pay(44);