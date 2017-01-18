Program Horner;
uses CRT;
var b:array[1..10] of integer;
    a,c,d,I:integer;
begin
 clrscr;
 writeln('Programma che trasforma un numero binario in decimale con l''algoritmo di Horner');
 writeln('---------------------------------------------------------------------------------');
 writeln;
 writeln('Da quante cifre Š formato il numero binario da trasformare in decimale?');
 readln(a);
 writeln;
 for I:=1 to a do
  begin
   write(I,'¦ cifra da sinistra = ');
   readln(b[I]);
  end;
 c:=2;
 d:=1;
 repeat
  d:=d*2+(B[c]);
  c:=c+1;
 until c=a+1;
 writeln;
 writeln('Il numero binario inserito Š uguale al numero decimale ',d);
 readln;
end.