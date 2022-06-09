CREATE OR REPLACE PACKAGE college_package
   AS

   PROCEDURE find_room
     (i_roomno IN location.RoomNo%TYPE,
      o_capacity OUT location.Capacity%TYPE,
      o_bldg OUT location.Building%TYPE);

   FUNCTION section_count
      (i_csid IN crssection.csid%TYPE)
      RETURN NUMBER;

END college_package;

CREATE OR REPLACE PACKAGE BODY college_package AS

   PROCEDURE find_room
     (i_roomno IN location.RoomNo%TYPE,
      o_capacity OUT location.Capacity%TYPE,
      o_bldg OUT location.Building%TYPE) IS

   BEGIN
     SELECT Capacity, Building INTO o_capacity, o_bldg
      FROM location WHERE RoomNo = i_roomno;

   EXCEPTION
      WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE(i_roomno || ' does not exist.');

    END find_room;
--  ---------------------------------------------------------
    FUNCTION section_count
     (i_csid IN crssection.CsId%TYPE) RETURN NUMBER IS
      v_count NUMBER(2);

    BEGIN
     SELECT MaxCount INTO v_count
     FROM crssection WHERE CsId = i_csid;
     Return v_count;

    EXCEPTION
     WHEN NO_DATA_FOUND THEN
     RETURN -1;

    END section_count;
--   -------------------------------------------------
   END college_package;