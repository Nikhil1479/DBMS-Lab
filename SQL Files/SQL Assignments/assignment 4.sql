Assignment 4

Ques 1
SQL> column salary format $999,999
SQL> select concat(fname,concat(', ',lname)) as Fullname, salary as Salary from employee;

-- FULLNAME                                      SALARY
-- ------------------------------------------ ---------
-- John, Smith                                 $291,500
-- Larry, Houstan                              $150,000
-- Nikhil, Gupta                                $75,000
-- Derek, Dave                                  $80,000
-- Alex, McCall                                 $66,500


Ques 2
SQL> select Fname, Lname, NVL(COMMISSION,0) from employee;

-- FNAME                LNAME                NVL(COMMISSION,0)
-- -------------------- -------------------- -----------------
-- John                 Smith                            35000
-- Larry                Houstan                          10000
-- Nikhil               Gupta                                0
-- Derek                Dave                             20000
-- Alex                 McCall                               0


Ques 3.
SQL> select count(RoomNo) as TotalRooms from location;

-- TOTALROOMS
-- ----------
--          5

Ques 4.
SQL> select distinct building from location;

-- BUILDING
-- --------------------
-- WingC
-- WingB
-- WingD
-- WingA

Ques 5.
SQL> select concat(fname,concat(', ',lname)) as Fullname, birthdate as BirthDate from student;

-- FULLNAME                                   BIRTHDATE
-- ------------------------------------------ ---------
-- Tom, Cruise                                30-APR-02
-- Mickey, Tyler                              18-MAR-84
-- Rajesh, Patel                              28-NOV-85
-- Deborah, Rickles                           21-JUN-01
-- Brian, Lee                                 26-MAY-16


Ques 6.
SQL> select round(avg((sysdate-birthdate)/365.25)) "avg",round(max((sysdate-birthdate)/365.25)) "max",round(min((sysdate-birthdate)/365.25)) "min" from student;

--        avg        max        min
-- ---------- ---------- ----------
--         24         38          6



Ques 7.
SQL> select EmployeeId , count(*) as "No of Dependents" from DEPENDENT group by EmployeeId having count(*) >= 1;

-- EMPLOYEEID No of Dependents
-- ---------- ----------------
--        111                1
--        123                1
--        200                1
--        222                1
--        543                1

SQL> select EmployeeId , count(*) as "No of Dependents" from DEPENDENT group by EmployeeId having count(*) >= 2;

-- no rows selected



Ques 8.
SQL> select Fname, Lname, extract(YEAR from HIREDATE) as HIREDATE from employee;

-- FNAME                LNAME                  HIREDATE
-- -------------------- -------------------- ----------
-- John                 Smith                      1960
-- Larry                Houstan                    1967
-- Nikhil               Gupta                      1991
-- Derek                Dave                       1995
-- Alex                 McCall                     1997


Ques 9.
SQL> select avg(commission) as EmployeeCommission from employee;

-- EMPLOYEECOMMISSION
-- ------------------
--         21666.6667


Ques 10.
SQL> select fname, lname, commission from employee where commission is not null;

-- FNAME                LNAME                COMMISSION
-- -------------------- -------------------- ----------
-- John                 Smith                     35000
-- Larry                Houstan                   10000
-- Derek                Dave                      20000


Ques 11.
SQL> select fname, lname, commission from employee where commission is null;

-- FNAME                LNAME                COMMISSION
-- -------------------- -------------------- ----------
-- Nikhil               Gupta
-- Alex                 McCall


Ques 12.
SQL> select sum(maxcount) from crssection;

-- SUM(MAXCOUNT)
-- -------------
--           180


Ques 13.
SQL> select power(2,10) from dual;

-- POWER(2,10)
-- -----------
--        1024


Ques 14.
SQL> select title, case when prereq is null then 'none' else 'one' END from course;

-- TITLE                CASE
-- -------------------- ----
-- DSA                  none
-- DBMS                 one
-- OS                   one
-- WebTech              one
-- COA                  none


Ques 15.
SQL> select count(department.facultyid), department.deptname from department, faculty where faculty.facultyid = department.facultyid group by department.deptname;

-- COUNT(DEPARTMENT.FACULTYID) DEPTNAME
-- --------------------------- --------------------
--                           1 Telecommunication
--                           1 Electronics
--                           1 Computer Science
--                           1 Accounting


Ques 16.
SQL> select deptid, avg(salary) from employee group by deptid having avg(salary) < 75000;

--     DEPTID AVG(SALARY)
-- ---------- -----------
--         20       73250


Ques 17.
SQL> select EMPLOYEEID , TRUNC(( EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HireDate) )) as "Total Number of Years" from EMPLOYEE;

-- EMPLOYEEID Total Number of Years
-- ---------- ---------------------
--        111                    62
--        246                    55
--        123                    31
--        543                    27
--        433                    25



Ques 18.
SQL> select * from student where to_char(birthdate, 'MM')=5;

-- STUDENTID            LNAME                FNAME                STREET               CITY                 STATE                       ZIP STARTTERM            BIRTHDATE FACULTYID            MAJORID                   PHONE
-- -------------------- -------------------- -------------------- -------------------- -------------------- -------------------- ---------- -------------------- --------- -------------------- -------------------- ----------
-- 00104                Lee                  Brian                FirstLane            hope                 NY                        11373 2018                 26-MAY-16 345                  500                  7623451235


Ques 19.
SQL> select LNAME,FNAME,coalesce(SALARY + COMMISSION , SALARY) as PAYOUT from EMPLOYEE;

-- LNAME                FNAME                    PAYOUT
-- -------------------- -------------------- ----------
-- Smith                John                     355650
-- Houstan              Larry                    160000
-- Gupta                Nikhil                    75000
-- Dave                 Derek                    100000
-- McCall               Alex                      66500


Ques 20.
SQL> select FNAME ||' '|| LNAME as Name ,(case when SALARY >= 100000 then 'HIGH' else (case when SALARY >= 50000 then 'MEDIUM' else 'LOW' end) end ) as message from EMPLOYEE;

-- NAME                                      MSG
-- ----------------------------------------- ------
-- John Smith                                HIGH
-- Larry Houstan                             HIGH
-- Nikhil Gupta                              MEDIUM
-- Derek Dave                                MEDIUM
-- Alex McCall                               MEDIUM



