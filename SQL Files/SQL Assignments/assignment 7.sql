-- Ques 1
SQL> select * from employee;

EMPLOYEEID LNAME                FNAME                POSITIONID SUPERVISOR           HIREDATE      SALARY COMMISSION     DEPTID     QUALID
---------- -------------------- -------------------- ---------- -------------------- --------- ---------- ---------- ---------- ----------
       111 Smith                John                          1 Scott                15-APR-60     320650      35000         30          1
       246 Houstan              Larry                         2 Emma                 19-MAY-67     150000      10000         40          2
       123 Gupta                Nikhil                        2 Mathew               12-FEB-91      75000                    10          2
       543 Dave                 Derek                         2 Sean                 15-MAR-95      80000      20000         20          1
       433 McCall               Alex                          3 Mark                 05-MAY-97      66500                    20          4

SQL> create view employeeInfo as select employeeid, lname, fname, positionid, supervisor, hiredate, 
deptid, qualid from employee;

-- View created.

SQL> select * from employeeInfo;

-- EMPLOYEEID LNAME                FNAME                POSITIONID SUPERVISOR           HIREDATE      DEPTID     QUALID
-- ---------- -------------------- -------------------- ---------- -------------------- --------- ---------- ----------
--        111 Smith                John                          1 Scott                15-APR-60         30          1
--        246 Houstan              Larry                         2 Emma                 19-MAY-67         40          2
--        123 Gupta                Nikhil                        2 Mathew               12-FEB-91         10          2
--        543 Dave                 Derek                         2 Sean                 15-MAR-95         20          1
--        433 McCall               Alex                          3 Mark                 05-MAY-97         20          4


-- Ques 2
