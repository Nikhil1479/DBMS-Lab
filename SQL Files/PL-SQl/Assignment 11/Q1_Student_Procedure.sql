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



DECLARE
    v_id student.StudentId%TYPE := '&Student_Id';
    v_lname student.lname%TYPE;
    v_fname student.fname%TYPE;
    v_phone student.Phone%TYPE;
BEGIN

    get_student(v_id, v_lname, v_fname, v_phone);
    IF v_fname IS NOT NULL THEN
      DBMS_OUTPUT.PUT_LINE('Name:  '||v_fname||' '||v_lname);
       DBMS_OUTPUT.PUT_LINE('Phone: ' || v_phone);
     END IF;
   END;