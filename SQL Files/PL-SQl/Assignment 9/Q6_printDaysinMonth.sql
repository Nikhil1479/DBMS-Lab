DECLARE
    numberOfDays date;
    month number;
    year number;
BEGIN
-- month := &month;
-- year := &year;
numberOfDays := TO_DATE('&month-&year','mm-yyyy');
numberOfDays := LAST_DAY(numberOfDays);

DBMS_OUTPUT.PUT_LINE('number of days in month '||TO_CHAR(numberOfDays, 'DD'));
END;