Program Pari_Dispari;
uses CRT;
var A:array[1..10] of integer;
    I:integer;
begin
clrscr;
for I:=1 to 10 do
 begin
  writeln('Scrivi il ',I,'ø numero');
  readln(A[I]);
 end;
writeln;
writeln('I numeri pari sono:');
for I:=1 to 10 do
 begin
  if (A[I] mod 2) = 0 then
  writeln(A[I]);
 end;
writeln;
writeln('I numeri dispari sono:');
for I:=1 to 10 do
 begin
   if (A[I] mod 2) <> 0 then
     writeln(A[I]);
   end;
readln;
end.