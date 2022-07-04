CREATE DATABASE Employee_Table;
USE Employee_Table;
CREATE TABLE Employeeform
(
EmpID INT PRIMARY KEY,
EmpFname VARCHAR(250),
EmopLname VARCHAR(250),
Department CHAR(50),
Project VARCHAR(250),
Address VARCHAR(250),
DOB DATE,
Gender VARCHAR(10)
);
INSERT INTO Employeeform VALUES (1, 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad (HYD)', '1976-12-01', 'M'),
(2, 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi (DHL)', '1968-05-02', 'F'),
(3, 'Rohan', 'Diwan', 'Account', 'P3', 'Mimbai (BOM)', '1980-01-01', 'M'),
(4, 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad (HYD)', '1992-05-02', 'F'),
(5, 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi (DHL)', '1994-07-03', 'M');
select * from Employeeform;

CREATE TABLE Employee_Position
(
EmpID INT PRIMARY KEY,
EmpPosition VARCHAR(250),
Date_of_Joining DATE,
Salary INT (50), 
FOREIGN KEY (EmpID)
	REFERENCES Employeeform(EmpID)
    ON DELETE CASCADE
);

INSERT INTO Employee_Position (EmpID, EmpPosition, Date_of_Joining, Salary)
 VALUES (1, 'Manager', '2022-05-01', 500000),
		(2, 'Executive', '2022-05-02', 75000),
		(3, 'Manager', '2022-05-01', 90000),
		(4, 'Lead', '2022-05-02', 85000),
		(5, 'Executive', '2022-05-01', 300000);
select * from Employee_Position;


#Q1. Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName.
select upper(EmpFname) as EmpName from Employeeform;

#Q2. Write a query to fetch the number of employees working in the department ‘HR’.
SELECT COUNT(*) FROM Employeeform where Department = 'HR';

#Q3. Write a query to get the current date.
select curdate();

#Q4. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
select substring(EmopLname, 1, 4) from Employeeform;

#Q5. Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
SELECT MID(Address, 0, Locate('(', Address)) from Employeeform;

#Q6. Write a query to create a new table which consists of data and structure copied from the other table.
create table newtable as select * from Employeeform;

#Q7. Write q query to find all the employees whose salary is between 50000 to 100000.
select * from employee_position where Salary between 50000 and 100000;

#Q8. Write a query to find the names of employees that begin with ‘S’
select * from Employeeform where EmpFname Like 's%';

#Q9. Write a query to fetch top N records.
#select * from employee_position order by salary desc Limit 3;

#Q10. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
select concat(EmpFname, ' ' , EmopLname) as FullName from Employeeform;

#Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
select count(*), Gender from Employeeform where DOB Between '1970-05-02' and '1975-12-31' group by Gender;

# Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
select * from Employeeform order by EmpFname desc, Department desc;

#Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
select * from Employeeform where EmopLname Like '____a';

#Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
select * from Employeeform where EmpFname Not in ('Sanjay' and 'Sonia');

#Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.
select * from Employeeform where Address Like 'Delhi (DHL)';

#Q16. Write a query to fetch all employees who also hold the managerial position.
select E.EmpFname, E.EmopLname, P.EmpPosition
from employeeform E Inner Join employee_position P on 
E.EmpID = P.EmpID and P.EmpPosition in ('Manager');

#Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
select Department, count(EmpID) as EmpDeptCount
from employeeform group by Department
order by EmpDeptCount asc;

#Q18. Write a query to calculate the even and odd records from a table.
select * from Employeeform where MOD (EmpID, 2) <> 0;

select * from Employeeform where MOD (EmpID, 2) = 0;

#Q19. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.
select * from Employeeform E
where EXISTS
(select * from employee_position P where E.EmpID = P.EmpID);

#Q20. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
#Minimum
select Distinct Salary from employee_position E1
where 2 >= (Select Count(Distinct Salary) from Employee_position E2
where E1.Salary >= E2.Salary ) order by E1.Salary desc;

#Maximum
select distinct Salary from employee_position E1
where 2 >= (select count(Distinct Salary) from employee_position E2
where E1.Salary <= E2.Salary) order by E1.Salary desc;

#Q21. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
select salary from employee_position E1
where 5-1 = (select count(distinct (E2.Salary)) from employee_position E2 
where E2.Salary > E1.Salary);

#Q22. Write a query to retrieve duplicate records from a table.
SELECT EmpID, EmpFname, Department Affected_From, COUNT(*) 
FROM Employeeform GROUP BY EmpID, EmpFname, Department,
Affected_From HAVING COUNT(*) > 1;

#Q23. Write a query to retrieve the list of employees working in the same department.
select distinct E.EmpID, E.EmpFname, E.Department
from employeeform E, Employee E1
where E.Department = E1.Department and E.EmpID != E1.EmpID;

#Q24. Write a query to retrieve the last 3 records from the EmployeeInfo table.
select * from employeeform where
EmpID <= 3 union select * from  
(select * from employeeform E order by E.EmpID desc)
as E1 where E1.EmpID <= 3;

#Q25. Write a query to find the third-highest salary from the EmpPosition table.
select Top 1 Salary from (select Top 3 Salary from Employee_table) 
order by salary desc) as emp
order by salary asc;

#Q26. Write a query to display the first and the last record from the EmployeeInfo table.
select * from employeeform where EmpID = (select min(EmpID) from employeeform);
select * from employeeform where EmpID = (select max(EmpID) from employeeform);

#Q27. Write a query to add email validation to your database
#select Email from Employeeform where not REGEXP_LIKE(Email, '[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}', 'i');

#Q28. Write a query to retrieve Departments who have less than 2 employees working in it.
select Department , count(EmpId) as 'EmpNo' from Employeeform group by Department having count(EmpID)  <  2;

#Q29. Write a query to retrieve EmpPostion along with total salaries paid for each of them.
select EmpPosition, sum(salary) from employee_position group by EmpPosition;

#Q30. Write a query to fetch 50% records from the EmployeeInfo table.
select * from employeeform where
EmpID <= (select count(EmpID)/2 from employeeform);