DECLARE
    Area int;
    PI CONSTANT Number:=3.14;
    Radius int;
    
BEGIN
    Radius := &Radius;
    Area := PI * Radius * Radius;
    DBMS_OUTPUT.PUT_LINE('Area of Circle with Radius ' ||Radius ||' is: '||Area);
END;