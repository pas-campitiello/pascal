Program Traduci;
uses CRT;
var A:array[1..3] of string;
B:array[1..3] of string;
I:integer;
P:string;
begin
clrscr;
for I:=1 to 3 do
 begin
  writeln('Parola italiana nø ',I);
  readln(A[I]);
 end;
writeln;
for I:=1 to 3 do
 begin
  writeln('Traduzione in inglese della parola italiana nø ',I);
  readln(B[I]);
 end;
writeln;
writeln('TRADUZIONE---');
for I:=1 to 3 do
 begin
  writeln(A[I],' = ',B[I]);
 end;
readln;
end.