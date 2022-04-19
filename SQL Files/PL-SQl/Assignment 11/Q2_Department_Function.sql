CREATE OR REPLACE FUNCTION find_dept(in_id IN NUMBER)
    RETURN BOOLEAN
    IS
      v_deptname dept.DeptName%TYPE;
    BEGIN
        SELECT DeptName
        INTO v_deptname
        FROM dept
        WHERE DeptId = in_id;

        IF v_deptname IS NOT NULL THEN
            RETURN TRUE;
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN FALSE;
    END;

    DECLARE
      v_id dept.DeptId%TYPE := '&Department_Id';
      found BOOLEAN;
    BEGIN
      found := find_dept(v_id);
      IF found = TRUE THEN
        DBMS_OUTPUT.PUT_LINE('Department '||v_id||' exists');
      ELSE
        DBMS_OUTPUT.PUT('Department '||v_id||' does not exist');
     END IF;
   END;