Program suono;
uses Crt;
begin
Sound(220);   { Beep }
Delay(2000);  { Per 2000 ms }
NoSound;      { Stop del suono - Senza questa istruzione il suono continua }
readln;       { fino alla chiusura del programma}
end.