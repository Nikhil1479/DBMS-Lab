-- Accessing Procedure

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