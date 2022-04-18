DECLARE
    i int := 1;
BEGIN

while i <= 10
LOOP
if mod(i, 2) != 0
THEN
DBMS_OUTPUT.PUT_LINE(i || ' ');
END IF;
i := i+1;
END LOOP;
END;
/