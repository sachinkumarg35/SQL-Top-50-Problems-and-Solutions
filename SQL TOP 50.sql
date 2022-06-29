CREATE DATABASE EMPL;
USE EMPL;
CREATE TABLE WRKR
(
WRKR_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(50)
);
INSERT INTO WRKR VALUES
		(001, 'MONIKA', 'ARORA', 100000, '14-02-20 09.00.00', 'HR')
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
SELECT * FROM WRKR;
INSERT INTO WRKR VALUES (002, 'NIHARIKA', 'VERMA', 80000, '14-06-11 09.00.00', 'ADMIN'),
(003,  'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR');
INSERT INTO WRKR VALUES (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES WRKR(WRKR_ID)
        ON DELETE CASCADE
);

INSERT INTO Title VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 SELECT * FROM Title;
 
 
 CREATE TABLE Payment (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES WRKR(WRKR_ID)
        ON DELETE CASCADE
);

INSERT INTO Payment VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
select * from Payment;

#Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
Select FIRST_NAME AS WORKER_NAME from WRKR;

#Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(FIRST_NAME) FROM WRKR;

#Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct DEPARTMENT FROM WRKR;

#Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(FIRST_NAME, 1, 3) FROM WRKR;

#Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
select INSTR(FIRST_NAME, BINARY'a') from WRKR where FIRST_NAME = 'Amitabh';

#Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select RTRIM(FIRST_NAME) FROM WRKR;

#Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(DEPARTMENT) FROM WRKR;

#Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT LENGTH(DEPARTMENT) FROM WRKR;

# Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME, 'a','A') FROM WRKR;

#Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' FROM WRKR;

#Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from WRKR order by FIRST_NAME asc;

#Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM WRKR ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

#Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from WRKR WHERE FIRST_NAME IN ('Vipul', 'Satish');

#Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from WRKR WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');

#Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from WRKR WHERE DEPARTMENT LIKE 'Admin%';

#Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * From WRKR WHERE FIRST_NAME LIKE 'a%';

#Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * From WRKR where FIRST_NAME LIKE '%a';

#Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from WRKR where FIRST_NAME LIKE '_____%H';

#Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM WRKR WHERE SALARY BETWEEN 100000 AND 500000;

#Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WRKR WHERE YEAR(JOINING_DATE) = 2014 AND MONTH (JOINING_DATE) = 2;

#Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) FROM WRKR WHERE DEPARTMENT = 'Admin';

#Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM WRKR 
WHERE WRKR_ID IN 
(SELECT WRKR_ID FROM WRKR
WHERE Salary BETWEEN 50000 AND 100000);

#Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(WRKR_ID) No_Of_Workers
from WRKR
GROUP BY DEPARTMENT
ORDER BY No_Of_Workers Desc;

#Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM WRKR W
INNER JOIN Title T
ON W.WRKR_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

#Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM TITLE
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) >1;

#Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM WRKR WHERE MOD (WRKR_ID, 2) <>0;

#Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM WRKR WHERE MOD (WRKR_ID, 2) = 0;

Select * from WRKR;

#Q-32. Write an SQL query to show the top n (say 10) records of a table.
#Following MySQL query will return the top n records using the LIMIT method
Select * from WRKR ORDER BY SALARY DESC LIMIT 10;

#Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
#SELECT SALARY FROM WRKR ORDER BY SALARY DESC LIMIT n-1, 1;


#Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
 SELECT SALARY
 FROM WRKR W1
 WHERE 4 = (
  select count( distinct(w2.SALARY))
  FROM WRKR W2
  WHERE W2.SALARY >= W1.SALARY
  );

#Q-35. Write an SQL query to fetch the list of employees with the same salary.
Select distinct W.WRKR_ID, W.FIRST_NAME, W.Salary 
from WRKR W, WRKR W1 
where W.Salary = W1.Salary 
and W.WRKR_ID != W1.WRKR_ID;

#Q-36. Write an SQL query to show the second highest salary from a table.
Select max(Salary) from WRKR 
where Salary not in (Select max(Salary) from WRKR);

#Q-37. Write an SQL query to show one row twice in results from a table.
select FIRST_NAME, DEPARTMENT FROM WRKR W WHERE W.DEPARTMENT = 'HR'
UNION ALL
SELECT FIRST_NAME, DEPARTMENT FROM WRKR W WHERE W.DEPARTMENT = 'HR';

#Q-38. Write an SQL query to fetch intersecting records of two tables.
#(SELECT * FROM Worker)
#INTERSECT
#(SELECT * FROM WorkerClone);

#Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM WRKR
WHERE WRKR_ID <= (SELECT COUNT(WRKR_ID)/2 FROM WRKR);

#Q-40. Write an SQL query to fetch the departments that have less than five people in it.
SELECT DEPARTMENT , COUNT(WRKR_ID) AS 'NUMBER OF WRKR' FROM WRKR GROUP BY DEPARTMENT HAVING COUNT(WRKR_ID) <5;

#Q-41. Write an SQL query to show all departments along with the number of people in there.
select DEPARTMENT, COUNT(DEPARTMENT) AS 'NUMBER OF WRKR' FROM WRKR GROUP BY DEPARTMENT;

#Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM WRKR WHERE WRKR_ID = (SELECT MAX(WRKR_ID) FROM WRKR);

#Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM WRKR WHERE WRKR_ID = (SELECT MIN(WRKR_ID) FROM WRKR);

#Q-44. Write an SQL query to fetch the last five records from a table.
SELECT * FROM WRKR WHERE WRKR_ID <= 5
UNION
SELECT * FROM (SELECT * FROM WRKR W ORDER BY W.WRKR_ID DESC) AS W1 WHERE W1.WRKR_ID <= 5;

#Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from WRKR group by DEPARTMENT) as TempNew 
Inner Join WRKR t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;

#Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT distinct Salary from WRKR a WHERE 3 >= (SELECT count(distinct Salary) from WRKR b WHERE a.Salary <= b.Salary) order by a.Salary desc;

#Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT DISTINCT SALARY FROM WRKR a WHERE 3 >= (SELECT COUNT(DISTINCT SALARY) FROM WRKR b WHERE a.SALARY >= b.SALARY) ORDER BY a.SALARY DESC;

#Q-48. Write an SQL query to fetch nth max salaries from a table.
#SELECT distinct Salary from WRKR a WHERE n >= (SELECT count(distinct Salary) from WRKR b WHERE a.Salary <= b.Salary) order by a.Salary desc;

#Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT, SUM(SALARY) FROM WRKR GROUP BY DEPARTMENT;

#Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY FROM WRKR WHERE SALARY = (SELECT MAX(SALARY) FROM WRKR);

#Q-28. Write an SQL query to clone a new table from another table.
#create table workerclone LIKE WRKR;

#SELECT *FROM workerclone;

#Q-29. Write an SQL query to fetch intersecting records of two tables.
#(SELECT * FROM WRKR)
#INTERSECT
#(SELECT * FROM workerclone);

#Q-30. Write an SQL query to show records from one table that another table does not have.
#SELECT * FROM WRKR
#MINUS
#SELECT * FROM Title;

#Q-31. Write an SQL query to show the current date and time.
select curdate();
select now()

#Q-32. Write an SQL query to show the top n (say 10) records of a table.
#Following MySQL query will return the top n records using the LIMIT method