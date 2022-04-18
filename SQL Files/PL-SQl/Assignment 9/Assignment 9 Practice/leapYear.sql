DECLARE
year number;
BEGIN

DBMS_OUTPUT.PUT_LINE('Enter Year: ');
year := &year;

IF mod(year,4)=0
AND
mod(year,100) != 0
OR
mod(year, 400) = 0
THEN
DBMS_OUTPUT.PUT_LINE('Leap Year');

ELSE
DBMS_OUTPUT.PUT_LINE('Not a leap year');
END IF;
END;