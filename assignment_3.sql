-- MySql
use sys;

/* 1. Write the query to get the department and department wise total(sum) salary,
display it in ascending order according to salary. */
SELECT department_id ,SUM(salary) as total_salary FROM employees group by department_id ORDER BY total_salary ASC ;

/* 2. Write the query to get the department, total no. employee of each department,
total(sum) salary with respect to department from "Employee" table. */
select department_id ,COUNT(employee_id) as total_no_of_employees ,SUM(salary) as total_salary FROM employees group by department_id ;

/* 3. Get department wise maximum salary from "Employee" table order by salary
ascending */
SELECT department_id ,max(salary) as max_salary from employees group by department_id ORDER by max_salary asc;

/* 4. Write a query to get the departments where average salary is more than 60k */

SELECT department_id ,AVG(salary) as avg_salary FROM employees group by department_id having avg_salary > 60000 ; 

/* 5. Write down the query to fetch department name assign to more than one Employee */

SELECT department_name  from departments where department_id in (SELECT department_id  from employees group by department_id HAVING count(employee_id)>1);

/* 6. Write a query to show department_name and assignedTo where assignedTo will be “One candidate” if its assigned to only one employee otherwise “Multiple candidates” */
 
SELECT d.department_name ,
case 
	when count(e.department_id)=1 then 'One candidate' else 'Multiple candidates'
end
as assignedTo
FROM departments d
left join employees e on d.department_id = e.department_id GROUP by d.department_id ,d.department_name ; 





