program funzione_exp;
uses CRT;
var x:real;
begin
 clrscr;
 writeln('La funzione EXP(x) eleva "e" (numero di Nepero, uguale a 2,71828182850');
 writeln('base dei logaritmi naturali) a "x" (numero reale).');
 writeln;
 write('Inserisci x: ');
 readln(x);
 writeln;
 writeln('EXP(',x:0:5,') = ',exp(x):0:12);
 readln
end.
