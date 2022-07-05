-- DELIVERABLE 1

-- Create table of retirees and all of their titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
--INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT 
	DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
--INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;


-- Find the number of retirees per title
SELECT COUNT(title), 
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;



-- DELIVERABLE 2
-- Create table of retirees and all of their titles
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date, 
	de.from_date,
	de.to_date, 
	ti.title
INTO mentorship_elegibility
FROM employees AS e
INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (ti.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.to_date DESC;




