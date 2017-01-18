Program SommaVettori;
uses CRT;
var A:array[1..5] of integer;
    B:array[1..5] of integer;
    C,I:integer;
begin
clrscr;
for I:=1 to 5 do
 begin
  writeln('Scrivi il ',I,'ø numero');
  readln(A[I]);
 end;
writeln;
for I:=1 to 5 do
 begin
  writeln('Scrivi il ',I,'ø numero');
  readln(B[I]);
 end;
writeln;
writeln('La somma dei vettori Š');
for I:=1 to 5 do
 begin
  C:=A[I]+B[I];
  writeln(C);
 end;
readln;
end.