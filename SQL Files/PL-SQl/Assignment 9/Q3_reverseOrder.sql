DECLARE
    n number;
BEGIN
for i in REVERSE 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE(i || ' ');
    END LOOP;
END;