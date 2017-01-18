Program Riduzione_frazioni;
uses CRT;
var N,D,MCD,N1,D1:integer;
Procedure M_C_D (H,K:integer);
var Z,T:integer;
begin
while H<>K do
begin
if H>K then H:=H-K
       else K:=K-H;
end;
MCD:=H;
end;
begin
clrscr;
writeln('Scrivere il numeratore');
readln(N);
writeln('Scrivere il denominatore');
readln(D);
M_C_D (N,D);
N1:=N div MCD; D1:=D div MCD;
writeln('La frazione ridotta Š ',N1,' / ',D1);
readln;
end.
