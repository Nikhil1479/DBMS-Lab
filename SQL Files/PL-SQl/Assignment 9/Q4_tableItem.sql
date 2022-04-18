-- create table item(ItemNum int);
DECLARE
num number := 1;
BEGIN
LOOP
    insert into item values(num);
        num := num + 1;
    
        if num > 5
            THEN
                EXIT;
        END IF;
    END LOOP;
END;