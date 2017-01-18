Program Media_allievi;
uses CRT;
var A:array[1..3] of string;
    B,C:array[1..3] of real;
    I,N:integer;
    M:real;
begin
clrscr;
for I:=1 to 3 do
 begin
  writeln('Nome cognome - allievo nø ',I);
  readln(A[I]);
 end;
writeln;
for I:=1 to 3 do
 begin
  writeln('Primo voto riportato in Italiano dall_allievo nø ',I);
  readln(B[I]);
 end;
writeln;
for I:=1 to 3 do
 begin
  writeln('Secondo voto riportato in Italiano dall_allievo nø ',I);
  readln(C[I]);
 end;
writeln;
write('Calcola la media dell_allievo nø ');
readln(N);
writeln;
case N of
1:writeln( (B[1]+C[1])/2:0:2 );
2:writeln( (B[2]+C[2])/2:0:2 );
3:writeln( (B[3]+C[3])/2:0:2 );
end;
readln;
end.