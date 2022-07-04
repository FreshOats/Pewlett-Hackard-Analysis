SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.gender, 
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01')
;

-- List of managers per department
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM dept_manager AS dm
	INNER JOIN departments AS d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN current_emp AS ce
		ON (dm.emp_no = ce.emp_no)
;

SELECT ce.emp_no, 
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp AS ce
	INNER JOIN dept_emp AS de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
;


-- Sales dept list
SELECT ri.emp_no, 
	ri.first_name,
	ri.last_name,
	d.dept_name
FROM retirement_info AS ri
	INNER JOIN dept_emp AS de
		ON (ri.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE (d.dept_name = 'Sales')
;

-- Sales Development lists
SELECT ri.emp_no, 
	ri.first_name,
	ri.last_name,
	d.dept_name
FROM retirement_info AS ri
	INNER JOIN dept_emp AS de
		ON (ri.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE dept_name IN ('Sales', 'Development') 
;