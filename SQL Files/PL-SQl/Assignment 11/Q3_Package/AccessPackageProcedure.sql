DECLARE
v_roomNo location.RoomNo%TYPE := &RoomNo;
v_capacity location.Capacity%TYPE;
v_bldg location.Building%TYPE;

BEGIN
    college_package.find_room(v_roomNo, v_capacity, v_bldg);
    
     IF v_capacity IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Room No.: '||v_roomNo);
        DBMS_OUTPUT.PUT_LINE('Capacity: '||v_capacity);
        DBMS_OUTPUT.PUT_LINE('Building: '||v_bldg);
     END IF;
END;