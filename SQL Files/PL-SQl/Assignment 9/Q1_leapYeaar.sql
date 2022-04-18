DECLARE
   year NUMBER;
BEGIN
DBMS_OUTPUT.PUT_LINE('Enter a Year');
    year := &year;
   IF MOD(year, 4)=0
      AND
      MOD(year, 100)!=0
      OR
      MOD(year, 400)=0 THEN
      dbms_output.Put_line(year || ' is leap year ');
   ELSE
      dbms_output.Put_line(year || ' is not leap year.');
   END IF;
END;