DECLARE
rentald DATE;
returnd DATE;
BEGIN
rentald := TO_DATE('&rentalDay-&rentalMonth-&rentalYear','dd-mm-yyyy');
returnd := rentald + INTERVAL '3' DAY;
dbms_output.put_line('Rental Date-> '||TO_CHAR(rentald,'DD')||'  Rental Month-> '||TO_CHAR(rentald,'MM')||'  Rental Year-> '||TO_CHAR(rentald,'YYYY'));
dbms_output.put_line('Return Date-> '||TO_CHAR(returnd,'DD')||'  Return Month-> '||TO_CHAR(returnd,'MM')||'  Return Year-> '||TO_CHAR(returnd,'YYYY'));
END;