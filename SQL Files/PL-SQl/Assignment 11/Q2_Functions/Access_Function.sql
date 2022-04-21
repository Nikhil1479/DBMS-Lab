-- Accessing Function

DECLARE
      v_id dept.DeptId%TYPE := '&Department_Id';
      found BOOLEAN;
    BEGIN
      found := find_dept(v_id);
      IF found = TRUE THEN
        DBMS_OUTPUT.PUT_LINE('Department '||v_id||' exists');
      ELSE
        DBMS_OUTPUT.PUT_LINE('Department '||v_id||' does not exist');
     END IF;
   END;