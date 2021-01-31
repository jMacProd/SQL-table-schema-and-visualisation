DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;


CREATE TABLE titles (
	title_id  VARCHAR(5) PRIMARY KEY,
	title VARCHAR(30)
);

CREATE TABLE departments (
	dept_no VARCHAR(5) PRIMARY KEY,
	dept_name VARCHAR(30)
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(30),
	birth_date DATE NOT NULL,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date DATE NOT NULL,
	CONSTRAINT fk_titleid
      FOREIGN KEY(emp_title_id) 
	  REFERENCES titles(title_id)
	  ON DELETE SET NULL
);

CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	CONSTRAINT fk_empno
      FOREIGN KEY(emp_no) 
	  REFERENCES employees(emp_no)
	  ON DELETE SET NULL
);

CREATE TABLE dept_emp (
    emp_no INT,
	dept_no VARCHAR(5),
	CONSTRAINT fk_empnodept
      FOREIGN KEY(emp_no) 
	  REFERENCES employees(emp_no)
	  ON DELETE SET NULL,
	CONSTRAINT fk_deptnodept
      FOREIGN KEY(dept_no) 
	  REFERENCES departments(dept_no)
	  ON DELETE SET NULL
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(5),
	emp_no INT,
	CONSTRAINT fk_deptno
      FOREIGN KEY(dept_no) 
	  REFERENCES departments(dept_no)
	  ON DELETE SET NULL
);

select * FROM dept_manager LIMIT 10;



