Program MCD2;
uses CRT;
var a,b,MCD:integer;
Procedure CalcolaMCD;
begin
while a<>b do
begin
if a>b then a:=a-b
else b:=b-a;
end;
MCD:=a;
writeln('MCD = ',MCD);
end;
begin
clrscr;
writeln('Inserisci due numeri separati da uno spazio');
readln(a,b);
CalcolaMCD;
readln;
end.