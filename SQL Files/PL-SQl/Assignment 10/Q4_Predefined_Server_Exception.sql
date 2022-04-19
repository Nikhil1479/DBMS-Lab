DECLARE
    v_emp employee%ROWTYPE;
    v_qual qualification%ROWTYPE;
    qualID number;

BEGIN
    select employee.fname, employee.qualID, qualification.qualdesc INTO v_emp.fname, v_emp.qualID, v_qual.qualdesc
    from EMPLOYEE INNER JOIN Qualification ON Employee.qualid = qualification.qualID where employee.qualID = &qualID;

    DBMS_OUTPUT.PUT_LINE('Employee Name: '||v_emp.fname);
    DBMS_OUTPUT.PUT_LINE('Qualification ID: '||v_emp.qualID);
    DBMS_OUTPUT.PUT_LINE('Qualification: '||v_qual.qualdesc);

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('More than one employee with such qualification');
`
    When NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No Employees with such Qualification');
END;