use parks_and_recreation;

-- string functions practice exercises

-- upper() converts a string into uppercase/capital letters
select first_name, upper(first_name)
from employee_demographics
;

-- lower() converts a string into lowercase/small letters
select first_name, lower(first_name)
from employee_demographics
;

-- the length() function outputs the size or number of characters in a string
select first_name, length(first_name)
from employee_demographics
order by length(first_name)
;


-- CONCAT()	Joins strings
select first_name, last_name, concat(first_name, ' ', last_name) as Full_Name
from employee_demographics
;


-- SUBSTRING()	Extracts substring/ part or some section of the string
select first_name, substring(first_name, 1,2) as initials, concat(substring(first_name, 1,2), substring(last_name, 1,2)) as system_name
from employee_demographics
;


-- LEFT()	Extracts from left
select first_name, last_name, left(last_name, 2) as open_initials
from employee_demographics
;


-- RIGHT()	Extracts from right
select first_name, last_name, right(last_name, 2) as close_initials
from employee_demographics
;


-- TRIM()	Removes spaces all round a string both the left and right side.
-- rtrim and ltrim also works.

REPLACE()	Replaces substring	REPLACE('SQL', 'S', 'T')	TQL

INSTR()	Finds substring position	INSTR('Data', 'a')	2
REVERSE()	Reverses string	REVERSE('abc')	cba
FORMAT()	Formats numbers	FORMAT(1234, 'N2')	1,234.00