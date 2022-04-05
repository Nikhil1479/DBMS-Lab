Assignment 6

-- Ques 1.
SQL> select employee.fname, employee.lname, dept.deptname from employee INNER JOIN Dept ON employee.deptid = dept.deptid where employee.fname= (select fname from employee where fname='John');

-- FNAME                LNAME                DEPTNAME
-- -------------------- -------------------- --------------------
-- John                 Smith                Sales


-- Ques 2.
SQL> select supervisor from employee where employeeid = (select employeeid from employee where employeeid = 433);

-- SUPERVISOR
-- --------------------
-- Mark

-- Ques 3.
SQL> select employee.fname, employee.lname, qualification.qualdesc from employee INNER JOIN Qualification ON Qualification.QualID = Employee.QualID where qualification.qualid = (select qualid
from employee where fname='Larry') AND fname != 'Larry';


--  FNAME                LNAME                QUALDESC
-- -------------------- -------------------- --------------------
-- Nikhil               Gupta                Masters


-- Ques 4.
SQL> select deptid, count(*) from employee group by deptid having count(*)>
  2   (select count(*) from employee where deptid=10);

--     DEPTID   COUNT(*)
-- ---------- ----------
--         20          2

-- Ques 5.
SQL> select fname, hiredate from employee where hiredate > (select hiredate from employee where fname = 'Larry');

-- FNAME                HIREDATE
-- -------------------- ---------
-- Nikhil               12-FEB-91
-- Derek                15-MAR-95
-- Alex                 05-MAY-97


-- Ques 6.
SQL> select concat(employee.fname, concat(',',employee.lname)) as "Employee Name", dept.deptname
    from Employee INNER JOIN Dept ON Employee.deptid = dept.deptid where dept.deptname = 'Sales';

-- Employee Name                             DEPTNAME
-- ----------------------------------------- --------------------
-- John,Smith                                Sales


-- Ques 7.
SQL> create table emp30 as select * from employee where deptid=30;

-- Table created.

SQL> select * from emp30;

-- EMPLOYEEID LNAME                FNAME                POSITIONID SUPERVISOR           HIREDATE      SALARY COMMISSION     DEPTID     QUALID
-- ---------- -------------------- -------------------- ---------- -------------------- --------- ---------- ---------- ---------- ----------
--        111 Smith                John                          1 Scott                15-APR-60     320650      35000         30          1


-- Ques 8.
SQL> insert into emp30 (employeeid, lname, fname, positionid, supervisor, hiredate, commission, deptid, qualid)
  2   select employeeid, lname, fname, positionid, supervisor, hiredate, commission, deptid, qualid from employee where deptid=40;

-- 1 row created.

SQL> select * from emp30;
 
-- EMPLOYEEID LNAME                FNAME                POSITIONID SUPERVISOR           HIREDATE      SALARY COMMISSION     DEPTID     QUALID
-- ---------- -------------------- -------------------- ---------- -------------------- --------- ---------- ---------- ---------- ----------
--        111 Smith                John                          1 Scott                15-APR-60     320650      35000         30          1
--        246 Houstan              Larry                         2 Emma                 19-MAY-67                 10000         40          2


-- Ques 9.
MERGE INTO emp30 o  USING (SELECT EmployeeId, Lname, Fname, HireDate, Salary  FROM employee) e ON (o.EmployeeId = e.EmployeeId)WHEN MATCHED THEN UPDATE SET o.Salary = e.Salary WHEN NOT MATCHED THEN INSERT (o.EmployeeId,o.Lname,o.Fname,o.HireDate,o.Salary) VALUES (e.EmployeeId,e.Lname,e.Fname,e.HireDate,e.Salary);

-- Ques 10.
SQL> SELECT Lname, Fname, Salary, DeptId  FROM employee o WHERE Salary = (SELECT MIN(Salary)  FROM employee WHERE DeptId = o.DeptId   GROUP BY DeptId);

-- LNAME                FNAME                    SALARY     DEPTID
-- -------------------- -------------------- ---------- ----------
-- Smith                John                     320650         30
-- Houstan              Larry                    150000         40
-- Gupta                Nikhil                    75000         10
-- McCall               Alex                      66500         20


-- Ques 11
SQL> select * from dependent where employeeid = (select employeeid from dept where deptname='Finance');

-- EMPLOYEEID DEPENDENTID DEPDOB    RELATION
-- ---------- ----------- --------- --------------------
--        123           2 23-AUG-97 Son


-- Ques 12.
SQL> select lname, fname from employee where employeeid=ANY
  2   (select employeeid from employee minus select distinct employeeid from
  3  dependent);

-- LNAME                FNAME
-- -------------------- --------------------
-- Houstan              Larry
-- McCall               Alex


-- Ques 13.
SQL> select lname, fname from employee where employeeid=543 and salary =ANY
  2   (select avg(salary) from employee group by deptid);

-- no rows selected

SQL> select lname, fname from employee where employeeid=543 and salary >ANY
  2   (select avg(salary) from employee group by deptid);

-- LNAME                FNAME
-- -------------------- --------------------
-- Dave                 Derek

SQL> select lname, fname from employee where employeeid=543 and salary <ANY
  2   (select avg(salary) from employee group by deptid);

-- LNAME                FNAME
-- -------------------- --------------------
-- Dave                 Derek

SQL> select lname, fname from employee where employeeid=543 and salary >ALL
  2   (select avg(salary) from employee group by deptid);

-- no rows selected

SQL> select lname, fname from employee where employeeid=543 and salary <ALL
  2   (select avg(salary) from employee group by deptid);

-- no rows selected


-- Student Database
-- Ques 14
select faculty.name, faculty.phone from faculty where faculty.facultyid = (select facultyid from student where lname='Lee' and fname='Brian');

-- Ques 15.
SQL> select * from location where roomtype != 'O' and capacity <= ANY
  2      (select capacity from
  3      (select capacity from location where roomtype != 'O' group by capacity order by capacity)
  4  where rownum <= 2);

-- ROOMID               BUILDING             ROOMNO                 CAPACITY ROOMTYPE
-- -------------------- -------------------- -------------------- ---------- --------------------
-- 2                    WingB                602                           3 NonAC
-- 3                    WingC                703                           2 AC
-- 4                    WingC                802                           2 AC
-- 5                    WingD                401                           3 NonAC


-- Ques 16.
SQL> select * from (select * from crssection where termid='SP22'
  2  order by maxcount desc) where rownum<=3;

-- CSID                 COURSEID             SECTION              TERMID               FACULTYID            DAY                  STARTTIME            ENDTIME              ROOMID                 MAXCOUNT
-- -------------------- -------------------- -------------------- -------------------- -------------------- -------------------- -------------------- -------------------- -------------------- ----------
-- 1101                 CS1001               01                   SP22                 111                  Mon                  09:00                10:30                13                           30


-- Ques 17.
SQL> select * from location INNER JOIN ROOM ON Room.RoomType = Location.RoomType where location.RoomType = 'C';

-- ROOMID               BUILDING             ROOMNO                 CAPACITY ROOMTYPE             ROOMTYPE             ROOMDESC
-- -------------------- -------------------- -------------------- ---------- -------------------- -------------------- --------------------
-- 2                    WingB                602                           3 C                    C                    Classroom


-- Ques 18.
SQL> create table SP03SECT as select CourseID, Section, FacultyID, RoomID from crssection;

-- Table created.

SQL> select * from sp03sect;

-- COURSEID             SECTION              FACULTYID            ROOMID
-- -------------------- -------------------- -------------------- --------------------
-- CS1001               01                   111                  13
-- DB2002               01                   123                  13
-- IT2003               02                   111                  14
-- WT1006               03                   345                  14
-- CO1004               02                   345                  14

-- Ques 19
SQL> delete from SP03SECT where facultyID = (select facultyID from faculty where name='Rajdeep');

-- 2 rows deleted.

SQL> select * from SP03Sect;

-- COURSEID             SECTION              FACULTYID            ROOMID
-- -------------------- -------------------- -------------------- --------------------
-- DB2002               01                   123                  13
-- WT1006               03                   345                  14
-- CO1004               02                   345                  14


-- Ques 20.
SQL> SELECT f.name from faculty f
  2  WHERE NOT EXISTS (
  3      select * from crssection c where c.facultyid = f.facultyid and c.termid = 'SP22');

-- NAME
-- --------------------
-- Biswajit
-- HimansuDas
-- Williams
-- Collins