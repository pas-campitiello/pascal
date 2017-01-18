Program Numero_Maggiore;
var a,b:integer;
Procedure Scambia;
var T:integer;
begin
 T:=a;
 a:=b;
 b:=T;
end;
begin
writeln('Scrivere due numeri');
readln(a,b);
if a>b then Scambia;
writeln('I due numeri in ordine crescente sono ',A,' e ',B);
readln;
end.
