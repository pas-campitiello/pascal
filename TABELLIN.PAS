Program Tabellina;
Const a=SCRIVI QUI IL NUMERO DELLA TABELLINA;
Var b,c:integer;
Begin
Writeln('_____Tabellina del ',a);
C:=1;
Repeat
b:=a*c;
Writeln(b);
C:=c+1;
Until C>10;
End.
