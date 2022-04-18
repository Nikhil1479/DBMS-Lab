DECLARE
    multiplicand int;
    multiplier int := 0;

BEGIN
    multiplicand := &multiplicand;
    
    WHILE multiplier<=10
    LOOP
        DBMS_OUTPUT.PUT_LINE( multiplicand ||' X '|| multiplier ||' = '||multiplicand*multiplier);
        multiplier:=multiplier+1;
    END LOOP;
END;