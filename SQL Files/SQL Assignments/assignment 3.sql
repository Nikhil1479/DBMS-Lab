Ques 1. 
SQL> column salary format $999,999
SQL> select concat(fname,concat(', ',lname)) as Fullname, salary as Salary from employee;

-- FULLNAME                                      SALARY
-- ------------------------------------------ ---------
-- John, Smith                                 $291,500
-- Larry, Houstan                              $150,000
-- Nikhil, Gupta                                $75,000
-- Derek, Dave                                  $80,000
-- Alex, McCall                                 $66,500


Ques 2.
SQL> select Fname, Lname from employee where commission is NULL;

-- FNAME                LNAME
-- -------------------- --------------------
-- Nikhil               Gupta
-- Alex                 McCall


Ques 3.
SQL> select distinct building from location;

-- BUILDING
-- --------------------
-- WingC
-- WingB
-- WingD
-- WingA

Ques 4.
SQL> select * from term where startdate between To_DATE('19-01-2024','DD-MM-YYYY') AND TO_DATE('02-05-2024','DD-MM-YYYY');

-- TERMID               TERMDESC             STARTDATE ENDDATE
-- -------------------- -------------------- --------- ---------
-- SP24                 Spring2024           19-JAN-24 02-JUN-24


Ques 5.
SQL> select name from faculty where deptId in(1,2);

-- NAME
-- --------------------
-- Rajdeep
-- HimansuDas


Ques 6.
SQL> select * from student where city in ('Manhattan','Scottdale');

-- STUDENTID            LNAME                FNAME                STREET               CITY                 STATE                       ZIP STARTTERM            BIRTHDATE FACULTYID            MAJORID                   PHONE
-- -------------------- -------------------- -------------------- -------------------- -------------------- -------------------- ---------- -------------------- --------- -------------------- -------------------- ----------
-- 00100                Cruise               Tom                  BleeckerStreet       Manhattan            NY                        10012 2005                 30-APR-02 123                  100                  8273011131
-- 00103                Rickles              Deborah              NorthKierland        Scottdale            Arizona                   85254 2017                 21-JUN-01 431                  400                  7568347231


Ques 7.
SQL> update employee set salary = salary+(salary*10/100) where employeeid = '111';

-- 1 row updated.

Ques 8.


Ques 8.
SQL> select CSID, maxcount from crssection order by maxcount desc;

-- CSID                   MAXCOUNT
-- -------------------- ----------
-- 1103                         45
-- 1102                         40
-- 1105                         35
-- 1104                         30
-- 1101                         30


Ques 9.
insert into term values('6006','MidTerm',TO_DATE('2022-01-03','YYYY-MM_DD'),TO_DATE('2022-06-20','YYYY-MM-DD'));

Ques 10.



Ques 11.
SQL> select * from course where prereq is NULL;

-- COURSEID             TITLE                CREDITS              PREREQ
-- -------------------- -------------------- -------------------- --------------------
-- CS1001               DSA                  4
-- CO1004               COA                  3


Ques 12.
SQL>  select name from faculty where name LIKE 'C%';

-- NAME
-- --------------------
-- Collins


Ques 13.
SQL> select name, deptid from faculty order by name, deptid desc;

-- NAME                 DEPTID
-- -------------------- --------------------
-- Biswajit             3
-- Collins              5
-- HimansuDas           2
-- Rajdeep              1
-- Williams             4


Ques 14.
SQL> SELECT * FROM term WHERE TO_CHAR(startDate,'dd.mm.yyyy') LIKE '%01.2022';

-- TERMID               TERMDESC             STARTDATE ENDDATE
-- -------------------- -------------------- --------- ---------
-- SP22                 Spring2022           03-JAN-22 01-JUN-22


Ques 16.
COLUMN salary FORMAT 9,999.99;
COLUMN Lname FORMAT A30;
select * from employee;
