Program Fattoriale2;
var N,I:integer;
Fattoriale:longint;
begin
writeln('Scrivere il numero di cui si vuole calcolare il fattoriale');
readln(N);
Fattoriale:=1;
if N>0 then
for I:=1 to N do Fattoriale:=Fattoriale*I;
writeln;
writeln('Il fattoriale di ',N,' Š ',Fattoriale);
writeln;
readln;
end.