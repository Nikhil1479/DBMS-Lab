DECLARE
    v_csid crssection.CsId%TYPE := '&CsID';
    v_count number;
BEGIN
    v_count := college_package.section_count(v_csid);

    DBMS_OUTPUT.PUT_LINE('Maximum No. of seats in '||v_csid||' is: '||v_count);
END;