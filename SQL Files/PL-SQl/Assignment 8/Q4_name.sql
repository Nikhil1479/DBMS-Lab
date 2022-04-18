DECLARE
    firstName VARCHAR2(20);
    lastName VARCHAR2(20);
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter Your First Name: ');
    firstName := '&firstName';
    
    DBMS_OUTPUT.PUT_LINE('Enter Your Last Name: ');
    lastName := '&lastName';

    DBMS_OUTPUT.PUT_LINE('Hello ' ||lastName ||', ' ||firstName );

END;