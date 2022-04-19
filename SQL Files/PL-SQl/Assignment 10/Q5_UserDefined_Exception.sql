DECLARE
    no_course EXCEPTION;
    CURSOR course_cur IS
      SELECT * FROM course;
    crs_id course.CourseId%TYPE := '&CourseId';
    found BOOLEAN := FALSE;
    course_rec course%ROWTYPE;

 BEGIN
    OPEN course_cur;
     FETCH course_cur INTO course_rec;

     WHILE course_cur%FOUND LOOP
       IF course_rec.CourseId = crs_id THEN
          found := TRUE;

         DBMS_OUTPUT.PUT_LINE
            ('Course Id: ' || course_rec.CourseId);
         DBMS_OUTPUT.PUT_LINE
            ('Title      ' || course_rec.Title);
         DBMS_OUTPUT.PUT_LINE
            ('Credits:   ' || course_rec.Credits);
         DBMS_OUTPUT.PUT_LINE
            ('PreReq:    ' || course_rec.PreReq);

        END IF;

           FETCH course_cur INTO course_rec;
      END LOOP;

      IF found = false THEN
         RAISE no_course;
      END IF;

      CLOSE course_cur;
 
  EXCEPTION
     WHEN no_course THEN
       DBMS_OUTPUT.PUT_LINE('No such course: ' || crs_id);
  END;