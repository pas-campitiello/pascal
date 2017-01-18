PROGRAM Potenza;
Var a,b,p:real;
BEGIN
Writeln('BASE:');
Readln(a);
Writeln('ESPONENTE:');
Readln(b);
P:=exp(b*ln(a));
WriteLn('La potenza con base ',a:0:1,' ed esponente ',b:0:1,' Š uguale a ',P:0:1);
END.
