DECLARE
    num number;
    i NUMBER:=1;
BEGIN
DBMS_OUTPUT.PUT_LINE('Enter a number');
num:=&num;
while i <= 10
LOOP
DBMS_OUTPUT.PUT_LINE(num || ' X ' || i || ': ' || num * i);
i:=i+1;
END LOOP;
END;