DECLARE
    gross_pay NUMBER;
    net_pay NUMBER;
    hours_worked NUMBER;
    rate NUMBER;

BEGIN

    DBMS_OUTPUT.PUT_LINE('Total Number of Hours Worked: ');
    hours_worked := &hours_worked;

    DBMS_OUTPUT.PUT_LINE('Rate');
    rate := &rate;

    gross_pay := hours_worked * rate;
    net_pay := gross_pay - (gross_pay * 0.28);

    DBMS_OUTPUT.PUT_LINE('Gross Salary = '||gross_pay);
    DBMS_OUTPUT.PUT_LINE('Net Salary = '||net_pay);
END;