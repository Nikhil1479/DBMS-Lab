DECLARE 
     bad_op EXCEPTION;
     n1 NUMBER := &number1;
     n2 NUMBER := &number2;
     op VARCHAR2(1) := '&operator';
     res NUMBER;

 BEGIN
     IF op<>'+' AND op<>'-' AND op <>'*' AND op<>'/' THEN
       RAISE bad_op;
      END IF;
      IF op = '+' THEN
        res := n1 + n2;
      ELSIF op = '-' THEN
        res := n1 - n2;
      ELSIF op = '*' THEN
        res := n1 * n2;
      ELSIF op = '/' THEN
        res := n1 / n2;
      END IF;
      DBMS_OUTPUT.PUT_LINE(n1 || op || n2 || '=' || res); 
        
   EXCEPTION
      WHEN bad_op THEN
        DBMS_OUTPUT.PUT_LINE('No such math operator: ' || op);
      WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Cannot divide by zero');
   END;