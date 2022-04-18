DECLARE
    num number := 1;

BEGIN
  while num <= 10
    LOOP
        DBMS_OUTPUT.PUT_LINE(num);
        num := num + 2;
    END LOOP;
  
END;