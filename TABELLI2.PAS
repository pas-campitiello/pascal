Program Tabellina;
Var a,b,c:integer;
Begin
Writeln('Scrivi il numero della tabellina');
readln(a);
Writeln('_____Tabellina del ',a);
C:=1;
Repeat
b:=a*c;
Writeln(b);
C:=c+1;
Until C>10;
readln;
End.
