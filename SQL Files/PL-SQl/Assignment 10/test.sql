DECLARE
    v_name VARCHAR2(20);
    CURSOR my_Cur (sal number) IS select fname from employee where salary > sal;
BEGIN

OPEN my_Cur(10000);
LOOP
    FETCH my_Cur INTO v_name;
    DBMS_OUTPUT.PUT_LINE('Employee name: ' ||v_name);
    EXIT WHEN my_Cur%NOTFOUND;
    END LOOP;
END;