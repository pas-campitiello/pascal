Program parabola;
uses CRT;
var y:integer;
Procedure disegna(car:char; dove:integer);
 begin
  writeln(car:dove);
 end;
begin
clrscr;
writeln('========= Disegno della parabola di equazione x = y^2 ========');
writeln;
for y:=-8 to 8 do
 disegna('*',y*y);
readln;
end.