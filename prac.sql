-- 1) percent of cutomers that have purchased atleast one product

Select Grade, (Count(Grade)* 100 / (Select Count(*) From MyTable)) as Score
From MyTable
Group By Grade;

-- 2)customers bought more than 10 diffrent products

SELECT customer_name, COUNT(DISTINCT product_ID) as products_count FROM customer_table
INNER JOIN orders_table ON customer_table.customer_ID = orders_table.customer_ID
GROUP BY customer_table.customer_ID, customer_name
HAVING COUNT(DISTINCT product_ID) > 10;


SELECT Salary FROM
(
    SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 10
) AS Emp ORDER BY Salary LIMIT 1;

SELECT * FROM mytable WHERE a=X UNION ALL SELECT * FROM mytable WHERE b=Y AND a!=X;

SELECT
      u.user_id,
      username,
      training_id,
      training_date,
      count( user_training_id ) AS count
  FROM users u JOIN training_details t ON t.user_id = u.user_id
  GROUP BY u.user_id,
           username,
           training_id,
           training_date
  HAVING count( user_training_id ) > 1
  ORDER BY training_date DESC;
  
  select sum(case when x>0 then x else 0 end)sum_pos,sum(case when x<0 then x else 0 end)sum_neg from a;
  
  select weight, trunc(weight) as kg, nvl(substr(weight - trunc(weight), 2), 0) as gms
from mass_table;

select b.emp_id as 'Manager_Id',
          b.emp_name as 'Manager', 
          avg(a.salary) as 'Average_Salary_Under_Manager'
from Employee a, 
     Employee b
where a.manager_id = b.emp_id
group by b.emp_id, b.emp_name
order by b.emp_id;


-- Question 11: Write SQL Query to find duplicate rows in a database? and then write SQL query to delete them?
-- Answer: You can use the following query to select distinct records:
SELECT * FROM emp a WHERE rowid = (SELECT MAX(rowid) FROM EMP b WHERE a.empno=b.empno);

-- to Delete:
DELETE FROM emp WHERE rowid != (SELECT MAX(rowid) FROM emp b WHERE emp.empno=b.empno);

-- nth salary without using top

SELECT Salary
FROM EmployeeSalary Emp1
WHERE N-1 = (
                SELECT COUNT( DISTINCT ( Emp2.Salary ) )
                FROM EmployeeSalary Emp2
                WHERE Emp2.Salary > Emp1.Salary
            );

select d.Name as Department, e.name as Employee, e.salary as Salary from employee e,Department d 
where e.departmentid = d.id and
 4 > (select count(distinct(e1.salary)) from employee e1 where e1.salary > e.salary and e.departmentid = e1.departmentid );


-- Functions evaluate for every row in a table without using the index!

SELECT customer_id FROM customer WHERE last_name LIKE '[a-m]%';

ALTER TABLE customers ADD INDEX (first_name);

select substr(FIRST_NAME,0,3);

Select instr(FIRST_NAME,'o') from employee where first_name='John';
-- get position of first o

select RTRIM(FIRST_NAME) from employee;
-- right white space removal

select REPLACE(FIRST_NAME,'o','$');
-- replace o with $

 Select concat(FIRST_NAME,'_',LAST_NAME) from EMPLOYEE;
 
 select year(joining_date),month(joining_date), DAY(joining_date) from EMPLOYEE;

 sELECT MID(FullName, 0, LOCATE(' ',FullName)) FROM EmployeeDetails;


SELECT * INTO newTable FROM EmployeeDetails;
 
-- consecutive three same numbers
select distinct l1.Num as ConsecutiveNums from Logs l1,Logs l2, logs l3
where l1.Num = l2.Num and l2.Num = l3.Num and l1.Id = l2.Id + 1 and l1.Id = l3.Id +2



  
  

