Program calcolatrice;
uses CRT;
var a,c,d:real;
b:char;
begin
clrscr;
writeln('           |-----------|');
writeln('           |7  8  9  + |');
writeln('           |4  5  6  - |');
Writeln('           |1  2  3  * |');
writeln('           |0  .  =  / |');
writeln('           |-----------|');
writeln;
Writeln('Inserisci il primo numero, il segno e il secondo numero e tra un');
writeln('inserimento e l_altro premi INVIO');
writeln;
readln(a);
readln(b);
readln(c);
writeln;
case b of
'+':writeln(a+c:0:2);
'-':writeln(a-c:0:2);
'*':writeln(a*c:0:2);
'/':writeln(a/c:0:2);
end;
readln;
end.
