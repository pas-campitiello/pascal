Program MCD1;
var n1,n2,MCD:real;
begin
writeln('Scrivi i due numeri');
readln(n1,n2);
while n1<>n2 do
begin
if n1>n2 then n1:=n1-n2
else n2:=n2-n1;
end;
MCD:=n1;
writeln;
writeln('MCD = ',MCD:0:0);
readln;
end.
