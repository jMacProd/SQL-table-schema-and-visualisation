-- List the following details of each employee: employee number, last name, first name, sex, and salary.
	-- JOIN employees and salary

SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.sex AS "Sex",
	s.salary AS "Salary"
FROM
	employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no);

--List first name, last name, and hire date for employees who were hired in 1986.
	-- check date format
SELECT (hire_date) FROM employees LIMIT 1;
	--Output: 1990-04-28

SELECT 
	e.first_name AS "First Name",
	e.last_name AS "Last Name",
	e.hire_date AS "Hire Date"
FROM
	employees AS e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


-- List the manager of each department with the following information:
-- department number
-- department name
-- the manager's employee number
-- last name
-- first name.

	-- EXAMPLE
	-- https://stackoverflow.com/questions/3709560/joining-three-tables-using-mysql
	--SELECT s.name as Student, c.name as Course 
	--FROM student s
    	--INNER JOIN bridge b ON s.id = b.sid
    	--INNER JOIN course c ON b.cid  = c.id 
	--ORDER BY s.name
	
	-- JOIN departments and employees with dept_manager as bridging table
	
	-- Select columns from table departments and employees - no relationshion
SELECT d.dept_no AS "Dept Number", d.dept_name AS "Dept Name", e.emp_no AS "Employee Number", e.last_name AS "Manager Last Name", e.first_name AS "Manager First Name"
FROM employees e
			--Join table employess and dept_manager - bridging table
	INNER JOIN dept_manager m ON e.emp_no = m.emp_no
			-- Join table departments with dept_manager - bridging table
	INNER JOIN departments d on m.dept_no = d.dept_no;

-- List the department of each employee with the following information:
-- employee number,
-- last name, 
-- first name,
-- and department name.

SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees e
	INNER JOIN dept_emp de ON e.emp_no = de.emp_no
	INNER JOIN departments d on de.dept_no = d.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- List all employees in the Sales department,
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees e
	INNER JOIN dept_emp de ON e.emp_no = de.emp_no
	INNER JOIN departments d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees e
	INNER JOIN dept_emp de ON e.emp_no = de.emp_no
	INNER JOIN departments d on de.dept_no = d.dept_no
WHERE d.dept_name in ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

SELECT
	last_name AS "Last Name",
	COUNT(last_name) AS "Count of Last Name"
FROM employees
GROUP BY "Last Name"
ORDER BY "Count of Last Name" DESC;

