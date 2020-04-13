--1--

SELECT location_id, street_address, city, state_province, country_name
FROM Locations
LEFT JOIN Departments ON Locations.location_id = Departments.location_id;

--2--

SELECT Employees.first_name, Employees.last_name , Departments.department_id, Departments.department_name 
FROM Employees 
INNER JOIN Departments ON Employees.department_id = Departments.department_id;

--3--

SELECT Employees.first_name, Employees.last_name, Employees.job_id, Employees.department_id, Departments.department_name 
FROM ((
Employees  
INNER JOIN Departments ON Employees.department_id = Departments.department_id) 
INNER JOIN Locations ON Employees.location_id = Locations.location_id)
WHERE Locations.country_Name = 'London';

--4--

SELECT Employees.employee_id 'Emp_Id', Employees.last_name 'Employee', Managers.employee_id 'Mgr_Id', Managers.last_name 'Manager' 
FROM ((
Employees 
INNER JOIN Managers ON Employees.manager_id = Managers.manager_id;

--5--

SELECT e.first_name, e.last_name, e.hire_date 
FROM Employees e 
JOIN Employees d 
ON (d.last_name = 'Jones') 
WHERE d.hire_date < e.hire_date;

--6--

SELECT department_name ,COUNT(*) AS 'No of Employees' 
FROM Departments 
INNER JOIN Employees ON Employees.department_id = Departments.department_id; 

--7--

SELECT employee_id, job_title, end_date, start_date 
FROM job_history 
NATURAL JOIN Jobs 
WHERE department_id=90;

--8--

SELECT d.department_id, d.department_name, m.manager_id, m.first_name 
FROM Departments d 
INNER JOIN Managers m ON (d.manager_id = m.manager_id);

--9--

SELECT d.department_name, m.first_name, l.city 
FROM Departments d 
RIGHT JOIN Managers m ON d.manager_id = m.manager_id 
LEFT JOIN locations l ON d.location_id = l.location_id;

--10--

SELECT job_title, AVG(salary) 
FROM Employees 
NATURAL JOIN Jobs 
GROUP BY job_title;

--11--

SELECT job_title, first_name, (finalsalary - minsalary) AS 'Salary - Min_Salary' 
FROM Employees 
NATURAL JOIN Jobs;

--12--

SELECT first_name,finalsalary 
FROM JobHistory 
LEFT JOIN Employee ON JobHistory.EmployeeId = Employee.EmployeeId 
WHERE finalsalary>10000; 

--13--

SELECT e.first_name, e.last_name, e.hire_date, e.salary, d.department_name 
FROM Departments d RIGHT JOIN Employee e on d.department_id = e.department_id 
INNER JOIN Managers m ON d.manager_id = m.manager_id 
WHERE m.experience > 15;

