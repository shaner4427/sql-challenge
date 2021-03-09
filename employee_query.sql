select * from employees

--List the following details of each employee: employee number, last name, first name, sex, and salary

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from salaries
inner join employees on
employees.emp_no=salaries.salary

--List first name, last name, and hire date for employees who were hired in 1986

select first_name, last_name, hire_date
from employees
where date_part('year', hire_date) = 1986

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select department_manager.dept_no, department.dept_name, department_manager.emp_no, employees.last_name, employees.first_name
from department_manager
inner join department on
department_manager.dept_no=department.dept_no
inner join employees on
department_manager.emp_no=employees.emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from employees
inner join employee_department on
employees.emp_no=employee_department.emp_no
inner join department on
employee_department.dept_no=department.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select employees.first_name, employees.last_name, employees.sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from employees
left join employee_department on
employees.emp_no=employee_department.emp_no
inner join department on
department.dept_no=employee_department.dept_no
where department.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from employees
left join employee_department on
employees.emp_no=employee_department.emp_no
inner join department on
department.dept_no=employee_department.dept_no
where department.dept_name in ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name)
from employees
where last_name=last_name
group by last_name
order by last_name desc;