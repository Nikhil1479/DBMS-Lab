DECLARE
    numberOfDays date;
    month number;
    year number;
BEGIN

numberOfDays := TO_DATE('&month-&year','mm-yyyy');
numberOfDays := LAST_DAY(numberOfDays);

DBMS_OUTPUT.PUT_LINE('number of days in month '||TO_CHAR(numberOfDays, 'DD'));
END;