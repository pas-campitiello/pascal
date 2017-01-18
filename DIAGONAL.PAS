Program diagonale;
uses CRT;
Var a,D:real;
Begin
clrscr;
Writeln('Scrivi il numero dei lati del poligono');
Readln(a);
D:=(a*(a-3))/2;
Writeln('Le diagonali di questo poligono sono ',D:8:1);
readln;
End.