SELECT COUNT(*)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';


-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
;

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
;

-- Creating a new table
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
;


SELECT * FROM retirement_info;



SELECT first_name, last_name, title
FROM employees as e
LEFT JOIN titles as t on e.emp_no = t.emp_no
;

DROP TABLE retirement_info;


-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
;

-- Check the table
SELECT * FROM retirement_info;




-- Joining the departments and managers tables
SELECT departments.dept_name, 
	dept_manager.emp_no, 
	dept_manager.from_date, 
	dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
;

-- Join retirement info and dept_emp
SELECT ri.emp_no, 
	ri.first_name, 
	ri.last_name, 
	de.to_date
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de
ON ri.emp_no = de.emp_no
;


SELECT ri.emp_no, 
	ri.first_name,
	ri.last_name, 
	de.to_date
INTO current_emp
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01')
;


-- Employee count by department number
SELECT COUNT (ce.emp_no), de.dept_no
INTO dept_retirees
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY dept_no
; 
