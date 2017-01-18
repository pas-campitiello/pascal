Program intero_e_decimale;
uses CRT;
var n:real;
procedure intdec(x:real);
 begin
  writeln('Parte intera: ',int(x):0:0);
  writeln('Parte decimale: ',frac(x):0:5);
 end;
begin
clrscr;
write('Inserisci un numero reale: ');
readln(n);
intdec(n);
readln;
end.