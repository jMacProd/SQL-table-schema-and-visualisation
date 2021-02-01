-- List the following details of each employee: employee number, last name, first name, sex, and salary.
-- JOIN employees and salary

SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
	employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no);

--List first name, last name, and hire date for employees who were hired in 1986.
-- check date format
select hire_date FROM employees
--Output: 1990-04-28

SELECT 
	e.first_name,
	e.last_name,	
	e.hire_date
FROM
	employees AS e
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';

-- List the manager of each department with the following information:
-- department number
-- department name
-- the manager's employee number
-- last name
-- first name.

	-- JOIN departments and dept_manager and employees

	-- https://stackoverflow.com/questions/3709560/joining-three-tables-using-mysql
	--SELECT s.name as Student, c.name as Course 
	--FROM student s
    	--INNER JOIN bridge b ON s.id = b.sid
    	--INNER JOIN course c ON b.cid  = c.id 
	--ORDER BY s.name
			-- Select columns from table 1 and table 3 - no relationshio
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
			--Join table 1 and table 3 with the bridging table
	INNER JOIN dept_manager m ON e.emp_no = m.emp_no
			-- Join bridging table 2 with bridging table 3
	INNER JOIN departments d on m.dept_no = d.dept_no;

-- List the department of each employee with the following information:
-- employee number,
-- last name, 
-- first name,
-- and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
	INNER JOIN dept_emp de ON e.emp_no = de.emp_no
	INNER JOIN departments d on de.dept_no = d.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- List all employees in the Sales department,
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
	INNER JOIN dept_emp de ON e.emp_no = de.emp_no
	INNER JOIN departments d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
	INNER JOIN dept_emp de ON e.emp_no = de.emp_no
	INNER JOIN departments d on de.dept_no = d.dept_no
WHERE d.dept_name in ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

SELECT
	last_name,
	COUNT(last_name) AS "Count of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Count of Last Name" DESC;

