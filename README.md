# sql-for-data-analytics
I am using this repository to learn data analytics using sql and do practice projects

BEGINNER SQL

The select statement is used together with table columns to choose what to be included in the output. The asterik * is used to select and display all columns in the output. Select can be followed by specific column names like "first_name" "age" etc.

The where clause is used to filter the rows of the column specified according to the condition give. 
Like is used to set a condition which doesnt need to be exclusively met
eg like firstname = "Jer%" accepts all firstnames starting with Jer
like firstname = "%er%" accepts all entries with er in tany position of firstname
like firstname = "J__" will accept names starting with J followed by exactly to characters. 
a % sign can be added after the underscore to include more characters.

The group by statement is used to group together any rows of a column with the same value stored in 
them, based on a function specified in the statement

The ORDER BY clause in SQL is used to sort the result set of a query in a specific order based on one 
or more columns. This clause is commonly used to arrange data in ascending or descending order, 
allowing you to control the presentation of data for better analysis and readability.


limits are used to set the maximum number of lines to be displayed in the output. they can be 
used together with others like order by to make the ouput more apppealing and give more clearer.

Aliasing is used to give alternative names for columns in the output or for giving names for 
aggregate columns instead of having the functions as column names.


INTERMEDIATE SQL

JOINS
1. INNER JOIN
This returns only the matching rows from both tables.

Example:
We have two tables:

Customers

customer_id	name	city
1	John	Nairobi
2	Jane	Mombasa
3	Ali	Kisumu
Orders

order_id	customer_id	amount
101	1	500
102	2	700
103	4	300
Now, let's join these tables to get customers who have placed orders:

sql
Copy
Edit
SELECT Customers.name, Orders.order_id, Orders.amount  
FROM Customers  
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;
Result:

name	order_id	amount
John	101	500
Jane	102	700
Ali is not included because he has no matching order, and order 103 is not included because its customer_id (4) is not in the Customers table.

2. LEFT JOIN (or LEFT OUTER JOIN)
Returns all records from the left table (Customers), plus matching records from the right table (Orders). If there's no match, NULL is returned.

sql
Copy
Edit
SELECT Customers.name, Orders.order_id, Orders.amount  
FROM Customers  
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;
Result:

name	order_id	amount
John	101	500
Jane	102	700
Ali	NULL	NULL
Ali is included, but since he has no matching order, NULL appears.

3. RIGHT JOIN (or RIGHT OUTER JOIN)
Returns all records from the right table (Orders), plus matching records from the left table (Customers). If there’s no match, NULL appears on the left.

sql
Copy
Edit
SELECT Customers.name, Orders.order_id, Orders.amount  
FROM Customers  
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;
Result:

name	order_id	amount
John	101	500
Jane	102	700
NULL	103	300
Order 103 is included, but since there's no matching customer, the name is NULL.

4. FULL JOIN (or FULL OUTER JOIN)
Returns all records when there is a match in either table. If there’s no match, NULL appears.

sql
Copy
Edit
SELECT Customers.name, Orders.order_id, Orders.amount  
FROM Customers  
FULL JOIN Orders ON Customers.customer_id = Orders.customer_id;
Result:

name	order_id	amount
John	101	500
Jane	102	700
Ali	NULL	NULL
NULL	103	300
Ali and Order 103 appear with NULL values where there is no match.

5. CROSS JOIN
Returns all possible combinations of rows from both tables (cartesian product).

sql
SELECT Customers.name, Orders.order_id, Orders.amount  
FROM Customers  
CROSS JOIN Orders;
If Customers has 3 rows and Orders has 3 rows, the result will have 3 × 3 = 9 rows.

6. SELF JOIN
A table joins with itself. Useful for hierarchical data like employees and managers.

sql
SELECT A.name AS Employee, B.name AS Manager  
FROM Employees A  
JOIN Employees B ON A.manager_id = B.employee_id;




The UNION operator is used to combine the result sets of two or more SELECT queries into a single result set, removing duplicate rows.

Syntax:

sql
SELECT column1, column2 FROM table1  
UNION  
SELECT column1, column2 FROM table2;
Types of UNION in SQL
1. UNION (Removes Duplicates)
The UNION operator combines results and removes duplicate rows by default.

Example:
We have two tables:

Customers_Kenya

name	city
John	Nairobi
Jane	Mombasa
Ali	Kisumu
Customers_Uganda

name	city
Jane	Mombasa
Brian	Kampala
Amina	Entebbe
Now, let's combine these tables:

sql
SELECT name, city FROM Customers_Kenya  
UNION  
SELECT name, city FROM Customers_Uganda;
Result:

name	city
John	Nairobi
Jane	Mombasa
Ali	Kisumu
Brian	Kampala
Amina	Entebbe
Jane appeared in both tables, but UNION removed the duplicate.

2. UNION ALL (Keeps Duplicates)
If you want to keep duplicate rows, use UNION ALL.

sql
SELECT name, city FROM Customers_Kenya  
UNION ALL  
SELECT name, city FROM Customers_Uganda;
Result:

name	city
John	Nairobi
Jane	Mombasa
Ali	Kisumu
Jane	Mombasa
Brian	Kampala
Amina	Entebbe
Important Rules for UNION
Same Number of Columns: The SELECT statements must have the same number of columns.
Same Data Types: The columns must have compatible data types.
Column Order Matters: The first SELECT column order determines the result.
When to Use UNION vs. JOIN?
Use JOIN when combining columns from multiple tables based on a relationship.
Use UNION when combining rows from multiple tables with similar structures.