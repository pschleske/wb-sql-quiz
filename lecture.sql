SELECT fname, lname, dept 
FROM employees 
JOIN departments 
USING(dept_code);

-- left join 
SELECT fname, e.dept_code, d.dept_code, dept 
FROM employees AS 
LEFT JOIN departments 
USING (dept_code)

--right joins exist but isn't used
-- department that doesn't have employees assign to it, display department and phonenumber 
SELECT dept, phone 
FROM departments 
LEFT JOIN employees 
USING(dept_code) 
WHERE employees IS NULL;
-- # of employees per deparment 
-- total salary per department 
SELECT dept,
COUNT(id) AS num_emps,
SUM(salary) AS total_salary
FROM departments
LEFT JOIN employees
USING (dept_code)
GROUP BY dept;

-- FULL OUTER JOINS
-- get the first name and department of anyone whose last name start with an L
SELECT fname, dept_code 
FROM employees
LEFT JOIN departments 
USING(dept_code)
WHERE lname LIKE 'L%';
-- get the full name as one column, the department, and salary of anyone working in Legal
SELECT CONCAT(fname,'' ,lname) AS full_name,
dept,
salary
FROM employees
JOIN departments
USING(dept_code)
WHERE dept_code = 'legal';