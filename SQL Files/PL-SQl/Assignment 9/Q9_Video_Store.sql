DECLARE
rentalDate DATE;
returnDate DATE;

BEGIN
rentalDate := TO_DATE('&rentalDay-&rentalMonth-&rentalYear','dd-mm-yyyy');

returnDate := rentalDate + INTERVAL '3' DAY;

dbms_output.put_line('Rental Date: '||TO_CHAR(rentalDate,'DD')||'  
Rental Month: '||TO_CHAR(rentalDate,'MM')||'  Rental Year: '||TO_CHAR(rentalDate,'YYYY'));

dbms_output.put_line('Return Date: '||TO_CHAR(returnDate,'DD')||'  
Return Month: '||TO_CHAR(returnDate,'MM')||'  Return Year: '||TO_CHAR(returnDate,'YYYY'));

END;