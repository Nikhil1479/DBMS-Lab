CREATE OR REPLACE PROCEDURE get_student 
(in_studentID IN number,
v_lname OUT varchar2,
v_fname OUT varchar2,
v_phone OUT varchar2)
 IS

BEGIN
    select fname, lname, phone INTO v_fname, v_lname, v_phone
    from STUDENT 
    WHERE studentID = in_studentID;

EXCEPTION
  When others THEN
    DBMS_OUTPUT.PUT_LINE('Student ID '|| to_char(in_studentID) || ' does not exist');

END get_student;