SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_managers;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT "first_name", "last_name", "hire_date"
FROM employees
WHERE "hire_date" LIKE '%/1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT m.dep_id, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_managers AS m
INNER JOIN departments AS d ON m.dep_id=d.dept_no
INNER JOIN employees AS e ON m.emp_no=e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON de.emp_no=e.emp_no
INNER JOIN departments AS d ON de.dept_no=d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT "first_name", "last_name", "sex"
FROM employees
WHERE "first_name"='Hercules'
AND "last_name" LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN employees AS e ON de.emp_no=e.emp_no
INNER JOIN departments AS d ON de.dept_no=d.dept_no
WHERE de.dept_no = 'd007';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON de.emp_no=e.emp_no
INNER JOIN departments AS d ON de.dept_no=d.dept_no
WHERE de.dept_no = 'd007'
OR de.dept_no = 'd005';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY 1
ORDER BY 2 DESC;