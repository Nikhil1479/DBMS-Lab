DECLARE

c_id COURSE.COURSEID%TYPE := '&c_id';
CURSOR cou_rse IS SELECT * FROM course;
c_exception EXCEPTION;
course1 cou_rse%ROWTYPE;


BEGIN
    OPEN cou_rse;
    FETCH cou_rse into course1;

    WHILE cou_rse%Found LOOP 
    
        IF Course1.courseid=c_id 
            THEN
            dbms_output.put_line('Course Id->'||course1.courseid||'  Course Title->'||course1.title||
            '  Course Credits->'||course1.credits||'  Course Prereq->'||course1.prereq);

            FETCH cou_rse into course1;
            EXIT;
        END IF;

        IF Course1.courseid!=c_id 
            THEN
            RAISE c_exception;
        END IF;

    END LOOP;

    CLOSE cou_rse;

    EXCEPTION 
    WHEN c_exception THEN
    dbms_output.put_line('Course does not exist'); 
END;