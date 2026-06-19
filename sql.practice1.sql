CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary INT
);

INSERT INTO employees (emp_id, name, department, salary)
VALUES
(1, 'Alice', 'HR', 45000),
(2, 'Bob', 'IT', 60000),
(3, 'Charlie', 'Finance', 55000),
(4, 'David', 'IT', 70000),
(5, 'Eva', 'HR', 50000);

SELECT * FROM employees;

--Question 1: Show only the employees who work in the IT department.
select name, department from employees 
where department='IT';

--Display all employees.
select * from employees;

--Display only employee names.
select name from employees;

--Display employee names and salaries.
select name, salary from employees;

--Show employees whose salary is greater than 50,000.
select name, salary from employees
where salary>50000;

--Show employees whose salary is less than 60,000.
select name, salary from employees
where salary<60000;

--Show employees whose salary is between 45,000 and 60,000.
select name, salary from employees
where salary>45000 and salary<60000;

--Show employees from HR or Finance.
select name, department from employees
where department='HR' or department='Finance';

--Show employees not working in IT.
select name,department from employees
where department<>'IT';

--Show employees whose name starts with 'A'.
select name from employees where name LIKE'A%';

--Show employees whose name ends with 'a'.
select name from employees where name LIKE'%a';

--Show employees whose name contains 'v'.
select name from employees where name LIKE'%v%';

--Display distinct departments.
select distinct department from employees;

--Sort employees by salary (ascending).
select name, salary from employees
order by salary asc;

--Sort employees by salary (descending).
select name, salary from employees 
order by salary desc;

--Sort employees by department and salary.
select name, department, salary from employees
order by department, salary;

--Display the first three employees.
select * from employees limit 3;

--Display employees with salary ≥ 55,000.
select * from employees 
where salary>=55000;

--Display employees with salary <> 50,000.
select * from employees
where salary<>50000;

--Show employees whose department is NULL.
select * from employees
where department IS NULL;

--Show employees whose department is NOT NULL.
select * from employees
where department IS NOT NULL;

--Count all employees.
select count(*) from employees;

--Count employees in IT.
select count(*) from employees 
where department='IT';

--Find the highest salary.
select max(salary) from employees;

--Find the lowest salary.
select min(salary) from employees;

--Find the average salary.
select avg(salary) from employees;

--Find the total salary.
select sum(salary) from employees;

--Show employee names in alphabetical order.
select name from employees order by name;

--Show salaries in descending order.
select name, salary from employees
order by salary desc;

--Display employees whose department is in ('HR','IT').
select name, department from employees
where department='HR' or department='IT';

------------------------------------level2----------------------------------------------------------
--Count employees in each department.
select count(*) from employees
group by department;

--Find average salary by department.
select avg(salary), department from employees
group by department;

--Find maximum salary by department.
select max(salary), department from employees
group by department;

--Find minimum salary by department.
select min(salary), department from employees
group by department;

--Find total salary by department.
select sum(salary), department from employees
group by department;

--Display departments having more than one employee.
select emp_id, name from employees
group by name, emp_id
having count(name)>1;

--Display departments whose average salary is greater than 50,000.
select name, department, salary from employees
group by name, department, salary
having avg(salary)>50000;

--Find the department with the highest average salary.
select max(salary) from employees where salary is (
select avg(salary), department from employees group by department);                  ---doubt

--Count employees earning more than 50,000.
select count(*) from employees
where salary>50000;

--Show departments with total salary above 100,000.
select department, salary from employees
group by department, salary
having sum(salary)>100000;

--Show employee names in uppercase.
select upper(name) from employees;

--Show employee names in lowercase.
select lower(name) from employees;

--Find the length of each employee's name.
select length(name), name from employees;

--Display first three letters of each name.
select left(name,3) from employees;

--Concatenate employee name and department.
select name||' '||department from employees;

--Round average salary.
select round(avg(salary),2) from employees;

--Display current date.
select current_date;                                                          --doubt

--Display current timestamp.
select current_time;

--Calculate annual salary (salary * 12).
select salary*12 as annual_salary from employees;

--Calculate 10% bonus.
select salary*10/100 as bonus from employees;

--Replace HR with Human Resources.
select replace('HR', 'HR', 'Human Resources');

--Find employees whose names contain exactly five letters.
select name from employees 
group by name 
having length(name)=5;

--Display employees ordered by department then salary.
select name, department, salary from employees
order by department, salary;

--Show top two highest-paid employees.
select name, salary from employees
order by salary desc
limit 2;

--Show third highest-paid employee.
select name, salary from(
    select name, salary,
	dense_rank() over (order by salary desc) as salary_rank
	from employees
) ranked_employees
where salary_rank=3;

--Display employees whose salary is above average.
select name, salary from employees 
group by name, salary
having salary>avg(salary);

--Find employees earning the minimum salary.
select * from employees 
where salary= (select min(salary) from employees);

--Find employees earning the maximum salary.
select * from employees
where salary= (select max(salary) from employees);

--Count distinct departments.
select distinct(department) from employees;

--Display departments in alphabetical order.
select department from employees 
order by department;

-----------------------------level3-----------------------------------------------------------
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    department VARCHAR(50),
    manager VARCHAR(50)
);

INSERT INTO departments VALUES
(101,'HR','Sophia'),
(102,'IT','James'),
(103,'Finance','Olivia'),
(104,'Marketing','Liam'),
(106,'Sales','Emma');

--Perform an INNER JOIN.
select e.name, d.dept_id
from employees e join departments d
on e.department= d.department;

--Perform a LEFT JOIN.
select e.name, d.dept_id
from employees e left join departments d on e.department= d.department;

--Perform a RIGHT JOIN.
select e.name, d.department 
from employees e right join departments d on e.department= d.department;

--Perform a FULL OUTER JOIN.
select e.name, d.department
from employees e full outer join departments d 
on e.department= d.department;

--Display employee name and manager.
select e.name, d.manager 
from employees e join departments d on e.department= d.department;

--Show employees without matching departments.
select e.name, d.department 
from employees e join departments d 
on e.department= d.department 
where d.department is null;

--Show departments without employees.
select d.department, e.name
from employees e right join  departments d 
on e.department= d.department
where e.name is null;

--Count employees under each manager.
select count(*) as employee_count,d.manager from employees e join departments d 
on e.department= d.department 
group by d.manager;

--Find highest salary under each manager.
select max(e.salary) as highest_salary, d.manager 
from employees e join departments d 
on e.department= d.department
group by  d.manager;

--Display employee names and department IDs.
select e.name, d.dept_id
from employees e join departments d 
on e.department= d.department;

--Join and display all columns.
select * from employees e inner join departments d
on e.department= d.department;

--Count employees in every department after join.
select count(*), d.department from employees e join departments d 
on e.department= d.department
group by d.department;

--Show manager of each employee.
select d.manager, e.name from departments d join employees e 
on e.department= d.department ;

--Display employees from departments managed by 'John'.
select e.name, d.department from employees e join departments d 
on e.department= d.department 
where d.manager='John';

--Find employees without managers.
select e.name from employees e join departments d 
on e.department= d.department
where d.manager is null;

--Display department having maximum employees.
select count(*) as total_employees,d.department from departments d join employees e 
on d.department= e.department 
group by d.department
order by total_employees desc
limit 1;

--Display managers with more than three employees.
select d.manager 
from employees e join departments d 
on e.department= d.department
group by d.manager
having count(e.name)>3;

--Self join to find employees in same department.
select e1.name as employee1, e2.name as employee2, e1.department
from employees e1 join employees e2
on e1.department= e2.department
and e1.emp_id<e2.emp_id;

--Display pairs of employees from same department.
select e1.name as employee1, e2.name as employee2, e2.department
from employees e1 join employees e2
on e1.department= e2.department
where e1.emp_id< e2.emp_id;

--Display employees and their managers alphabetically.
select e.name, d.manager
from employees e join departments d 
on e.department= d.department
order by e.name, d.manager;

------------------------------level4----------------------------------------------------------
--Find second highest salary.
select max(salary)
from employees
where salary< (select max(salary) from employees);

--Find third highest salary.
select distinct(salary) from employees
order by salary desc
limit 1 offset 2;

--Find nth highest salary.
select distinct(salary) from employees
order by salary desc
limit 1 offset n-1;

--Use ROW_NUMBER().
select name, department,
row_number() over (order by name) as name_row
from employees;

--Use RANK().
select name, department, salary,
rank() over (order by salary desc) as salary_rank
from employees;

--Use DENSE_RANK().
select name, department, salary,
dense_rank() over(order by salary desc) as salary_dense_rank
from employees;

--Rank employees department-wise.
select name, department ,
rank() over (order by department) as dept_rank
from employees;

--Display top two salaries from each department.
select salary, department from employees
order by salary desc
limit 2;

/*Use CASE to classify salary:
<50000 → Low
50000–65000 → Medium

65000 → High */
select salary,
case 
  when salary<50000 then 'Low'
  when salary>=50000 and salary<65000 then 'Medium'
  when salary>=65000 then 'High'
  else 'nothing to display'
end
from employees;

--Find duplicate salaries.
select salary, count(*) as count_duplicate
from employees
group by salary
having count(*)>1;

--Remove duplicate rows.
select distinct * from employees;

--Write a CTE to display high earners.
with cte as(
select salary, name from employees
where salary>50000
)
select * from cte;

--Write a subquery to find employees earning above average.
select name, salary from employees
where salary>(select avg(salary) from employees);

--Find employees earning the second highest salary using a subquery.
select max(salary) from employees
where salary<(select max(salary) from employees);

--Find department-wise highest-paid employee.
select max(salary), name, department
from employees
group by department, name;                                 --doubt

--Find department-wise second highest-paid employee.
select max(salary),department from employees
where salary<(select max(salary) from employees)
group by department;

--Display cumulative salary.
select name, sum(salary) over (partition by name) as cumulative_sal
from employees;

--Display running total using window functions.
select emp_id,name, 
sum(salary) over (partition by emp_id) as running_total
from employees;

--Display percentage contribution of each salary.
select name, salary,
 round((salary * 100.0) / SUM(salary) OVER(),2) AS percentage_contribution
from employees;

--Display top three employees from each department.
select name, department, salary
from employees
order by salary desc
limit 3;

