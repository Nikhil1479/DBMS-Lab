DECLARE
    num number := 1;
BEGIN

while num <= 5 LOOP
INSERT INTO ITEM VALUES(num);
num := num +1;
END LOOP;
END;