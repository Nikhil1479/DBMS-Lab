DECLARE
    v_emp employee%ROWTYPE;
    v_qual qualification%ROWTYPE;
    employeeID number;
    
BEGIN
-- employeeID := &employeeID;
    select employee.fname, employee.lname, employee.salary, qualification.qualdesc, employee.commission  
    INTO v_emp.fname, v_emp.lname, v_emp.salary,v_qual.qualdesc, v_emp.commission from employee INNER JOIN 
    QUALIFICATION ON qualification.qualid = employee.qualid WHERE Employee.employeeID = &employeeID;

    DBMS_OUTPUT.PUT_LINE('Employee Name: '||v_emp.fname || ' ' || v_emp.lname);
    DBMS_OUTPUT.PUT_LINE('Qualification: '||v_qual.qualdesc);
    DBMS_OUTPUT.PUT_LINE('Total Salary: '|| (v_emp.salary + v_emp.commission));
END;