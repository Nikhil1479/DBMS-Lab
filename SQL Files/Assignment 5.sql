-- Assignment 5

-- Ques 1.
select concat(employee.Fname,concat(' ',employee.lname)) as "Employee Name", dept.deptname 
from employee INNER JOIN dept ON employee.deptid = dept.deptid;

-- Employee Name                             DEPTNAME
-- ----------------------------------------- --------------------
-- John Smith                                Finance
-- Nikhil Gupta                              Finance
-- Derek Dave                                Infosys
-- Alex McCall                               Infosys
-- Larry Houstan                             Marketing


-- Ques 2.
select concat(employee.Fname,concat(' ',employee.lname)) as "Employee Name",supervisor 
from employee where EMPLOYEEID = '433';

-- Employee Name                             SUPERVISOR
-- ----------------------------------------- --------------------
-- Alex McCall                               joey


-- Ques 3.
select concat(employee.lname,concat(' ',employee.fname)) as "Employee Name", supervisor, salary from employee;

-- Employee Name                             SUPERVISOR               SALARY
-- ----------------------------------------- -------------------- ----------
-- Smith John                                rohan                    320650
-- Houstan Larry                             amit                     150000
-- Gupta Nikhil                              scarlet                   75000
-- Dave Derek                                mark                      80000
-- McCall Alex                               joey                      66500


-- Ques 4.
select concat(employee.fname,concat(' ',employee.lname)) "Employee name",employee.Salary,emplevel.levelno 
from employee INNER JOIN emplevel ON employee.salary>=emplevel.lowsalary and 
employee.salary<=emplevel.highsalary;

-- Employee name                                 SALARY    LEVELNO
-- ----------------------------------------- ---------- ----------
-- John Smith                                    320650          4
-- Larry Houstan                                 150000          4
-- Derek Dave                                     80000          3
-- Nikhil Gupta                                   75000          3
-- Alex McCall                                    66500          3


-- Ques 5.
select concat(employee.lname, concat(',',employee.fname)) as "Employee Name", dept.deptname, position.poscdesc,
qualification.qualdesc from Employee INNER JOIN Dept ON Employee.deptid=dept.deptid INNER JOIN position ON Employee.PositionID=Position.PositionID 
INNER JOIN Qualification ON Employee.QualID = Qualification.QUALID;

-- Employee Name                             DEPTNAME             POSCDESC             QUALDESC
-- ----------------------------------------- -------------------- -------------------- --------------------
-- Smith,John                                Finance              President            Doctorate
-- Dave,Derek                                Infosys              Manager              Doctorate
-- Gupta,Nikhil                              Finance              Manager              Masters
-- Houstan,Larry                             Marketing            Manager              Masters
-- McCall,Alex                               Infosys              Programmer           Associates

-- Ques 6.
select concat(employee.fname, concat(',',employee.lname)) as "Employee Name", dept.deptname 
from Employee INNER JOIN Dept ON Employee.deptid = dept.deptid where dept.deptname = 'Finance';

-- Employee Name                             DEPTNAME
--------------------------------------- --------------------
-- John,Smith                                Finance
-- Nikhil,Gupta                              Finance


-- Ques 7.
select concat(employee.lname, concat(',',employee.fname)) as "Employee Name",dependent.* from
 Employee FULL OUTER JOIN Dependent ON Employee.EmployeeID = Dependent.EMployeeID;

-- Employee Name                             RELATION
--------------------------------------- --------------------
-- Dave,Derek                                Spouse
-- ,                                         Son
-- ,                                         Spouse
-- Smith,John                                Daughter
-- Gupta,Nikhil                              Son
-- McCall,Alex
-- Houstan,Larry

-- 7 rows selected.


-- Ques 8.
select employee.fname, TRUNC(( EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HireDate) )) as "Total Number of Years", 
dept.deptname from Employee INNER JOIN Dept ON dept.EmployeeID = Employee.EmployeeID 
Order by TRUNC(( EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HireDate) )) Desc;
-- 
-- FNAME                Total Number of Years DEPTNAME
------------------ --------------------- --------------------
-- John                                    62 Managing
-- Larry                                   55 Marketing
-- Nikhil                                  31 Finance
-- Derek                                   27 Infosys


-- Ques 9.
select employee.fname, employee.lname, dept.deptname from employee INNER JOIN 
dept ON employee.deptid = dept.deptid where 
dept.deptid=(select employee.deptid from employee where employee.fname='John') 
AND fname != 'John';

-- FNAME                LNAME                DEPTNAME
------------------ -------------------- --------------------
-- Nikhil               Gupta                Finance


-- Ques 10.
select concat(student.fname, concat(',',student.lname)) as "Student Name", major.majordesc 
from Student INNER JOIN Major ON MAjor.MajorID = Student.MajorID;

-- Student Name                              MAJORDESC
--------------------------------------- --------------------
-- Tom,Cruise                                Accounting
-- Mickey,Tyler                              Computer Science
-- -- Rajesh,Patel                              Telecommunication
-- Deborah,Rickles                           Mechanical
-- Brian,Lee                                 Electronics

-- Ques 11.
select concat(student.fname, concat(',',Student.lname)) as "Student Name" from STUDENT INNER Join 
CRSSECTION ON CRSSECTION.FACULTYID = STUDENT.FACULTYID INNER JOIN TERM ON TERM.TERMID = CRSSECTION.TERMID 
where ENDDATE Between TO_DATE('2022-11-01','YYYY-MM-DD') AND TO_Date('2023-02-01','YYYY-MM-DD');

-- Student Name
-- -----------------------------------------
-- Tom,Cruise

-- Ques 12
select concat(student.fname, concat(',',Student.lname)) as "Student Name", FACULTY.NAME, 
LOCATION.BUILDING,LOCATION.ROOMNO from STUDENT INNER JOIN FACULTY ON 
FACULTY.FACULTYID = STUDENT.FACULTYID INNER JOIN 
LOCATION ON LOCATION.ROOMID = FACULTY.ROOMID;

-- Student Name                              NAME                 BUILDING             ROOMNO
-- ----------------------------------------- -------------------- -------------------- --------------------
-- Rajesh,Patel                              Rajdeep              WingA                501
-- Tom,Cruise                                Biswajit             WingC                703


-- Ques 13
select CRSSECTION.* , FACULTY.NAME "Faculty Name" from CRSSECTION FULL JOIN 
FACULTY on CRSSECTION.FACULTYID=FACULTY.FACULTYID FULL JOIN TERM on 
CRSSECTION.TERMID=TERM.TERMID where startdate between
 To_DATE('01-01-2022','DD-MM-YYYY') AND TO_DATE('01-06-2022','DD-MM-YYYY');

-- CSID                 COURSEID             SECTION              TERMID               FACULTYID            DAY                  STARTTIME            ENDTIME              ROOMID                 MAXCOUNT Faculty Name
-- -------------------- -------------------- -------------------- -------------------- -------------------- -------------------- -------------------- -------------------- -------------------- ---------- --------------------
-- 1101                 CS1001               01                   SP22                 111                  Mon                  09:00                10:30                13                           30 Rajdeep

-- Ques 14
SQL> select title , prereq from course;

-- TITLE                PREREQ
-- -------------------- --------------------
-- DSA
-- DBMS                 SQL
-- OS                   BASH
-- WebTech              HTML
-- COA