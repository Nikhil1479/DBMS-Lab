CREATE OR REPLACE PROCEDURE get_student
  2     (i_studentid IN NUMBER,
  3      o_last OUT VARCHAR2,
  4      o_first OUT VARCHAR2,
  5      o_phone OUT CHAR)
  6  IS
  7  BEGIN
  8     SELECT Last, First, Phone
  9       INTO o_last, o_first, o_phone
 10     FROM student
 11     WHERE StudentId = i_studentid;
 12  EXCEPTION
 13    WHEN OTHERS THEN
 14    DBMS_OUTPUT.PUT_LINE('StudentId ' ||
 15      TO_CHAR(i_studentid) || ' does not exist');
 16  END get_student;
 17  /

Procedure created.


SQL> DECLARE
  2    v_id student.StudentId%TYPE := '&Student_Id';
  3    v_last student.Last%TYPE;
  4    v_first student.First%TYPE;
  5    v_phone student.Phone%TYPE;
  6  BEGIN
  7    get_student(v_id, v_last, v_first, v_phone);
  8    IF v_last IS NOT NULL THEN
  9      DBMS_OUTPUT.PUT_LINE('Name:  '||v_first||' '||v_last);
 10      DBMS_OUTPUT.PUT_LINE('Phone: ' || v_phone);
 11    END IF;
 12  END;