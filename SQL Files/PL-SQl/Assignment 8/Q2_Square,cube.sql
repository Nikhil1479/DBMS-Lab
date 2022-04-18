DECLARE
    num int;
    square NUMBER(20,2);
    cube NUMBER(20,2);
    double_num NUMBER(20,2);

BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter a Number');
    num := &num;
    cube := POWER( num,3);
    square := POWER(num,2);
    double_num := num + num;

    DBMS_OUTPUT.PUT_LINE('Square of ' ||num || ' is ' ||square);
    DBMS_OUTPUT.PUT_LINE('Cube of '||num || ' is ' ||cube);
    DBMS_OUTPUT.PUT_LINE('Double of '||num||' is '||double_num);
END;