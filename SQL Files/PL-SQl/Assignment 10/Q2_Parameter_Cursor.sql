DECLARE

    v_empID number(10);
    v_fname varchar2(20);
    v_lname varchar2(20);
    v_positionID NUMBER(10);
    v_supervisor VARCHAR2(20);
    v_hiredate date;
    v_salary number(20);
    v_commission number(20);
    v_deptID number(20);
    v_qualID number(20);

    Cursor cur_myCur (v_emp_sal employee.salary%TYPE) IS select employeeID, fname, lname, positionID,
    supervisor, hiredate, salary, commission, deptid, qualid from employee where salary > v_emp_sal;

BEGIN

OPEN cur_myCur(50000);
LOOP    
    FETCH cur_myCur INTO v_empID, v_fname,v_lname, v_positionID, v_supervisor, v_hiredate, v_salary, v_commission,
    v_deptID, v_qualID;

    DBMS_OUTPUT.PUT_LINE('EmployeeID: '||v_empID || '  ' ||v_fname || '  '||v_lname || '  '||v_positionID ||'  '||
    v_supervisor || '  '|| v_hiredate || '  '|| v_salary || '  '|| v_commission || '  '|| v_deptID || '  '||v_qualID);

    EXIT WHEN cur_myCur%NOTFOUND;

END LOOP;
CLOSE cur_myCur;
END;