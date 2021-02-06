--Exploring joining tables to use in pandas


SELECT s.emp_no, s.salary, t.title_id, t.title
FROM salaries s
	Inner JOIN employees e ON s.emp_no = e.emp_no
	INNER JOIN titles t ON e.emp_title_id = t.title_id
