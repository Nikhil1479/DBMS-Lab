DECLARE
    v_fname varchar2(20);
    v_lname varchar2(20);
    v_salary number;
    v_hiredate date;

    CURSOR cur_myCur IS select fname,lname,salary,hiredate from employee WHERE salary > 50000 
    and hiredate < TO_DATE('31-12-1997','DD-MM-YYYY');
    
BEGIN
    OPEN cur_myCur;
    LOOP
        FETCH cur_myCur INTO v_fname, v_lname,v_salary, v_hiredate;
        DBMS_OUTPUT.PUT_LINE(v_fname || ' ' || v_lname || ' ' || v_salary || ' ' || v_hiredate);
        
        EXIT WHEN cur_myCur%NOTFOUND;
    END LOOP;
    CLOSE cur_myCur;
END;