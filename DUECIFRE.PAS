Program Numeri_a_due_cifre;
var A:array[1..10] of integer;
I:integer;
begin
for I:=1 to 10 do
 begin
  write('Scrivi il ',I,'ø numero ');
  readln(A[I]);
 end;
writeln;
writeln('I numeri con 2 cifre sono:');
for I:=1 to 10 do
 begin
  if (A[I] > 9) and (A[I] < 100) then
  writeln(A[I]);
  end;
readln;
end.
