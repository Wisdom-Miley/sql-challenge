
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
  dept_no VARCHAR(10),
  dept_name VARCHAR(30) NOT NULL,
);
select * from departments

DROP TABLE IF EXISTS employees CASCADE;
SET datestyle TO ISO,MDY;
show datestyle;
-- Create the table
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date VARCHAR(10) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date VARCHAR(10) NOT NULL,
	PRIMARY KEY(emp_no, emp_title_id)
);
alter table employees alter column birth_date type date
using to_date(birth_date, 'MM/DD/YYYY');
select * from employees;
select to_date(birth_date, 'MM/DD/YYYY') as birth_date,
       emp_title_id
from employees;
select * from employees;

DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL
);
SELECT * FROM dept_emp;

DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE titles (
    -- Title Id is a PK as it returns a unique row in the table.
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (title_id)
);
SELECT * FROM titles;

DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL
);

SELECT * FROM dept_manager;

DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL
);
SELECT * FROM salaries;

ALTER TABLE employees ADD CONSTRAINT enp_no FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

select * from departments;
select * from titles;
select * from employees;
select * from dept_emp;
select * from dept_manager;
select * from salaries;




