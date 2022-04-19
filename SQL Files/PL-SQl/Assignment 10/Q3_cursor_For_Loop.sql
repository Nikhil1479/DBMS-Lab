DECLARE
    incr_sal number;
    CURSOR myCur IS select employeeID, fname, salary from employee where deptid =10
    FOR UPDATE;
BEGIN

    FOR employee_rec IN myCur
    LOOP
        IF employee_rec.salary < 100000
            THEN 
                incr_sal := .15;

            ELSE 
                incr_sal := .10;
        END IF;

        UPDATE employee 
        SET salary = salary + salary * incr_sal
        WHERE CURRENT OF myCur;

    END LOOP;
END;